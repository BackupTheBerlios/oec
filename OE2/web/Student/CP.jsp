<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<jsp:include page="/header.jsp" />
<h1>Welcome <i><c:out value="${studentInfo.name}" /></i></h1>
      <p>---- show list of exams to preform -----</p>
      <p>---- show list of last results -------  </p>
	  <jsp:include page="/footer.jsp" />