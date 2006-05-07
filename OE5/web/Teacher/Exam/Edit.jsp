<%--

FILE DESCRIPTION:
Edit ONE Exam from exam and take exam Tables, each question in this exam and each question in this course

CREATION DATE / BY:
29 April 2006 BY Ahmed Eltanahy

LAST MODIFY / BY:
29 April 2006 BY Ahmed Eltanahy

MODIFICATIONS:
1- Just created and finished

REQUEST VARIABLES:
EID:int             Exam ID to edit
CID :int            Course of this Exam
User:sessionObject  Contains all user information about user found in Teacher table                 


TO DO:
1- Show Exam name in the text area
2- List all questions of the exam and check the check box of the current question

JOP TO:
Islam Negm

--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>


<c:set var="subsectionTitle" value="Edit Exam" scope="request"/>
<c:if test="${empty param.EID}" >
    <jsp:forward page="../CP.jsp?action=exam&subaction=list" >
        <jsp:param name="ErrorMessage" 
        value="Please press on <b>'Edit'</b> link in the <b>\"Exam List\"</b>"/>
    </jsp:forward>
</c:if>


<%--<c:forEach items="${param}" var = "row">
${row}
</c:forEach>--%>
 <form method="post" action="CP.jsp?action=exam&subaction=edit_update">
     <sql:query var="myExams" >
         SELECT `exam`.EID , `exam`.ename , `question`.QID , `question`.question 
         FROM `question`  , `exam` ,`takeexam` 
         WHERE `takeexam`.EID = `exam`.EID
         AND `takeexam`.QID = `question`.QID
         AND `exam`.EID = ?
         <sql:param value="${param.EID}"/>
     </sql:query>
     <input type="hidden" name="CID" value="${param.CID}">
     <input type="hidden" name="EID" value="${param.EID}">
     <table width="42%" cellspacing="2" cellpadding="2">
         <tr>
             <td width="92"><label>Exam Name:</label></td>
             <td width="205"><input name="ename" type="text" value="${myExams.rows[0].ename}" /></td>
         </tr>
         <tr>
             <td><label>Start Date:</label></td>
             <td><label>Day:</label>
                 <input name="sd" type="text"size="2" />
                 <label>Month:</label>
                 <input name="sm" type="text"size="2" />
                 <label> Year:</label>
                 <input name="sy" type="text" size="4" />
             </td>
         </tr>
         <tr>
             <td><label>End Date:</label></td>
             <td><label> Day:</label>
                 <input name="ed" type="text" size="2" />
                 <label>Month:</label>
                 <input name="em" type="text" size="2" />
                 <label> Year:</label>
                 <input name="ey" type="text" size="4" />
             </td>
         </tr>
     </table>
     <c:set value="${param.sy}-${param.sm}-${param.sd}" var="StartDate" />
     <c:set value="${param.ey}-${param.em}-${param.ed}" var="EndDate" />
     <input type="hidden" name="sdate" value="${(empty param.sy || empty param.sm || empty param.sd)?'null':StartDate}">
     <input type="hidden" name="edate" value="${(empty param.ey || empty param.em || empty param.ed)?'null':EndDate}">
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
     <p>
         <label></label>
     </p>
     <p>
         <label></label>
     </p>
     <label></label>
     <p>
         <input type="submit" name="Submit" value="Submit">
         <input type="reset" name="Reset" value="Reset">
     </p>
 </form>
