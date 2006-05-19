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
                 
RESPONSE VARIABLES:
NormalMessage:String    Message to send if success
ErrorMessage:String     Message to send if failure

TO DO:
1- Update the Question row using QID
2- Delete all old Options and insert new ones
3- Don't insert empty question
4- If SelectedOption point to empty question don't update the question
7- Redirect to "../CP.jsp?action=question&subaction=list" and send the appropriate message 


JOP TO:
Hamada 

--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>

<sql:update var = "DeltedOptions">
    DELETE FROM `Option`
    WHERE `Option`.QID = ?
    <sql:param value="${param.QID}" />
</sql:update>
<%--
<sql:update var="Deletedquestion " >
    DELETE FROM `question`
    WHERE `question`.QID = ?
    <sql:param value="${param.QID}" />
</sql:update>
--%>


    <c:set var="mySelectedOption"  value="selectedOption[${param.QID}]" />   
    <c:if test="${!empty param[mySelectedOption]}" >
        <sql:update>
            UPDATE `Question` SET question = ? , OID = ? , CID = ? 
            WHERE QID = ?
            <sql:param value="${param.question}" />
            <sql:param value="${param[mySelectedOption]}" />               
            <sql:param value="${param.CID}" />
            <sql:param value="${param.QID}" />
        </sql:update>
    
        <c:forEach begin="0" end="10" var="count">
            <c:set var="myquestion"  value="option[${param.QID}]" />  
            <c:if test="${!empty paramValues[myquestion][count]}">
                <sql:update>
                    INSERT INTO `Option` VALUES(?,?,?)
                    <sql:param value="${count+1}" />
                    <sql:param value="${param.QID}" />
                    <sql:param value="${paramValues[myquestion][count]}" />
                </sql:update>
            </c:if>
                      
        </c:forEach>
    </c:if>
<!-- Forward and display error message if QID is not recieved --!>
    <jsp:forward page="../CP.jsp?action=question&subaction=list" >
        <jsp:param name="NormalMessage" 
        value="Question has updated correctly"/>
    </jsp:forward>