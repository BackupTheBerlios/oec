<%--

FILE DESCRIPTION:
Menu list for Student Actions

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
    
    <li class="${param.action == 'status' || empty param.action? 'current':''}">
        <a href="CP.jsp?action=status">Status</a>
        <c:if test="${param.action == 'status'  || empty param.action}"><jsp:include page="Status/Menu.jsp" /></c:if>
    </li>
        
    <li class="${param.action == 'exam'? 'current':''}">
        <a href="CP.jsp?action=exam">Exam Control</a>
        <c:if test="${param.action == 'exam'}"><jsp:include page="Exam/Menu.jsp" /></c:if>
    </li>  
    
</div>