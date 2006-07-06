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
<h1>Welcome <em> to OEC</em></h1>
<p>If this is your first visit, please register to enjoy our services.</p>
<table width="100%" cellspacing="0" cellpadding="0">
        <tr>
          <td height="188" align="center"><p>&nbsp;</p>
            <p>
              <a href="Student/register.jsp"><img src="/OE/images/student.png" alt="Student" width="256" height="256" border="0" /></a>
              <br />
              Student Registration
              <a href="Student/register.jsp">here</a>
              .</p>
            <p>&nbsp;</p></td>
          <td align="center"><a href="Teacher/register.jsp"><img src="/OE/images/teacher.png" alt="Teacher" width="256" height="256" border="0" /></a>
            <br />
            Teacher Registration
            <a href="Teacher/register.jsp">here</a>
. </td>
        </tr>
      </table>
      <jsp:include page="/footer.jsp" />
