<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>

<c:if test="${empty param.EID}" >
    <c:set var="ErrorMessage" scope="session"
    value='Please press on <b>"Examine"</b> link in the <b>\"Exam List\"</b>'  />
    <jsp:forward page="../CP.jsp?action=exam&subaction=list" />
</c:if>

<sql:query var="result" sql="SELECT SID, ename FROM `result`, exam WHERE `result`.EID = exam.EID  AND `result`.EID = ${param.EID} AND `result`.SID = ${User.SID}"  />
<c:if test="${! empty result.rows[0].SID}" >
    <c:set var="ErrorMessage" scope="session"
    value='You have preforemd <b>${result.rows[0].ename}</b> exam once.'  />
    <jsp:forward page="../CP.jsp?action=exam&subaction=result" />
</c:if>


   
<sql:query var="Exam" sql="SELECT DATE_ADD(CURRENT_TIMESTAMP,INTERVAL period MINUTE) FROM submitExam WHERE EID = ${param.EID}; " />
<c:set var="EndTime" scope="session" value="${Exam.rows[0]['']}" />

<sql:update>
    INSERT INTO `result` VALUES(?,?,"F",0,DEFAULT)
    <sql:param value="${User.SID}" />
    <sql:param value="${param.EID}" />    
</sql:update>

<%-- Message Teachers --%>    
<sql:query var="Teachers" >
    SELECT Teacher.TID FROM Teacher,Exam 
    WHERE Teacher.TID = Exam.TID AND Exam.EID = ? 
    <sql:param value="${param.EID}" />
</sql:query>
<c:forEach items="${Teachers.rows}" var="Teacher">
    <sql:update>    
        INSERT INTO `Message` VALUES (DEFAULT,?,?,?,DEFAULT,?,?)
        <sql:param value="${Teacher.TID}" />
        <sql:param value="exam"/>
        <sql:param value="${User.SName} has prefored exam <b>${param.ename}</b>" />
        <sql:param value="${param.EID}"/>
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
<c:set var="statExam" scope="session" value="" />
<jsp:forward page="../CP.jsp?action=exam&subaction=examine" >
    <jsp:param name="ename" value="${result.rows[0].ename}" />
</jsp:forward>