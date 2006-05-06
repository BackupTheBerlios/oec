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
     <b>Status</b>
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
    <c:when test="${param.subaction == 'details'}">
        <jsp:include page="Details.jsp" />
    </c:when>

    <c:otherwise>
        <jsp:include page="Summary.jsp" />
    </c:otherwise>
</c:choose>

<script language="javascript">
    setSectionTitle(' &raquo; <c:out value="${subsectionTitle}" />');
</script>
