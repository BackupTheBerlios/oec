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
<c:set value="${param.sy}-${param.sm}-${param.sd}" var="StartDate" />
<c:set value="${param.ey}-${param.em}-${param.ed}" var="EndDate" />
        
<sql:update>
    INSERT INTO `SubmitExam` VALUES(DEFAULT, ?,?,?,?,?)
    <sql:param value="${param.EID}"/>
    <sql:param value="${param.GID}"/>
    <sql:param value="${StartDate}"/>
    <sql:param value="${EndDate}"/>
    <sql:param value="${param.period}"/>
</sql:update>

<%-- Message Students --%>

<sql:query var="Students">
    SELECT Student.SID FROM Student, `Assign`
    WHERE Student.SID = `Assign`.SID AND `Assign`.GID = ?
    <sql:param value="${param.GID}" />
</sql:query>
<c:forEach items="${Students.rows}" var="Student">
    <sql:update>    
        INSERT INTO `Message` VALUES (DEFAULT,?,?,?,DEFAULT,?,?)
        <sql:param value="${Student.SID}" />
        <sql:param value="exam"/>
        <sql:param value="${User.TName} has added a new exam <b>${param.ename} for ${param.cname}</b>" />
        <sql:param value="${param.EID}"/>
        <sql:param value="student"/>
    </sql:update>
</c:forEach>



<jsp:forward page="../CP.jsp?action=exam&subaction=list" >
    <jsp:param name="NormalMessage" 
    value="Exam has submited to the group correctly"/>
</jsp:forward>