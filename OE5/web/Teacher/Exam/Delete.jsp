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
QID:int               Question ID to delete


TO DO:
1- Delete the question
2- Delete all Options
3- Redirect if success to "../CP.jsp?action=question&subaction=list"

JOP TO:
Islam Negm

--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>

<c:set var="subsectionTitle" value="Delete Exam" scope="request"/>

<c:if test="${empty param.EID}" >
    <jsp:forward page="../CP.jsp?action=exam&subaction=list" >
        <jsp:param name="ErrorMessage" 
        value="Please press on <b>'Delete'</b> link in the <b>\"Exam List\"</b>"/>
    </jsp:forward>
</c:if>
        

<sql:update var="DeletedQuestion">
    DELETE FROM `takeexam`
    WHERE `takeexam`.EID=?
    <sql:param value="${param.EID}"/>
</sql:update>

<sql:update var="DeletedExam">
    DELETE FROM `exam`
    WHERE `exam`.EID=?
    <sql:param value="${param.EID}"/>
</sql:update>

<jsp:forward page="../CP.jsp?action=exam&subaction=list" >
    <jsp:param name="NormalMessage" 
    value="Exam has Deleted correctly"/>
</jsp:forward>