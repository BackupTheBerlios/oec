<%--

FILE DESCRIPTION:
List all Courses in the sestem

CREATION DATE / BY:
24 April 2006 BY Abbas Adel

LAST MODIFY / BY:
24 April 2006 BY Abbas Adel

MODIFICATIONS:
1- by hamada   date:28/4/2005

REQUEST VARIABLES:
User:sessionObject  Contains all user information about user found in Teacher table                 


TO DO:
1- if Filter = 1 list my courses if Filter = 2 list not my courses otherwise list all question, 
2- if current row contain my course, make the action (delete)
3- if current row contain other course, make the action (add)
4- Didplay the date of my courses only

JOb FOR:
Hamada

--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib  prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<c:set var="subsectionTitle" value="List Questions" scope="request"/>
<form method="post" action="CP.jsp?action=course&subaction=delete">
    <table width="100%" cellspacing="2" cellpadding="2">
        <tr>
            <td align="right"><label><em><u> Filter by:</u></em>: </label>
                <select name="Filter" onchange="MM_jumpMenu('parent',this,0)">
                    <option value="CP.jsp?action=course&subaction=list&Filter=0" ${param.Filter==0?"selected":""}>All</option>
                    <option value="CP.jsp?action=course&subaction=list&Filter=1" ${param.Filter==1?"selected":""}>Your Courses</option>
                    <option value="CP.jsp?action=course&subaction=list&Filter=2" ${param.Filter==2?"selected":""}>Other Courses</option>
                </select>
            </td>
        </tr>
        <tr>
        <td>
        <table width="100%" cellpadding="2" cellspacing="2" class="list">
            <tr>
           
                <th width="45%">Course Name </th>
                <th width="35%">Assign Date</th>
                <th width="18%">Action</th>
            </tr>
            <tr>
            <%-- the course according to the login data --%>
            

            <sql:query var="Courses">
                <c:choose >
                    <c:when test="${param.Filter == 1}" >
                        SELECT Course.CID, Course.cname, Teach.date ,  Teach.TID FROM Course,Teach                 
                        WHERE Teach.CID = Course.CID  AND Teach.TID = ?                     
                        <sql:param value="${User.TID}" />
                    </c:when>
                    <c:when test="${param.Filter == 2}" >
                        SELECT Course.CID, Course.cname
                        FROM Course               
                        WHERE course.CID NOT IN (SELECT Teach.CID FROM Teach WHERE Teach.TID = ?)
                    <sql:param value="${User.TID}" />
                    </c:when>
                    <c:otherwise>
                        SELECT Course.CID, Course.cname, Teach.date ,  Teach.TID FROM Course,Teach                 
                        WHERE Teach.CID = Course.CID  AND Teach.TID = ? 
                        <sql:param value="${User.TID}" />
                        UNION
                        SELECT Course.CID, Course.cname, null, null
                        FROM Course               
                        WHERE Course.CID NOT IN (SELECT Teach.CID FROM Teach WHERE Teach.TID = ?)
                        <sql:param value="${User.TID}" />
                    </c:otherwise>
                </c:choose>
                    
            </sql:query>

               
                
            
            <c:forEach items="${Courses.rows}" var="course">
                <tr>
                    <td>${course.cname}</td>
                    <td>${course.date}</td>
                    <td>
                        <c:if test="${User.TID == course.TID}" >
                            <a href="CP.jsp?action=course&subaction=delete&CID=${course.CID}">Delete</a>
                        </c:if>
                        <c:if test="${User.TID != course.TID}" >
                            <a href="CP.jsp?action=course&subaction=add&CID=${course.CID}">Add</a>
                        </c:if>
                    </td>
                </tr>
            </c:forEach>   

        </table>
    </table>
</form>
