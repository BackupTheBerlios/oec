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
            
            <c:if test="${param.Filter == 1 || (param.Filter == 0 || empty param.Filter)}" >
                <sql:query var="Courses">
                    SELECT course.CID, course.cName, teach.date ,  teach.TID FROM course,teach                 
                    WHERE teach.CID = course.CID  AND teach.TID = ? 
                    <sql:param value="${User.TID}" />
                </sql:query>
            
            
            
                <c:forEach items="${Courses.rows}" var="course">
                    <tr>
                        <td>${course.cName}</td>
                        <td>${course.date}</td>
                        <td>
                            <a href="CP.jsp?action=course&subaction=delete&CID=${course.CID}">Delete</a>

                        </td>
                    </tr>
                </c:forEach>   
            </c:if>
            
            
            <c:if test="${param.Filter == 2 || ( param.Filter == 0 || empty param.Filter)}" >
                <sql:query var="Courses">
                    SELECT course.CID, course.cName, teach.date ,  teach.TID FROM course,teach                 
                    WHERE teach.CID = course.CID 

                    AND course.CID NOT IN (SELECT teach.CID FROM teach, course WHERE teach.CID=course.CID AND teach.TID = ?)
                    <sql:param value="${User.TID}" />              
                
                </sql:query>
                <c:forEach items="${Courses.rows}" var="course">
                    <tr>
                        <td>${course.cName}</td>
                        <td>${course.date}</td>
                        <td>
                            <a href="CP.jsp?action=course&subaction=add&CID=${course.CID}">Add</a>
                        </td>
                    </tr>
                </c:forEach>  
            </c:if>
            
        </table>
    </table>
</form>
