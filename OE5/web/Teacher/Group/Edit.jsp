<%--

FILE DESCRIPTION:
Edit ONE question from Question Table

CREATION DATE / BY:
18 April 2006 BY Abbas Adel

LAST MODIFY / BY:
18 April 2006 BY Abbas Adel

MODIFICATIONS:
1- Just created

REQUEST VARIABLES:
GID:int             Question ID to edit
User:sessionObject  Contains all user information about user found in Teacher table                 

RESPONSE VARIABLES:
GID:int
gname:String
SID[]:int

TO DO:
1- List this Teacher courses where the Question's Course is selected in the menu
	& the CID of the course is printed in the "value" atripute ex. value="15" 
2- Show Question in the text area
3- List all options of the Question and check the radio button of the selectedOption
4- All more empty textbox to allaw more options to be added
5- Total number of all Options MUST NOT exceed 10 options
6- Pass QID to the next page usig hiddin input

JOP TO:
Islam Negm

--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>

<c:if test="${empty param.GID}" >
    <jsp:forward page="../CP.jsp?action=group&subaction=list" >
        <jsp:param name="ErrorMessage" 
        value="Please press on <b>'Edit'</b> link in the <b>\"Group List\"</b>"/>
    </jsp:forward>
</c:if>
<c:set var="subsectionTitle" value="Edit Group" scope="request"/>
        
<form method="post" action="CP.jsp?action=group&subaction=edit_update">

    <%-- Store QID value here --%>
    <input type="hidden" name="GID" value="${param.GID}" />
    <%-- List teacher's courses here --%>
    <sql:query var="Group" >
        SELECT `group`.gname FROM `group` where `group`.gid=${param.GID}
    </sql:query>
    <p>       
        <label>Group name :</label>
        <input name="gname" type="text" value="${Group.rows[0].gname}" />
    </p>

    <table width="100%" cellpadding="2" cellspacing="2" class="list">
        <tr>
            <th colspan="2">Students' Names</th>
        </tr>
        
        <%-----------------------------------------------------------------------%>
        <%--<sql:query var="MyStudents" >
        SELECT `student`.SNAME ,`student`.SID
        FROM `student`,`assign`
        WHERE `student`.SID =`assign`.SID
        AND `assign`.GID=${param.GID}             
        </sql:query>
         
        <c:forEach items="${MyStudents.rows}" var="student">
        <tr>
        <td> <input name="QID" type="checkbox"  value="${student.SID}" > </td>
        <td><label>${student.sname}</label></td>
        </tr>
        </c:forEach>--%>
        <%-----------------------------------------------------------------------%>       
        <sql:query var="MyStudents" >
            SELECT `Student`.sname ,`Student`.SID
            FROM `Student`             
        </sql:query>
         
        <c:forEach items="${MyStudents.rows}" var="student">
            <tr>
                <td width="10"> <input name="SID" type="checkbox"  value="${student.SID}" > </td>
                <td>${student.sname}</td>
            </tr>
        </c:forEach>
    </table>
    <p>
        <input type="submit"  value="Submit">
        <input type="reset"  value="Reset">
    </p>
</form>
