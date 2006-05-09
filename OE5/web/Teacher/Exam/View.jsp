<%--

FILE DESCRIPTION:
View question and its options

CREATION DATE / BY:
26 April 2006 BY Abbas Adel

LAST MODIFY / BY:
26 April 2006 BY Abbas Adel

MODIFICATIONS:
1- Just created

REQUEST VARIABLES:
QID:int             Question ID to edit
User:sessionObject  Contains all user information about user found in Teacher table                 

RESPONSE VARIABLES:
QID:int  

TO DO:
1-show course name of the question
2- show question
3- show auther
4- show all option and mark the selected option
5- forward to edit and pass NOEDIT variable



--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>

<c:set var="subsectionTitle" value="View Exams" scope="request"/>
<c:if test="${empty param.EID}" >
    <jsp:forward page="../CP.jsp?action=exam&subaction=list" >
        <jsp:param name="ErrorMessage" 
        value="Please press on <b>'View'</b> link in the <b>\"Exam List\"</b>"/>
    </jsp:forward>
</c:if>

<form method="post" action="CP.jsp?action=exam&subaction=edit_update">
     <sql:query var="myExams" >
         SELECT `exam`.EID , `exam`.ename , `exam`.edate , `question`.QID , `question`.question 
         FROM `question`  , `exam` ,`takeexam`
         WHERE `takeexam`.EID = `exam`.EID
         AND `takeexam`.QID = `question`.QID
         AND `exam`.EID = ?
         <sql:param value="${param.EID}"/>
     </sql:query>
     <table width="42%" cellspacing="2" cellpadding="2">
         <tr>
           <td><label>Exam Name:</label></td>
           <td><input name="ename" type="text" value="${myExams.rows[0].ename}" /></td>
         </tr>
         <tr>
             <td width="126">Submit time stamp: </td>
             <td width="180"><label>
               <input type="text" value="${myExams.rows[0].edate}" name="textfield" />
             </label></td>
         </tr>         
     </table>
     
     <p>
         <label></label>
         <label>Exam Questions:</label>
     </p>
     <table width="27%" cellspacing="2" cellpadding="2">
         <tr>
             <th width="3%">&nbsp;</th>
             <th width="97%">Question</th>
         </tr>
         <c:forEach items="${myExams.rows}" var="question">
             <tr>
                 <td> <input name="QID" type="checkbox" checked="true" value="${question.QID}" > </td>
                 <td><label>${question.question}</label></td>
             </tr>
         </c:forEach>
         <sql:query var="notMyExams" >
             SELECT question.QID, question.question
             FROM question, course
             WHERE question.CID = course.CID 
             AND course.CID = ?
             AND question.QID NOT IN (
             SELECT takeexam.QID 
             FROM takeexam
             WHERE takeexam.EID = ?)
             <sql:param value="${param.CID}"/>
             <sql:param value="${param.EID}"/>
         </sql:query>
         
         <c:forEach items="${notMyExams.rows}" var="question">
             <tr>
                 <td> <input name="QID" type="checkbox"  value="${question.QID}" > </td>
                 <td><label>${question.question}</label></td>
             </tr>
         </c:forEach>
     </table>
     
     
</form>
