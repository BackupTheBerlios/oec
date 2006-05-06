<%--

FILE DESCRIPTION:
Menu list for Question Action

CREATION DATE / BY:
18 April 2006 BY Abbas Adel

LAST MODIFY / BY:
18 April 2006 BY Abbas Adel

MODIFICATIONS:
1- Added 2 links

TO DO:
1- insert more links

JOP TO:
Abbas Adel

--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div id="nav">
    
    <li class="<c:out value="${param.action == 'status' || empty param.action? 'current':''}" />">
        <a href="CP.jsp?action=status">Status</a>
        <c:if test="${param.action == 'status'  || empty param.action}">
            <jsp:include page="Status/Menu.jsp" />
        </c:if>
    </li>
        
    <li class="<c:out value="${param.action == 'course'? 'current':''}" />">
        <a href="CP.jsp?action=course">Course Control</a>
        <c:if test="${param.action == 'course'}">
            <jsp:include page="Course/Menu.jsp" />
        </c:if>
    </li>
        
    <li class="<c:out value="${param.action == 'question'? 'current':''}" />">
        <a href="CP.jsp?action=question">Question Control</a>
        <c:if test="${param.action == 'question'}">
            <jsp:include page="Question/Menu.jsp" />
        </c:if>
    </li>
        
    <li class="<c:out value="${param.action == 'exam'? 'current':''}" />">
        <a href="CP.jsp?action=exam">Exam Control</a>
        <c:if test="${param.action == 'exam'}">
            <jsp:include page="Exam/Menu.jsp" />
        </c:if>
    </li>
               
    <li class="<c:out value="${param.action == 'student'? 'current':''}" />">
        <a href="CP.jsp?action=student">Student Control</a>
        <c:if test="${param.action == 'student'}">
            <jsp:include page="Student/Menu.jsp" />
        </c:if>
    </li>
    <li class="<c:out value="${param.action == 'group'? 'current':''}" />">
        <%-- MODIFICATION DONE HERE ON THE LINK--%>
        <a href="CP.jsp?action=group&subaction=list&FTID=0">Groups Control</a>
        <c:if test="${param.action == 'group'}">
            <jsp:include page="Group/Menu.jsp" />
        </c:if>
    </li>
    
</div>