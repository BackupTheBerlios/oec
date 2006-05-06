<%--

FILE DESCRIPTION:
Menu list for Question Action

CREATION DATE / BY:
18 April 2006 BY Abbas Adel

LAST MODIFY / BY:
18 April 2006 BY Abbas Adel

MODIFICATIONS:
1- Added 2 links
2-modification on the link of the delete menu

TO DO:
1- insert more links

JOP TO:
Abbas Adel

--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


    <ul>
        <li class="<c:out value="${param.subaction == 'list' || empty param.subaction? 'current':''}" />">
            <%-- MODIFICATION DONE HERE ON THE LINK--%>
            <a href="CP.jsp?action=group&subaction=list&FTID=0" >List</a>
        </li>
        <li class="<c:out value="${param.subaction == 'add'? 'current':''}" />">
            <a href="CP.jsp?action=group&subaction=add">Add</a>
        </li>
        <li class="<c:out value="${param.subaction == 'edit'? 'current':''}" />">
            <a href="CP.jsp?action=group&subaction=edit">Edit</a>
        </li>
        <li class="<c:out value="${param.subaction == 'delete'? 'current':''}" />">
            <a href="CP.jsp?action=group&subaction=list&FTID=0">Delete</a>
            <%--<a href="/CP.jsp?action=group&subaction=list&FTID=0">Delete</a>--%>
        </li>
    </ul>

