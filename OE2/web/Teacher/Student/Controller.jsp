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
     Student Control
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
    <c:when test="${param.subaction == 'view'}">
         <c:if test="${empty param.SID}" >
            <jsp:forward page="../CP.jsp?action=student&subaction=list" >
                <jsp:param name="ErrorMessage" 
                value="Please press on <b>'View'</b> link in the <b>\"Student List\"</b>"/>
            </jsp:forward>
        </c:if>
        <c:set var="subsectionTitle" value="View Student Information" scope="request"/>
        <jsp:include page="View.jsp" />
    </c:when>
    <c:otherwise>
        <c:set var="subsectionTitle" value="List Students" scope="request"/>
        <jsp:include page="List.jsp" />
    </c:otherwise>
</c:choose>

<script language="javascript">
    setSectionTitle(' &raquo; <c:out value="${subsectionTitle}" />');
</script>
