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
EID:int             Exam ID
QID[]:int           contain all question IDs
OID[]:int           contain the answer ( OID[1] )

TO DO:
1- show exam name, course name, auther
2- show all question of this exam and all related options

--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>

<c:set var="subsectionTitle" value="Examine" scope="request"/>

<c:if test="${empty param.SEID}" >
    <c:set var="ErrorMessage" value='Please press on <b>"Examine"</b> link in the <b>\"Exam List\"</b>' scope="session" />
    <jsp:forward page="../CP.jsp?action=exam&subaction=list" />
</c:if>
<%-- auusme falirue --%>
<sql:update>
    INSERT INTO `Result` VALUES(?,?,"F",0,DEFAULT)
    <sql:param value="${User.SID}" />
    <sql:param value="${param.SEID}" />    
</sql:update>


<c:set var="ErrorMessage" scope="session" value="${ErrorMessage}" />
<sql:query var="Exam">
    SELECT Exam.ename, Course.cname, Teacher.tname, Teacher.degree
    FROM Teacher, Course, Exam, SubmitExam
    WHERE Teacher.TID = Exam.TID AND Exam.CID = Course.CID AND Exam.EID = SubmitExam.EID AND SubmitExam.SEID = ${param.SEID}
</sql:query>

<form  method="post" action="CP.jsp?action=exam&subaction=correct&SEID=${param.SEID}" id="exam">
    <table width="100%" cellspacing="2" cellpadding="2" class="list">
        <tr>
            <th>${Exam.rows[0].ename} - ${Exam.rows[0].cname} - <i>by ${Exam.rows[0].degree}  ${Exam.rows[0].tname} </i>
                <input name="SEID" type="hidden" value="SEID" />
                
            </th>
        </tr>
        <sql:query var="Questions">
            SELECT question.QID, question.question
            FROM Question, TakeExam, SubmitExam
            WHERE TakeExam.QID = Question.QID AND TakeExam.EID = SubmitExam.EID AND SubmitExam.SEID = ${param.SEID}
        </sql:query>
    
        <c:forEach items="${Questions.rows}" var="Question" >
        
            <tr>
                <td>
                    <p><strong><em>Q: </em>${Question.question}</strong></p>
                    
                    <sql:query var="Options" sql="SELECT oname, OID FROM `Option` WHERE QID = ${Question.QID}"/>
                    <input type="hidden" name="QID" value="${Question.QID}" >
                    <c:forEach items="${Options.rows}" var="Option">                         
                        <p><input name="OID[${Question.QID}]" type="radio" value="${Option.OID}" />${Option.oname}</p>
                    </c:forEach>
                    
                </td>
            </tr>
        </c:forEach>
        <tr>
            <td><input type="submit" value="Submit Exam" /></td>
        </tr>
    </table>
</form>
