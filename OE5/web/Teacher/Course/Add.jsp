<%--

FILE DESCRIPTION:
Add this course  to my list

CREATION DATE / BY:
24 April 2006 BY Abbas Adel

LAST MODIFY / BY:
24 April 2006 BY Abbas Adel

MODIFICATIONS:
1- by hamada zahera date:28/4/2005

REQUEST VARIABLES:
CID:int 			Course id to add
User:sessionObject  Contains all user information about user found in Teacher table                 


TO DO:
1- if CID is empty, forward a message error
2- add CID to current teacher in "Teach" table, then forward a confirmation message

JOb FOR:
Hamada

--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>


<c:if test="${empty param.CID}" >
    <jsp:forward page="../CP.jsp?action=course&subaction=list" >
        <jsp:param name="ErrorMessage" 
        value="Please press on <b>'Add'</b> link in the <b>\"Course List\"</b>"/>
    </jsp:forward>
</c:if>

<c:set var="subsectionTitle" value="Add New Course" scope="request"/>



<sql:update>
    INSERT INTO Teach
    VALUES(?,?,NULL)
    <sql:param value="${param.CID}"/>
    <sql:param value="${User.TID}"/>
    
</sql:update> 
<jsp:forward page="../CP.jsp?action=course&subaction=list" >
    <jsp:param name="NormalMessage"
    value="Successfully the course is added into your account"/>
</jsp:forward>