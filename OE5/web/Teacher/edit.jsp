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
degree:int
action:String (insert)

RESPONSE VARIABLES:
User: SessionObject
NormaMessage 

TO DO:
1- add and edit teacher

JOP TO:
Abbas Adel

--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
        <c:choose>
            <c:when test="${param.action == 'insert'}">
                <sql:query var="MXATID" sql="SELECT MAX(TID) AS TID FROM Teacher;"/>
                <sql:update>            
                    INSERT INTO teacher 
                    (TID, tName, Degree, Password, Birth, Email, Tell, Address)
                    VALUES(?, ?, ?, ?, ?, ?, ?, ? )
                    <sql:param value="${MXATID.rows[0].TID+1}" />
                    <sql:param value="${param.name}" />
                    <sql:param value="${param.degree}" />
                    <sql:param value="${param.password}" />
                    <sql:param value="${param.birth_year}-${param.birth_month}-${param.birth_day}" />
                    <sql:param value="${param.email}" />
                    <sql:param value="${param.tell}" />
                    <sql:param value="${param.address}" />
                </sql:update>
                
                
                <sql:query  var="teacherInfo" sql=" SELECT * FROM Teacher WHERE TID = ${MXATID.rows[0].TID+1}" />                
                <c:set var="User" value="${teacherInfo.rows[0]}" scope="session" />
                
                <c:redirect url="/Teacher/CP.jsp?action=status" >                        
                    <c:param name="NormalMessage" value="Registration Completed<br />Your ID: <b>${MXATID.rows[0].TID+1}</b> <br />"/>                        
                </c:redirect>
            </c:when>
            
            <c:when test="${param.action == 'update'}">
                <sql:update>
                    UPDATE Teacher
                    SET Password = ?, 
                    tName = ?, 
                    Degree = ?
                    Birth = ?,
                    Email = ?, 
                    Tell = ?,
                    Address = ?,
                    WHERE TID = ?
                    <sql:param value="${param.password}" />
                    <sql:param value="${param.name}" />
                    <sql:param value="${param.degree}" />
                    <sql:param value="${param.birth_year}-${param.birth_month}-${param.birth_day}"/>
                    <sql:param value="${param.email}" />
                    <sql:param value="${param.tell}" />
                    <sql:param value="${param.address}" />
                    <sql:param value="${param.TID}" />
                </sql:update>
                
                <sql:query  var="teacherInfo" sql=" SELECT * FROM Teacher WHERE TID = ${param.TID}" />                
                <c:set var="User" value="${teacherInfo.rows[0]}" scope="session" />
                
                <c:redirect url="/Teacher/CP.jsp?action=status" >                        
                    <c:param name="NormalMessage" value="Your Information were updated successfully!"/>                        
                </c:redirect>
            </c:when>
        </c:choose>