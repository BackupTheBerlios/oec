<%--

FILE DESCRIPTION:
Take exam

CREATION DATE / BY:
7 May 2006 BY Abbas Adel

LAST MODIFY / BY:
7 May 2006 BY Abbas Adel

REQUEST VARIABLES:
EID:int             Question ID to edit
User:sessionObject  Contains all user information about user found in Student table                 

RESPONSE VARIABLES:
EID:int  
QID[]:int
OID[]:int

TO DO:
1- show exam name, course name, auther
2- show all question of this exam and all related options

--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>

fgdsgfd
<c:set var="subsectionTitle" value="Examine" scope="request"/>
<c:if test="${empty param.EID}" >
    <c:set var="NormalMessage" value='Please press on <b>"Examine"</b> link in the <b>\"Exam List\"</b>' scope="session" />
    <c:redirect url="http://www.tantawi.net" />
    
</c:if>

<sql:query var="Exam">
    SELECT exam.ename, course.cname, teacher.tname, teacher.degree
    FROM Teacher, course, exam
    WHERE teacher.TID = exam.TID AND exam.CID = Course.CID AND EID = ${param.EID}
</sql:query>

<form  method="post" action="CP.jsp?action=exam&subaction=correct">
    <table width="100%" cellspacing="2" cellpadding="2" class="list">
        <tr>
            <th>${Exam.rows[0].ename} - ${Exam.rows[0].cname} - <i>by ${Exam.rows[0].degree}  ${Exam.rows[0].tname} </i>
                <input name="EID" type="hidden" id="EID" value="EID" />
                
            </th>
        </tr>
        <sql:query var="Questions">
            SELECT question.QID, question.question
            FROM Question, takeExam
            WHERE takeExam.QID = Question.QID AND takeExam.EID = ${param.EID}
        </sql:query>
    
        <c:forEach items="${Questions.rows}" var="Question" >
        
            <tr>
                <td>
                    <p><strong><em>Q: </em>${Question.question}</strong></p>
                    
                    <sql:query var="Options" sql="SELECT oname, OID FROM `Option` WHERE QID = ${Question.QID}"/>
                    
                    <c:forEach items="${Options.rows}" var="Option">
                        <input type="hidden" name="Q" value="${Question.QID}" > 
                        <p><input name="QID[${Question.QID}]" type="radio" value="${Option.OID}" />${Option.oname}</p>
                    </c:forEach>
                    
                </td>
            </tr>
        </c:forEach>
        <tr>
            <td><input type="submit" value="Submit Exam" /></td>
        </tr>
    </table>
</form>
