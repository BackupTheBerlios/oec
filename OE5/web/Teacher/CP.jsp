<%--

FILE DESCRIPTION:
Teacher Control Panel wich controlls all actions and subactions

CREATION DATE / BY:
18 April 2006 BY Abbas Adel

LAST MODIFY / BY:
18 April 2006 BY Abbas Adel


JOP FOR:
Abbas Adel

--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>

<c:if test="${!empty redirect}"><c:redirect url="CP.jsp?action=${param.redirect}&subaction=${param.to}"/></c:if>

<jsp:include page="../header.jsp" />
    <h1>Welcome <i>${User.degree} ${User.tname}</i></h1>
    <table width="100%" cellspacing="4">
        <tr>
            <td valign="top" width="180"><jsp:include page="Menu.jsp" /></td>
            <td align="left" valign="top">
            <c:choose>
                <c:when test="${param.action == 'course'}"><jsp:include page="Course/Controller.jsp" /></c:when>
                <c:when test="${param.action == 'question'}"><jsp:include page="Question/Controller.jsp" /></c:when>
                <c:when test="${param.action == 'exam'}"><jsp:include page="Exam/Controller.jsp" /></c:when>
                <c:when test="${param.action == 'student'}"><jsp:include page="Student/Controller.jsp" /></c:when>
                <c:when test="${param.action == 'group'}"><jsp:include page="Group/Controller.jsp" /></c:when>
                <c:otherwise><jsp:include page="Status/Controller.jsp" /></c:otherwise>
            </c:choose>
            <td>
        </tr>        
    </table>
   
<jsp:include page="../footer.jsp" />
