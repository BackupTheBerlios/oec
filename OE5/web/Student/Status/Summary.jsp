<%--

FILE DESCRIPTION:
Show summary

CREATION DATE / BY:
6 May 2006 BY Abbas Adel

LAST MODIFY / BY:
6 May 2006 BY Abbas Adel

MODIFICATIONS:
1- Just created

REQUEST VARIABLES:
User:sessionObject  Contains all user information about user found in Teacher table                 

RESPONSE VARIABLES:


TO DO:
1- show all user private information and make it editable

JOP TO:
Hamada

--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>

<c:set var="subsectionTitle" value="Summary" scope="request"/>

<table width="100%" cellspacing="2" cellpadding="2">
    <tr>
        <th>Your Information</th>
    </tr>
    <tr>
        <td>
            <p><b>Name:</b> ${User.sname}</p>
            <p><b>Address:</b> ${User.address}</p>
            <p><b>EMail:</b> ${User.email}</p>
            <p><b>Birth Date:</b> ${User.birth}</p>
            <p><b>Tell:</b> ${User.tell}</p>
            <p><b>Last Login:</b> ${User.login}</p>
            
        </td>
    </tr>
  
</table>
