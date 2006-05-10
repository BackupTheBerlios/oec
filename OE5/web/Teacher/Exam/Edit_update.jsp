<%--

FILE DESCRIPTION:
Update the Question after edit

CREATION DATE / BY:
18 April 2006 BY Abbas Adel

LAST MODIFY / BY:
18 April 2006 BY Abbas Adel

MODIFICATIONS:
1- Just created

REQUEST VARIABLES:
QID:int             Question ID to update
CID:int             Course ID
question:String     Question String
options[]:String    String array of options           
SelectedOption:int  SelectedOption number
User:sessionObject  Contains all user information about user found in Teacher table
                 


TO DO:
1- Update the Question row using QID
2- Delete all old Options and insert new ones
3- Don't insert empty question
4- If SelectedOption point to empty question don't update the question
5- Redirect if success to "../CP.jsp?action=question&subaction=list"


JOP TO:
Hamada 

--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>

 <c:set var="subsectionTitle" value="Add New Exam" scope="request"/>
<%--<c:forEach items="${param}" var ="row">
    ${row}
</c:forEach> --%>
 <sql:update>
    DELETE FROM `takeexam`
    WHERE `takeexam`.EID=?
    <sql:param value="${param.EID}"/>
</sql:update>

<sql:update >
    UPDATE Exam SET `exam`.ename = ?
    WHERE `exam`.EID = ?   
    <sql:param value="${param.ename} "/>
    <sql:param value="${param.EID}"/>
</sql:update>
<c:forEach items="${paramValues.QID}" var="qustionnumber">
    <sql:update>
    INSERT INTO takeexam VALUES(?,?)
    <sql:param value="${param.EID}" />
    <sql:param value = "${qustionnumber}"/>
</sql:update>
</c:forEach>

<jsp:forward page="../CP.jsp?action=exam&subaction=list" >
        <jsp:param name="NormalMessage" 
        value="Exam has updated correctly"/>
</jsp:forward> 