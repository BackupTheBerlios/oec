<%--

FILE DESCRIPTION:
Select course name and insert exam name, start date of exam and end date

CREATION DATE / BY:
26 April 2006 BY Abbas Adel

LAST MODIFY / BY:
26 April 2006 BY Abbas Adel

MODIFICATIONS:
1- Just created

TO DO:
1- select course name
2- insert exam name
3- start and end date

JOP FOR:
Abbas Adel

--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>

<form action="CP.jsp?action=exam&subaction=add&step=2" method="post" onsubmit="MM_validateForm('ename','','R');return document.MM_returnValue" >
    <table width="100%" cellspacing="2" cellpadding="2">
        <tr>
            <td width="135"><label>Select Course:</label>            </td>
            <td width="743"><select name="CID">
                <sql:query var="courses"> 
                    SELECT DISTINCT Course.cname, Course.CID FROM Course, Teach, Question 
                    WHERE  Question.CID = Course.CID AND Course.CID = Teach.CID  AND Teach.TID = ? 
                    <sql:param value="${User.TID}"/>
                </sql:query>
                
                <c:forEach items="${courses.rows}" var="row">
                    <option value="${row.CID}">${row.cname}</option>
                </c:forEach>
            </select>
            </td>
        </tr>
        <tr>
            <td><label>Exam Name: </label></td>
            <td><input name="ename" type="text" /></td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td><input type="submit" value="   Next   " /></td>
        </tr>
    </table>
</form>
