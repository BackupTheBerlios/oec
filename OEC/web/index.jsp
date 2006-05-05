<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${! empty User }" >
  <c:choose>
    <c:when test="${! empty User.TID}" >
      <c:redirect url="Teacher/CP.jsp" />
    </c:when>
    <c:when test="${! empty User.SID}" >
      <c:redirect url="Student/CP.jsp" />
    </c:when>
  </c:choose>
</c:if>
<jsp:include page="/header.jsp" />
      <h1>Welcome</h1>
      <p><em>Welcome to OEC</em>,</p>
      <p>If this is your first visit, please register to enjoy our services.</p>
      <p>Student Registration <a href="Student/register.jsp">here</a>.</p>
      <p>Teacher Registration <a href="Teacher/register.jsp">here</a>. </p>
<jsp:include page="/footer.jsp" />
