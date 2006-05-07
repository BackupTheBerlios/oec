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
        <th>Courses</th>
    </tr>
    <tr>
        <td><p><strong>You are teaching 9 courses from 20 courses added to the system.</strong></p>
        TABLE FROM COURSE-LIST </td>
    </tr>
    <tr>
        <th>Questions</th>
    </tr>
    <tr>
        <td><p><strong>You have added 40 question from 340 question in the system.</strong></p>
        TABLE FROM QUESTION-LIST </td>
    </tr>
    <tr>
        <th>Exams</th>
    </tr>
    <tr>
        <td><p><strong>You have submitted 20 exams from 120 exams in the system</strong></p>
        TABLE FROM EXAM-LIST </td>
    </tr>
    <tr>
        <th>Groups </th>
    </tr>
    <tr>
        <td><p><strong>You have added 2 groups from 5 groups</strong></p>
        TABLE FROM COURSE-LIST </td>
    </tr>
    <tr>
        <th>Students</th>
    </tr>
    <tr>
        <td><p><strong>You have 30 student from 300 student registed on the system.</strong></p>
        TABLE FROM COURSE-LIST </td>
    </tr>
</table>
