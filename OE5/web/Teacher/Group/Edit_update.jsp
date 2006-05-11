<%--

FILE DESCRIPTION:
Update Group information after edit

CREATION DATE / BY:
11 May 2006 BY Abbas Adel

LAST MODIFY / BY:
11 May 2006 BY Abbas Adel

MODIFICATIONS:
1- 

REQUEST VARIABLES:
GID:int
gname:String
SID[]:int
                 


TO DO:
1- Update the Question row using QID
2- Delete all old Options and insert new ones
3- Don't insert empty question
4- If SelectedOption point to empty question don't update the question
5- Redirect if success to "../CP.jsp?action=question&subaction=list"


JOP TO:
Islam Negm

--%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>

<c:set var="subsectionTitle" value="Add New Exam" scope="request"/>

<c:forEach items="${param}" var ="row">
    ${row}
</c:forEach>

 <sql:update>
     UPDATE `group` set `group`.GName=?   WHERE `group`.GID=?
     <sql:param value="${param.gname}" />
     <sql:param value="${param.GID}"/>   
 </sql:update>

<c:forEach items="${paramValues.SID}" var="Student">
    <sql:update>       
        DELETE FROM `assign`
        WHERE `assign`.GID=?
        <sql:param value="${param.GID}"/>    
    </sql:update>
</c:forEach>
<sql:query var="MAXGID" sql="SELECT MAX(GID) AS GID FROM `group`"/>
<c:forEach items="${paramValues.SID}" var="Student">
    <sql:update>
        INSERT INTO `assign` VALUES(?,?,DEFAULT)
        <sql:param value="${param.GID}" />
        <sql:param value="${Student}" />
    </sql:update>                      
</c:forEach>
<jsp:forward page="../CP.jsp?action=group&subaction=list" >
    <jsp:param name="NormalMessage" 
    value="Exam has updated correctly"/>
</jsp:forward> 