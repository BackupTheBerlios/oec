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


    <ul>
        <li class="<c:out value="${param.subaction == 'summary' || empty param.subaction? 'current':''}" />">
            <a href="CP.jsp?action=status&subaction=summary" >Summary</a>
        </li>
        <li class="<c:out value="${param.subaction == 'details'? 'current':''}" />">
            <a href="CP.jsp?action=status&subaction=details">Details</a>
        </li>
    </ul>

