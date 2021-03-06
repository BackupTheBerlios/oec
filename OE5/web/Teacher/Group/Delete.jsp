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
<%@taglib  prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<c:if test="${empty param.GID}" >
    <jsp:forward page="../CP.jsp?action=group&subaction=list" >
        <jsp:param name="ErrorMessage" 
        value="Please press on <b>'Delete'</b> link in the <b>\"Group List\"</b>"/>
    </jsp:forward>
</c:if>
<c:set var="subsectionTitle" value="Delete Group" scope="request"/>

<%--DELETING THE QUESTION  DATA FROM THE ASSIGN TABLE--%>
<sql:update>
    DELETE FROM `Assign`
    WHERE `Assign`.GID=?
    <sql:param value="${param.GID}"/>    
</sql:update>
<%--DELETING THE QUESTION  DATA FROM THE GROUP TABLE--%>
<sql:update>
    DELETE FROM `Group`
    WHERE GID=?
    <sql:param value="${param.GID}"/>    
</sql:update>


    <jsp:forward page="../CP.jsp?action=group&subaction=list" >
        <jsp:param name="NormalMessage" 
        value="Deleted Successfully"/>
    </jsp:forward>
