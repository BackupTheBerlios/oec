<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
        <c:choose>
            <c:when test="${param.action == 'insert'}">
                <sql:query var="MXATID" sql="SELECT MAX(TID) AS TID FROM Teacher;"/>
                <sql:update>            
                    INSERT INTO teacher 
                    (TID, tName, Degree, Password, Birth, Email, Tell, Address)
                    VALUES(?, ?, ?, ?, ?, ?, ?, ?)
                    <sql:param value="${MXATID.rows[0].TID+1}" />
                    <sql:param value="${param.name}" />
                    <sql:param value="${param.degree}" />
                    <sql:param value="${param.password}" />
                    <sql:param value="${param.birth_year}-${param.birth_month}-${param.birth_day}" />
                    <sql:param value="${param.email}" />
                    <sql:param value="${param.tell}" />
                    <sql:param value="${param.address}" />
                </sql:update>
               

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
            </c:when>
        </c:choose>

        
        <%-- Get the new or updated data from the database --%>
        <br /><br /><br /><br /><br />
        <div id="Message"> 
            <p><strong> Registeration Completed.${MXATID.rows[0].TID+1}</strong></p>
            <p>A confirmation message has benn sent to your email address. </p>
            <p><a href="index.jsp">Click here to continue </a></p>
            <p>&nbsp;</p>
            <p><em>Administrator</em></p>
        </div>
        
        <%-- Redirect to the confirmation page --%>


    </body>
</html>
