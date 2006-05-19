<%--

FILE DESCRIPTION:
View question and its options

CREATION DATE / BY:
26 April 2006 BY Abbas Adel

LAST MODIFY / BY:
26 April 2006 BY Abbas Adel

MODIFICATIONS:
1- Just created

REQUEST VARIABLES:
QID:int             Question ID to edit
User:sessionObject  Contains all user information about user found in Teacher table                 

RESPONSE VARIABLES:
QID:int  

TO DO:
1-show course name of the question
2- show question
3- show auther
4- show all option and mark the selected option
5- forward to edit and pass NOEDIT variable



--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>

<c:if test="${empty param.QID}" >
    <jsp:forward page="../CP.jsp?action=question&subaction=list" >
        <jsp:param name="ErrorMessage" 
        value="Please press on <b>'View'</b> link in the <b>\"Question List\"</b>"/>
    </jsp:forward>
</c:if>

<c:set var="subsectionTitle" value="View Question" scope="request"/>

<form method="post">

    <%-- Store QID value here --%>
    <input type="hidden" name="CID"  value="${param.CID}">
    <%-----------------------------------------------------------------------------------------------------%>
    
    <%-- List teacher's courses here --%>
    <sql:query  var="questionoptions"> 
        SELECT `Option`.OID ,`Option`.`oname`,`Question`.question , `Question`.QID
        FROM `Teacher`,`Course`,`Question`,`Option`
        WHERE `Teacher`.TID=`Question`.TID
        AND `Course`.CID =?
        AND `Question`.QID = ?
        AND `Question`.TID = `Teacher`.TID
        AND `Question`.CID = `Course`.CID
        AND `Option`.QID = `Question`.QID
        <sql:param value="${param.CID}" />
        <sql:param value="${param.QID}" />
    </sql:query>
    <sql:query var="Correctanswer">
        SELECT OID
        FROM `Question`
        WHERE `Question`.QID = ?
        <sql:param value="${param.QID}"/>
    </sql:query>
    <p>
        <label>Question:<br />
        </label>
        <textarea  name="question" cols="50" >
            ${questionoptions.rows[0].question}
        </textarea>
    </p>
    <p><label>Options:</label>
    </p>
    <p>
        <c:forEach items="${questionoptions.rows}" var="questionoption">
            <c:choose>
                <c:when test="${questionoption.OID == Correctanswer.rows[0].OID}">
                    <input name="selectedOption[${param.QID}]" type="radio" checked="true" value="${questionoption.OID}">  
                </c:when>
                <c:otherwise>
                    <input name="selectedOption[${param.QID}]" type="radio" value="${questionoption.OID}">
                </c:otherwise>
            </c:choose>
            <input name="option[${param.QID}]" type="text" value="${questionoption.oname}" size="50" maxlength="100" selected="selected">
            <br />   
        </c:forEach>
    </p>
</form>





