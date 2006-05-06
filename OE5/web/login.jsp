<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
        <title>Login</title>
        <link href="css.css" rel="stylesheet" type="text/css" />
    </head>
    <body>
    
        <c:choose>
            <c:when test="${param.type == 'student'}">
                
                <sql:query var="studentInfo"> 
                    SELECT * FROM Student WHERE SID = ? AND Password = ? LIMIT 0,1
                    <sql:param value="${param.ID}"/>
                    <sql:param value="${param.password}"/>
                </sql:query>
                
                <c:if test="${studentInfo.rowCount > 0}">
                    <c:redirect url="/Student/CP.jsp">
                            <c:set var="User" value="${studentInfo.rows[0]}" scope="session" />
                    </c:redirect>
                </c:if>
                
            </c:when>
            <c:when test="${param.type == 'teacher'}">
                
                <sql:query  var="teacherInfo"> 
                    SELECT * FROM Teacher WHERE TID = ? AND Password = ? LIMIT 0,1
                    <sql:param value="${param.ID}"/>
                    <sql:param value="${param.password}"/>
                </sql:query>
                
                <c:set var="User" value="${teacherInfo.rows[0]}" scope="session" />
                
                <c:if test="${teacherInfo.rowCount > 0}">
                    <sql:query var="Messages">
                        SELECT COUNT(*) FROM Message, Teacher 
                        WHERE Teacher.TID = Message.UID 
                        AND Message.`user` = 'teacher' AND Message.UID = ? 
                        AND Message.mdate > ?
                        <sql:param value="${teacherInfo.rows[0].TID}" />
                        <sql:param value="${User.login}" />
                    </sql:query>
                    
                    
                    <sql:update sql="UPDATE Teacher SET login = CURRENT_TIMESTAMP() WHERE TID = ${User.TID}" />
                    <c:redirect url="/Teacher/CP.jsp?action=status" >                        
                        <c:param name="NormalMessage" value="You have <b>${Messages.rows[0]['']}</b> new message/s"/>                        
                    </c:redirect>
                    
                </c:if>
                
            </c:when>
            <c:otherwise>
                <c:redirect url="index.jsp"/>
            </c:otherwise>
        </c:choose>
        
        <c:if test="${!User}">
            <br /><br /><br /><br /><br />
            <div id="ErrorMessage"> 
                <p>Invalid ID and password compination, please go <a href="index.jsp">back</a> and try tologin again. </p>
                <p>&nbsp;</p>
                <p><em>Administrator</em></p>
            </div>
        </c:if>
    </body>
</html>

