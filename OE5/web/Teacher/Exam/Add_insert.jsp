<%--

FILE DESCRIPTION:
insert the exam and question into db

CREATION DATE / BY:
18 April 2006 BY Abbas Adel

LAST MODIFY / BY:
18 April 2006 BY Abbas Adel

MODIFICATIONS:
1- Just created

REQUEST VARIABLES:
CID:int
QID[]:int
ename:String
sdate:String
edate:String
User:SessionObject

TO DO:
1- insert new exam and keep its EID
2- inser quetions one by one using EID

JOP TO:
Ahmed Tanahy

--%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<sql:query var="MAXEID" sql="SELECT MAX(EID) AS EID FROM Exam;"/>
<sql:update >
    INSERT INTO Exam VALUES(?,?,?,?,DEFAULT)
    <sql:param value="${MAXEID.rows[0].EID+1}" />
    <sql:param value="${param.CID}" />
    <sql:param value="${User.TID}" />
    <sql:param value="${param.ename}" />

</sql:update>
<c:forEach items="${paramValues.QID}" var="qustionnumber">
    <sql:update>
        INSERT INTO takeexam VALUES(?,?)
        <sql:param value="${MAXEID.rows[0].EID+1}" />
        <sql:param value = "${qustionnumber}"/>
    </sql:update>
</c:forEach>

<%-- message the users --%>

<sql:query var="Teachers" >
    SELECT Teacher.TID FROM Teacher,Teach 
    WHERE Teacher.TID = Teach.TID AND Teach.CID = ? AND Teacher.TID != ?
    <sql:param value="${param.CID}" />
    <sql:param value="${User.TID}" />
</sql:query>
<c:forEach items="${Teachers.rows}" var="Teacher">
    <sql:update>    
        INSERT INTO `Message` VALUES (DEFAULT,?,?,?,DEFAULT,?,?)
        <sql:param value="${Teacher.TID}" />
        <sql:param value="exam"/>
        <sql:param value="${User.TName} has added a new exam <b>${param.ename}</b>" />
        <sql:param value="${MAXEID.rows[0].EID+1}"/>
        <sql:param value="teacher"/>
    </sql:update>
</c:forEach>





<jsp:forward page="../CP.jsp?action=exam&subaction=list" >
    <jsp:param name="NormalMessage" 
    value="Exam has inserted correctly"/>
</jsp:forward>
