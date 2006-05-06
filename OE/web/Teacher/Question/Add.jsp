<%--

FILE DESCRIPTION:
Control the Add Question subaction

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
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>


<c:choose>
    <c:when test="${param.step == 2}">
        <jsp:include page="Add_step2.jsp" />
    </c:when>
    <c:when test="${param.step == 3}">
        <jsp:include page="Add_insert.jsp" />
    </c:when>
    <c:otherwise>
        <jsp:include page="Add_step1.jsp" />
    </c:otherwise>
</c:choose>

