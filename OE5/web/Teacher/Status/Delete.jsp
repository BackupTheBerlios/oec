<%--

FILE DESCRIPTION:
Delete Message

CREATION DATE / BY:
6 May 2006 BY Abbas Adel, Tanahy

LAST MODIFY / BY:
6 May 2006 BY Abbas Adel, Tanahy

MODIFICATIONS:
1- Just created

REQUEST VARIABLES:
User:sessionObject  Contains all user information about user found in Teacher table                 
MID:int             Message ID


TO DO:
1- Delete Message

JOP TO:
Tanahy

--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<sql:update>
    DELETE FROM Message WHERE Message.MID = ?
    <sql:param value="${param.MID}"/>
</sql:update>

<jsp:forward page="../CP.jsp?action=status&subaction=messages" >
    <jsp:param name="NormalMessage"
    value="The message is deleted succefully from your inbox"/>
</jsp:forward>
