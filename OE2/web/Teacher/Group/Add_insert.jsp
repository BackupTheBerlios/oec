<%--

FILE DESCRIPTION:
Insert student group in the database.
CREATION DATE / BY:
28 April 2006 BY Abbas Adel

LAST MODIFY / BY:
28 April 2006 BY Abbas Adel

MODIFICATIONS:
1- Just created

REQUEST VARIABLES:
1- SID:int[].
2- gname:String.


TO DO:
1-insert group name into group table
2-insert students of this group into assign table
3- confirm

JOP TO:
Ahmed Tanahy

--%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>


<sql:query var="MAXGID" sql="SELECT MAX(GID) AS GID FROM `group`"/>
        
        <sql:update>
            INSERT INTO `group` VALUES(?, ?, ?,DEFAULT)
            <sql:param value="${MAXGID.rows[0].GID+1}" />
            <sql:param value="${User.TID}" />
            <sql:param value="${param.gname}" />    
        </sql:update>
    
        <c:forEach items="${paramValues.SID}" var="Student">
                <sql:update>
                    INSERT INTO `assign` VALUES(?,?,DEFAULT)
                    <sql:param value="${MAXGID.rows[0].GID+1}" />
                    <sql:param value="${Student}" />
                </sql:update>                      
        </c:forEach>
<!-- Forward and display error message if QID is not recieved --!>
    <jsp:forward page="../CP.jsp?action=group&subaction=list" >
        <jsp:param name="NormalMessage" 
        value="Group ${param.gname} has inserted correctly"/>
    </jsp:forward>
