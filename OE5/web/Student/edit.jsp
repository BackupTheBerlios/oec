<%--

FILE DESCRIPTION:
Teacher register and Edit

CREATION DATE / BY:
6 May 2006 BY Abbas Adel

LAST MODIFY / BY:
6 May 2006 BY Abbas Adel

MODIFICATIONS:
1- Just created

REQUEST VARIABLES:
name:String
password:String
birth_year:int
birth_month:int
birth_day:int
address:String
tell:int
email:String
action:String (insert)

RESPONSE VARIABLES:
User: SessionObject
NormaMessage 

TO DO:
1- add and edit student

JOP TO:
Abbas Adel

--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<c:choose>
    <c:when test="${param.action == 'insert'}">
        <sql:query var="MAXSID" sql="SELECT MAX(SID) AS SID FROM Student;"/>
        <sql:update>
            INSERT INTO Student 
            (SID, sname, password, email, birth, tell, address, `date`)
            VALUES(?,?, ?, ?, ?, ?, ?, CURRENT_TIMESTAMP())
            <sql:param value="${MAXSID.rows[0].SID+1}" />
            <sql:param value="${param.name}" />
            <sql:param value="${param.password}" />
            <sql:param value="${param.email}" />
            <sql:param value="${param.birth_year}-${param.birth_month}-${param.birth_day}" />
            <sql:param value="${param.tell}" />
            <sql:param value="${param.address}" />
        </sql:update>
        
        <sql:query  var="Student" sql=" SELECT * FROM Student WHERE SID = ${MAXSID.rows[0].SID+1}" />                
        <c:set var="User" value="${Student.rows[0]}" scope="session" />
        <c:set var="NormalMessage" value="Registration Completed<br />Your ID: <b>${MAXSID.rows[0].SID+1}</b> <br />"  scope="session" />
        
        <c:redirect url="/Student/CP.jsp?action=status" />

    </c:when>
    <c:when test="${param.action == 'update'}">
        <sql:update>
            UPDATE Student
            SET Password = ?, 
            sName = ?, 
            Email = ?, 
            Birth = ?,
            Tell = ?,
            Address = ?
            WHERE SID = ?
            <sql:param value="${param.password}" />
            <sql:param value="${param.name}" />
            <sql:param value="${param.email}" />
            <sql:param value="${param.birth}"/>
            <sql:param value="${param.tell}" />
            <sql:param value="${param.address}" />
            <sql:param value="${User.SID}" />
        </sql:update>
        
        <sql:query  var="Student" sql=" SELECT * FROM Student WHERE SID = ${User.SID}" />                
        <c:set var="User" value="${Student.rows[0]}" scope="session" />
                
        <c:redirect url="/Student/CP.jsp?action=status" >                        
            <c:param name="NormalMessage" value="Your Information were updated successfully!"/>                        
        </c:redirect>

    </c:when>
</c:choose>