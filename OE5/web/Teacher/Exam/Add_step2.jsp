<%--

FILE DESCRIPTION:
list of question of this course

CREATION DATE / BY:
27 April 2006 BY Abbas Adel

LAST MODIFY / BY:
27 April 2006 BY Abbas Adel

MODIFICATIONS:
1- 

REQUEST VARIABLES:
CID:int                 Course ID
ename:String            Exam name
sd sm sy:int            Start day month year
ed em ey:int            End day month year

RESPONSE VAIRABLES:
CID:int
QID[]:int
ename:String
sdate:String
edate:String

TO DO:
1- list this course questions with checkbox asides of this teacher

JOP TO:
Abbas Adel

--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>

<form method="post" action="CP.jsp?action=exam&subaction=add&step=3">
    <input type="hidden" name="CID" value="${param.CID}">
    <input type="hidden" name="ename" value="${param.ename}">               
    <sql:query var="questions" >
        SELECT question.QID, question.question
        FROM `teacher`, `question`, `teach`, `course` 
        WHERE `course`.CID = ?
        AND `teacher`.TID = `question`.TID
        AND `teacher`.TID = `teach`.TID
        AND `teach`.CID = `course`.CID 
        AND `question`.CID = `course`.CID
        
        <sql:param value="${param.CID}"/>
    </sql:query>
    <table width="100%" cellspacing="2" cellpadding="2">
        <tr>
            <th width="3%">&nbsp;</th>
            <th width="97%">Questions</th>
        </tr>
        <c:forEach items="${questions.rows}" var="question">
        <tr>
            <td><input type="checkbox" name="QID" value="${question.QID}" /></td>
            <td>${question.question}</td>
        </tr>
        </c:forEach>
        <tr>
            <td>&nbsp;</td>
            <td><input type="button" onclick="back();" value="Back" />
            <input type="button" onclick="document.location.href='CP.jsp?action=exam&subaction=list'" value="Cancel" />
            <input type="submit" name="Submit" value="Finish" /></td>
        </tr>
    </table>
</form>
