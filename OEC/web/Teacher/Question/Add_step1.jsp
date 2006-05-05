<%--

FILE DESCRIPTION:
Select couser name, number of question, max number of options

CREATION DATE / BY:
18 April 2006 BY Abbas Adel

LAST MODIFY / BY:
18 April 2006 BY Abbas Adel

MODIFICATIONS:
1- Just created

TO DO:
1- Modify the HTML presentation
2- Validation

JOP FOR:
Abbas Adel

--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>

<form method="post" action="CP.jsp?action=question&subaction=add&step=2">
    <table width="100%" cellspacing="2" cellpadding="2">
        <tr>
            <td width="100"><label>Select Course:</label>
            </td>
            <td width="75%"><select name="CID">
                <sql:query var="courses"> 
                    SELECT DISTINCT Course.cname as cname, Course.CID as CID 
                    FROM Course, Teach, `teacher` 
                    WHERE  `teach`.CID = `course`.CID
                    AND `teacher`.TID = ?
                    AND `teacher`.TID = `teach`.TID
                      
                    <sql:param value="${User.TID}"/>
                </sql:query>
                <c:forEach items="${courses.rows}" var="row">
                    <option value="${row.CID}">${row.cname}</option>
                </c:forEach>
            </select>
            </td>
        </tr>
        <tr>
            <td><label>Number of questions:</label>
            </td>
            <td><select name="questions">
                <c:forEach begin="1" end="10" var="Qnum">
                    <option value="${Qnum}">${Qnum}</option>
                </c:forEach>
            </select></td>
        </tr>
        <tr>
            <td><label>Maximum number of options:</label>
            </td>
            <td><select name="options">
                <c:forEach begin="2" end="10" var="Onum">
                    <option value="${Onum}">${Onum}</option>
                </c:forEach>
            </select></td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td><input type="submit" name="Submit" value="Submit" /></td>
        </tr>
    </table>
</form>
