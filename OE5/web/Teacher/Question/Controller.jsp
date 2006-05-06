<%--

FILE DESCRIPTION:
Controls the Question Control Action

CREATION DATE / BY:
18 April 2006 BY Abbas Adel

LAST MODIFY / BY:
18 April 2006 BY Abbas Adel

JOP FOR:
Abbas Adel

--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

 <div id="SectionTitle"><b>Question Control</b> </div>
<c:if test="${! empty param.ErrorMessage}"><div id="ErrorMessage" ><b>Error:</b><p><c:out value="${param.ErrorMessage}" escapeXml="false" /></p></div></c:if>
<c:if test="${! empty param.NormalMessage}"><div id="NormalMessage"><b>Message:</b><p><c:out value="${param.NormalMessage}" escapeXml="false" /></p></div></c:if>


<c:choose>
    <c:when test="${param.subaction == 'add'}"><jsp:include page="Add.jsp" /></c:when>
    <c:when test="${param.subaction == 'delete'}"> <jsp:include page="Delete.jsp" /></c:when>
    <c:when test="${param.subaction == 'edit'}"><jsp:include page="Edit.jsp" /> </c:when>
    <c:when test="${param.subaction == 'edit_update'}"><jsp:include page="edit_update.jsp" /></c:when>
    <c:when test="${param.subaction == 'view'}"><jsp:include page="View.jsp" /></c:when>    
    <c:otherwise> <jsp:include page="List.jsp" /></c:otherwise>
</c:choose>

<script language="javascript">
    setSectionTitle(' &raquo; <c:out value="${subsectionTitle}" />');
</script>
