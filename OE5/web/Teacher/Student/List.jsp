<%--

FILE DESCRIPTION:
Student List

CREATION DATE / BY:
2 May 2006 BY Abbas Adel

LAST MODIFY / BY:
2 May 2006 BY Abbas Adel
9 may 2006 By hamada 

MODIFICATIONS:
1- done

REQUEST VARIABLES:
User:Session        all user information (TID)

RESPONSE VARIABLES:
SID:int                 Student ID

TO DO:
1- List all student related to this teacher (assigned to any of his groubs)
2- make the action (View) redirect to (CP.jsp?action=student&subaction=view&SID=???)

JOB FOR:
Hamada

--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>

<c:set var="subsectionTitle" value="List Students" scope="request"/>

<form>
    <table width="100%" cellspacing="2" cellpadding="2">
        <tr>
            <td align="right">
                <select name="GID" onchange="MM_jumpMenu('parent',this,0)">
                    <option value="CP.jsp?action=student&subaction=list&GID=0" ${param.GID==0?"selected":""}>All</option>
                    <option value="CP.jsp?action=student&subaction=list&GID=1" ${param.GID==1?"selected":""}>gorub1</option>
                </select>
            </td>
        </tr>
        <tr>
            <td>
                <table width="100%" cellspacing="2" cellpadding="2" class="list">
                    <tr>
                        <th>Student Name</th>
                        <th>Number of groubs</th>
                        <th>Action</th>
                    </tr>
                    <sql:query var="students">
                        SELECT   Student.SID, Student.sname, `Assign`.GID
                        FROM Student,`Assign`
                        WHERE Student.SID=`Assign`.SID
                        AND `Assign`.GID  IN(SELECT `Group`.GID FROM `Group` 
                               
                        <c:choose>
                            <c:when test="${param.GID==0 || empty param.GID}">
                                WHERE `Group`.TID=?
                                <sql:param value="${User.TID}" />                                                 
                            </c:when>
                            <c:when test="${param.GID==Assign.GID}">
                                WHERE `Group`.TID=?
                                <sql:param value="${User.TID}" />
                                AND `group`.GID=?
                                <sql:param value="${param.GID}"/>
                            </c:when>                
                        </c:choose>
                        ) GROUP BY Student.SID
                    </sql:query>
                   
                    
                    
                                  
                    <c:forEach items="${students.rows}" var="student">
                        <sql:query var="group" >  
                        SELECT COUNT(*) AS `count` FROM 
                        `Assign`
                        WHERE SID=?
                        <sql:param value="${student.SID}"/>  
                    </sql:query>                             
                                                   
                        <tr>
                            <td>${student.sname}</td>
                            <td>${group.rows[0]['']}</td>                     
                            <td align="center"><a href="CP.jsp?action=student&subaction=view&SID=${student.SID}">View</a></td>
                        </tr>
                    </c:forEach>    
                </table>
            </td>
        </tr>
    </table>
</form>

