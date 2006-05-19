<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>

<c:if test="${empty param.SEID}" >
    <c:set var="ErrorMessage" scope="session"
    value='Please press on <b>"Examine"</b> link in the <b>\"Exam List\"</b>'  />
    <jsp:forward page="../CP.jsp?action=exam&subaction=list" />
</c:if>

<sql:query var="result" sql="SELECT SID, ename FROM `Result`, SubmitExam, Exam WHERE `Result`.SEID = SubmitExam.SEID AND SubmitExam.EID = Exam.EID  AND `result`.SEID = ${param.SEID} AND `result`.SID = ${User.SID}"  />

<c:if test="${! empty result.rows[0].SID}" >
    <c:set var="ErrorMessage" scope="session"
    value='You have preforemd <b>${result.rows[0].ename}</b> exam once.'  />
    <jsp:forward page="../CP.jsp?action=exam&subaction=result" />
</c:if>


   
<sql:query var="Exam" sql="SELECT DATE_ADD(CURRENT_TIMESTAMP,INTERVAL period MINUTE) FROM submitExam WHERE SEID = ${param.SEID}; " />
<c:set var="EndTime" scope="session" value="${Exam.rows[0]['']}" />

<%-- Message Teachers --%>    
<sql:query var="Teachers" >
    SELECT Teacher.TID, Exam.ename FROM Teacher,Exam, SubmitExam
    WHERE Teacher.TID = Exam.TID AND Exam.EID = SubmitExam.EID AND SubmitExam.SEID = ? 
    <sql:param value="${param.SEID}" />
</sql:query>
<c:forEach items="${Teachers.rows}" var="Teacher">
    <sql:update>    
        INSERT INTO `Message` VALUES (DEFAULT,?,?,?,DEFAULT,?,?)
        <sql:param value="${Teacher.TID}" />
        <sql:param value="exam"/>
        <sql:param value="${User.sname} has preformed exam <b>${Teacher.ename}</b>" />
        <sql:param value="${param.SEID}"/>
        <sql:param value="teacher"/>
    </sql:update>
</c:forEach>


<c:set var="ErrorMessage" scope="session"
    value=" You have to submit your exam in: <br />
    <script language=\"JavaScript\">
    TargetDate = \"${Exam.rows[0]['']} \";
    TargetDate = TargetDate.replace('-','/');
    TargetDate = TargetDate.replace('-','/')
    TargetDate = TargetDate.split('.');
    TargetDate = TargetDate[0];
    BackColor = \"palegreen\";
    ForeColor = \"navy\";
    CountActive = true;
    CountStepper = -1;
    DisplayFormat = \"%%H%% Hours, %%M%% Minutes, %%S%% Seconds.\";
    FinishMessage = \"<h4>SUBMITTING EXAM</h4>\";
    </script>
   <script language=\"JavaScript\" src=\"../countdown.js\"></script><br/> 
   or your exam will be canceled"  />
<%--
<jsp:forward page="../CP.jsp?redirect=exam&to=examine" />
--%>

<jsp:forward page="../CP.jsp?action=exam&subaction=examine&SEID=${param.SEID}" />