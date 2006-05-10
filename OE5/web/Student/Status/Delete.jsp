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

<c:if test="${empty param.EID}" >
    <c:set var="ErrorMessage" value='Please press on <b>"Delete"</b> link in the <b>\"Message List\"</b>' scope="session" />
    <c:redirect url="../CP.jsp?action=exam&subaction=list" />
</c:if>

<sql:update>
    DELETE FROM Message WHERE message.MID = ?
    <sql:param value="${param.MID}"/>
</sql:update>


<c:set var="ErrorMessage" value='The message is deleted succefully from your inbox' scope="session" />
<c:redirect url="../CP.jsp?action=status&subaction=messages" />
    

