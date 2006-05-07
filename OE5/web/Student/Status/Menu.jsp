<%--

FILE DESCRIPTION:
Menu list for Question Action

CREATION DATE / BY:
18 April 2006 BY Abbas Adel

LAST MODIFY / BY:
6 May 2006 BY Abbas Adel


JOP TO:
Abbas Adel

--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


    <ul>
        <li class="${param.subaction == 'summary' || empty param.subaction? 'current':''}">
            <a href="CP.jsp?action=status&subaction=summary" >Summary</a>
        </li>
        <li class="${param.subaction == 'edit'? 'current':''}">
            <a href="CP.jsp?action=status&subaction=edit">Edit</a>
        </li>
        <li class="${param.subaction == 'messages'? 'current':''}">
            <a href="CP.jsp?action=status&subaction=messages" >Messages</a>
        </li>
    </ul>

