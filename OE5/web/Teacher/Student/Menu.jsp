<%--

FILE DESCRIPTION:
Menu list for Question Action

CREATION DATE / BY:
18 April 2006 BY Abbas Adel

LAST MODIFY / BY:
18 April 2006 BY Abbas Adel

JOP TO:
Abbas Adel

--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


    <ul>
        <li class="${param.subaction == 'list' || empty param.subaction? 'current':''}">
            <a href="CP.jsp?action=student&subaction=list" >List</a>
        </li>
        <li class="${param.subaction == 'view'? 'current':''}">
            <a href="CP.jsp?action=student&subaction=view">View</a>
        </li>
    </ul>

