<%--

FILE DESCRIPTION:
Delete ONE question from Question Table

CREATION DATE / BY:
18 April 2006 BY Abbas Adel

LAST MODIFY / BY:
18 April 2006 BY Abbas Adel

MODIFICATIONS:
1- Just created

REQUEST VARIABLES:
QID:int                 Question ID to delete

RESPONSE VARIABLES:
NormalMessage:String    Message to send if success
ErrorMessage:String     Message to send if failure

TO DO:
1- Delete the question
2- Delete all Options
3- Redirect to "../CP.jsp?action=question&subaction=list" and send the appropriate message 

JOP TO:
Hamada

--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<sql:update var = "DeltedOptions">
    DELETE FROM `option`
    WHERE `option`.QID = ?
    <sql:param value="${param.QID}" />
</sql:update>

<sql:update var="Deletedquestion " >
    DELETE FROM `question`
    WHERE `question`.QID = ?
    <sql:param value="${param.QID}" />
</sql:update>

<jsp:forward page="../CP.jsp?action=question&subaction=list" >
        <jsp:param name="NormalMessage" 
        value="Question has Deleted correctly"/>
    </jsp:forward>