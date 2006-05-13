<%--

FILE DESCRIPTION:
Correct exam and save the result

CREATION DATE / BY:
7 May 2006 BY Abbas Adel

LAST MODIFY / BY:
7 May 2006 BY Abbas Adel

MODIFICATIONS:
1- Insert into database

REQUEST VARIABLES:
EID:int             Exam ID
ename:String        Exam name
QID[]:int           contain all question IDs
OID[]:int           contain the answer ( OID[1] )
User:SessionObject

TO DO:
1- Correct the questions and save them in the database (result)
2- Forward to CP.jsp?action=exam&subaction=list
3- Send message to the teacher and to the student

JOP TO:
Abbas Adel

--%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>


<sql:query var="Course">
    SELECT Course.max,Course.min
    FROM Exam, SubmitExam, Course 
    WHERE SubmitExam.SEID = ${param.SEID} AND SubmitExam.EID = Exam.EID AND Exam.CID = Course.CID
</sql:query>

<c:set var="result" value="0" />
<c:set var="counter" value="0" />
<c:forEach items="${paramValues.QID}" var="Q">

    <c:set var="O" value="OID[${Q}]" />
    <sql:query var="A" maxRows="1">
        SELECT IF(QID=? AND OID = ?,1,0) FROM Question WHERE QID=? AND OID = ?
        <sql:param value="${Q}" />
        <sql:param value="${param[O]}" />
        <sql:param value="${Q}" />
        <sql:param value="${param[O]}" />
    </sql:query>
    <c:set var="result" value="${result+A.rows[0]['']}" />
    <c:set var="counter" value="${counter+1}" />

</c:forEach>

<c:set var="mark" value="${(result/counter)*Course.rows[0].max }" />
<c:set var="grade" value="${(result/counter)*100 }" />
<c:set var="grade" value="${grade >= 85?'A':grade >= 75?'B':grade >= 65?'C':grade >= 50? 'C-':'F' }" />

<%--
${result} ${counter} ${mark} ${grade}
--%>
<%-- auusme falirue --%>

<sql:update>
    UPDATE `Result` 
    SET mark = ?, grade = ? 
    WHERE SEID = ? AND SID = ?
    <sql:param value="${mark}" />
    <sql:param value="${grade}" />
    <sql:param value="${param.SEID}" />    
    <sql:param value="${User.SID}" />
</sql:update>

<jsp:forward page="../CP.jsp?action=exam&subaction=result" >
    <jsp:param name="NormalMessage" 
    value="Your exam have submitted successfully"/>
</jsp:forward>

    
