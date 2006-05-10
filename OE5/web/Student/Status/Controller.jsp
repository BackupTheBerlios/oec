<%--

FILE DESCRIPTION:
Controls the Question Control Action

CREATION DATE / BY:
18 April 2006 BY Abbas Adel

LAST MODIFY / BY:
6 May 2006 BY Abbas Adel


JOP FOR:
Abbas Adel

--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div id="SectionTitle"><b>Status</b></div>
<c:if test="${! empty ErrorMessage}"><div id="ErrorMessage" ><b>Error:</b><p><c:out value="${ErrorMessage}" escapeXml="false" /></p></div><c:remove var="ErrorMessage" /></c:if>
<c:if test="${! empty NormalMessage}"><div id="NormalMessage"><b>Message:</b><p><c:out value="${NormalMessage}" escapeXml="false" /></p></div><c:remove var="NormalMessage" /></c:if>

<c:choose>
    <c:when test="${param.subaction == 'edit'}"><jsp:include page="Edit.jsp" /></c:when>
    <c:when test="${param.subaction == 'messages'}"><jsp:include page="Messages.jsp" /></c:when>
    <c:when test="${param.subaction == 'delete'}"><jsp:include page="Delete.jsp" /></c:when>
    <c:otherwise><jsp:include page="Summary.jsp" /></c:otherwise>
</c:choose>

<script language="javascript">
    setSectionTitle(' &raquo; <c:out value="${subsectionTitle}" />');
</script>
