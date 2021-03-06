<%--

FILE DESCRIPTION:
Student List

CREATION DATE / BY:
2 May 2006 BY Abbas Adel

LAST MODIFY / BY:
2 May 2006 BY Abbas Adel

MODIFICATIONS:
1- 

REQUEST VARIABLES:
User:Session        all user information (TID)

RESPONSE VARIABLES:
SID:int                 Student ID

TO DO:
1- List all student related to this teacher (assigned to any of his groubs)
2- make the action (View) redirect to (CP.jsp?action=student&subaction=view&SID=???)

JOP FOR:
Hamada

--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<form>
    <table width="100%" cellspacing="2" cellpadding="2">
        <tr>
            <td align="right">
                <select name="GID" onchange="MM_jumpMenu('parent',this,0)">
                    <option value="CP.jsp?action=student&subaction=list&GID=0">All</option>
                    <option value="CP.jsp?action=student&subaction=list&GID=1">gorub1</option>
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
                        SELECT  student.SID, student.SName, assign.GID
                        FROM student,assign
                        WHERE student.SID=assign.SID
                        AND assign.GID in(SELECT `group`.GID FROM `group` 
                               
                        <c:choose>
                            <c:when test="${param.GID==0 || empty param.GID}">
                                WHERE `group`.TID=?
                                <sql:param value="${User.TID}" />                                                           
                            </c:when>
                            <c:when test="${param.GID==assign.GID}">
                                WHERE `group`.TID=?
                                <sql:param value="${User.TID}" />
                                AND `group`.GID=?
                                <sql:param value="${param.GID}"/>
                            </c:when>                
                        </c:choose>
                        ) GROUP BY student.SID
                    </sql:query>
                    <c:forEach items="${students.rows}" var="student">
                        <tr>
                            <td>${student.sname}</td>
                            <td>--</td>
                            <td align="center"><a href="CP.jsp?action=student&subaction=view&SID=${student.SID}">View</a></td>
                        </tr>
                    </c:forEach>
                </table>
            </td>
        </tr>
    </table>
</form>

