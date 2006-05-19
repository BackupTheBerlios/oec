<%--

FILE DESCRIPTION:
Delete this course from my list

CREATION DATE / BY:
24 April 2006 BY Abbas Adel

LAST MODIFY / BY:
24 April 2006 BY Abbas Adel

MODIFICATIONS:
1- by hamada    date:28/4/2005

REQUEST VARIABLES:
CID:int 			Course id to add
User:sessionObject  Contains all user information about user found in Teacher table                 


TO DO:
1- if CID is empty, forward a message error
2- delete CID of current teacher from "Teach" table, then forward a confirmation message

JOb FOR:
Hamada
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib  prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

 <c:if test="${empty param.CID}" >
     <jsp:forward page="../CP.jsp?action=course&subaction=list" >
         <jsp:param name="ErrorMessage" 
         value="Please press on <b>'Delete'</b> link in the <b>\"Delete List\"</b>"/>
     </jsp:forward>
 </c:if>


<c:set var="subsectionTitle" value="Delete Course" scope="request"/>


<!-- Forward and display error message if CID is not recieved --!>

<sql:update>
    DELETE FROM Teach
    WHERE TID=? AND CID=?
   <sql:param value="${User.TID}"/> 
   <sql:param value="${param.CID}"/>
</sql:update>

<jsp:forward page="../CP.jsp?action=course&subaction=list">
    
    <jsp:param name="NormalMessage"
    value="Successfuly the course is deleted from your account"/>
</jsp:forward>