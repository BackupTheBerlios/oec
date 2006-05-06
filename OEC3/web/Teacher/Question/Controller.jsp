<%--

FILE DESCRIPTION:
Controls the Question Control Action

CREATION DATE / BY:
18 April 2006 BY Abbas Adel

LAST MODIFY / BY:
18 April 2006 BY Abbas Adel

MODIFICATIONS:
1- 

TO DO:
1- 

JOP FOR:
Abbas Adel

--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

 <div id="SectionTitle">
     <b>Question Control</b>
 </div>
<c:if test="${! empty param.ErrorMessage}">
    <div id="ErrorMessage" >
        <b>Error:</b>
        <p>
            <c:out value="${param.ErrorMessage}" escapeXml="false" />
        </p>
    </div>
</c:if>

<c:if test="${! empty param.NormalMessage}">
    <div id="NormalMessage">
        <b>Message:</b>
        <p>
            <c:out value="${param.NormalMessage}" escapeXml="false" />
        </p>
    </div>
</c:if>

<c:choose>
    <c:when test="${param.subaction == 'add'}">
        <c:set var="subsectionTitle" value="Add New Question" scope="request"/>
        <jsp:include page="Add.jsp" />
    </c:when>
    <c:when test="${param.subaction == 'delete'}">
        <c:set var="subsectionTitle" value="Delete Question" scope="request"/>

        <c:if test="${empty param.QID}" >
            <jsp:forward page="../CP.jsp?action=question&subaction=list" >
                <jsp:param name="ErrorMessage" 
                value="Please press on <b>'Delete'</b> link in the <b>\"Question List\"</b>"/>
            </jsp:forward>
        </c:if>
        
        <jsp:include page="Delete.jsp" />
    </c:when>
    <c:when test="${param.subaction == 'edit'}">
        <c:set var="subsectionTitle" value="Edit Question" scope="request"/>

        <c:if test="${empty param.QID}" >
            <jsp:forward page="../CP.jsp?action=question&subaction=list" >
                <jsp:param name="ErrorMessage" 
                value="Please press on <b>'Edit'</b> link in the <b>\"Question List\"</b>"/>
            </jsp:forward>
        </c:if>
        <jsp:include page="Edit.jsp" />
    </c:when>
    <c:when test="${param.subaction == 'edit_update'}">
        <c:set var="subsectionTitle" value="Add New Question" scope="request"/>
        <jsp:include page="edit_update.jsp" />
    </c:when>
    <c:when test="${param.subaction == 'view'}">
        <c:set var="subsectionTitle" value="View Question" scope="request"/>

        <%-- Forward and display error message if QID is not recieved --%>
        <c:if test="${empty param.QID}" >
            <jsp:forward page="../CP.jsp?action=question&subaction=list" >
                <jsp:param name="ErrorMessage" 
                value="Please press on <b>'View'</b> link in the <b>\"Question List\"</b>"/>
            </jsp:forward>
        </c:if>
        <jsp:include page="View.jsp" />
        
    </c:when>
    
    <c:otherwise>
        <c:set var="subsectionTitle" value="List Questions" scope="request"/>
        <jsp:include page="List.jsp" />
    </c:otherwise>
</c:choose>

<script language="javascript">
    setSectionTitle(' &raquo; <c:out value="${subsectionTitle}" />');
</script>
