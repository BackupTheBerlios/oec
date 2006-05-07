<%--

FILE DESCRIPTION:
Submit exam to this group

CREATION DATE / BY:
6 May 2006 BY Abbas Adel

LAST MODIFY / BY:
6 May 2006 BY Abbas Adel

MODIFICATIONS:
1- Just created

REQUEST VARIABLES:
User:SessionObject
GID:int                 Group ID
EID:int                 Exam ID

TO DO:
1- add GID, EID into SubmitExam
2- send confirmation message
3- if GID, EID not found send error message
4- redirect to CP.jsp?action=exam&subaction=list

JOP TO:
Hamada

--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>

<c:set var="subsectionTitle" value="View Exams" scope="request"/>