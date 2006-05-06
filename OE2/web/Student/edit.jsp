<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Untitled Document</title>
<link href="css.css" rel="stylesheet" type="text/css" />
</head>

<body>

  
<%-- 
  See if the employee is already defined. If not, insert the
  info, else update it.
--%>

<%--
  Deal with the date values: parse the employment date and create a
  Date object from it, and create a new variable to hold the current
  date.
--%>

<jsp:useBean id="now" class="java.util.Date" />
<c:choose>
    <c:when test="${param.action == 'insert'}">
        <sql:update>
            INSERT INTO Student 
            (sName, Password, Email, Birth, Tell, Address)
            VALUES(?, ?, ?, ?, ?, ?)
            <sql:param value="${param.name}" />
            <sql:param value="${param.password}" />
            <sql:param value="${param.email}" />
            <sql:param value="${param.birth_year}-${param.birth_month}-${param.birth_day}" />
            <sql:param value="${param.tell}" />
            <sql:param value="${param.address}" />
        </sql:update>

    </c:when>
    <c:when test="${param.action == 'update'}">
        <sql:update>
            UPDATE Student
            SET Password = ?, 
            sName = ?, 
            Email = ?, 
            Birth = ?,
            Tell = ?,
            Address = ?,
            WHERE SID = ?
            <sql:param value="${param.password}" />
            <sql:param value="${param.name}" />
            <sql:param value="${param.email}" />
            <sql:param value="${param.birth_year}-${param.birth_month}-${param.birth_day}"/>
            <sql:param value="${param.tell}" />
            <sql:param value="${param.address}" />
            <sql:param value="${param.SID}" />
        </sql:update>
        

    </c:when>
</c:choose>

        <%-- Get the new or updated data from the database --%>

            <br /><br /><br /><br /><br />
            <div id="Message"> 
                <p><strong> Registeration Completed.</strong></p>
                <p>A confirmation message has benn sent to your email address. </p>
                <p><a href="index.jsp">Click here to continue </a></p>
                <p>&nbsp;</p>
                <p><em>Administrator</em></p>
            </div>
        


</body>
</html>
