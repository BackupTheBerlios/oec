<%--

FILE DESCRIPTION:
Show user messages

CREATION DATE / BY:
6 May 2006 BY Abbas Adel, Tanahy

LAST MODIFY / BY:
6 May 2006 BY Abbas Adel, Tanahy

MODIFICATIONS:
1- Just created

REQUEST VARIABLES:
User:sessionObject  Contains all user information about user found in Teacher table                 


TO DO:
1- Show latest User Messages in top
2- the rest after

JOP TO:
Abbas Adel

--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>

<c:set var="subsectionTitle" value="Inbox" scope="request"/>

<sql:query var="NewMessages">
    SELECT Message.message, Message.ID, Message.MID, Message.Type, Message.mdate 
    FROM Message, Teacher
    WHERE Message.UID = Teacher.TID AND Message.User = 'teacher' AND Message.UID = ?
    AND Message.mdate > ?
    <sql:param value="${User.TID}" />
    <sql:param value="${User.login}" />
</sql:query>

<c:if test="${NewMessages.rowCount > 0}" >
    <table width="100%" cellspacing="2" cellpadding="2" class="list">
        <tr>
            <th>Recent Message</th>
            <th width="150">Date</th>
            <th width="100">Action</th>
        </tr>
        <c:forEach items="${NewMessages.rows}" var="Message">
            <tr>
                <td>${Message.message}</td>
                <td align="center" nowrap="nowrap">${Message.mdate}</td>
                <td align="center"><a href="CP.jsp?action=status&subaction=delete&MID=${Message.MID}" onclick=" return confirm('Are you sure?');">Delete</a></td>
            </tr>
        </c:forEach>
    </table>
</c:if>

<sql:query var="OldMessages">
    SELECT Message.message, Message.ID, Message.MID, Message.Type, Message.mdate 
    FROM Message, Teacher
    WHERE Message.UID = Teacher.TID AND Message.User = 'teacher' AND Message.UID = ?
    AND Message.mdate <= ?
    <sql:param value="${User.TID}" />
    <sql:param value="${User.login}" />
</sql:query>

<c:if test="${OldMessages.rowCount > 0}" >
    <table width="100%" cellspacing="2" cellpadding="2" class="list">
        <tr>
            <th >Old Message</th>
            <th width="150" >Date</th>
            <th width="100">Action</th>
        </tr>
        <c:forEach items="${OldMessages.rows}" var="Message">
            <tr>
                <td>${Message.message}</td>
                <td align="center" nowrap="nowrap">${Message.mdate}</td>
                <td align="center"><a href="CP.jsp?action=status&subaction=delete&MID=${Message.MID}">Delete</a></td>
            </tr>
        </c:forEach>
    </table>
</c:if>

<c:if test="${NewMessages.rowCount == 0 &&  OldMessages.rowCount == 0}" >
    <c:set var="ErrorMessage" value='There is no messages in your inbox' scope="session" />
     <jsp:forward page="../CP.jsp?action=status&subaction=summary" />
</c:if>