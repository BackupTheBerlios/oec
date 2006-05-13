<%--

FILE DESCRIPTION:
This file will process and insert the qustions added by teacher

CREATION DATE / BY:
18 April 2006 BY Abbas Adel

LAST MODIFY / BY:
25 April 2006 BY Abbas Adel

MODIFICATIONS:
1- Insert into database

REQUEST VARIABLES:
question[]:string         array of questions strings
option[][]:string         double array of options of each question
countQuestions:int
countOptions:int
selectedOption[]:int      array of selected option for each questio
CID:int                   Course ID


TO DO:
1- Insert each question into Question with the selected Option table one by one
2- Select each question id (QID)
3- Store the options in Option table using QID

JOP TO:
Ahmed Tanahy

--%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>


<c:set var="countQuestions"  value="${param.countQuestions}" />
<c:set var="countOptions"  value="${param.countOptions}" />

<sql:query var="MXAQID" sql="SELECT MAX(QID) AS QID FROM Question;"/>

<c:forEach  begin="0" end="${countQuestions-1}" var="question" >
    <c:set var="mySelectedOption"  value="selectedOption[${question+1}]" />

    <c:if test="${!empty param[mySelectedOption]}" >
        <sql:update>
            INSERT INTO `question` VALUES(?, ?, ?, ?, ?, DEFAULT)
            <sql:param value="${MXAQID.rows[0].QID+1+question}" />
            <sql:param value="${param.CID}" />
            <sql:param value="${param[mySelectedOption]}" />   
            <sql:param value="${User.TID}" /> 
            <sql:param value="${paramValues.question[question]}" />
        </sql:update>
    
        <c:forEach begin="0" end="${countOptions-1}" var="count">
            <c:set var="myquestion"  value="option[${question+1}]" />  
            <c:if test="${!empty paramValues[myquestion][count]}">
                <sql:update>
                    INSERT INTO `option` VALUES(?,?,?)
                    <sql:param value="${count+1}" />
                    <sql:param value="${MXAQID.rows[0].QID+1+question}" />
                    <sql:param value="${paramValues[myquestion][count]}" />
                </sql:update>
            </c:if>
                      
        </c:forEach>
    </c:if>
</c:forEach>


<!-- Forward and display error message if QID is not recieved --!>
    <jsp:forward page="../CP.jsp?action=question&subaction=list" >
        <jsp:param name="NormalMessage" 
        value="Questions have inserted correctly"/>
    </jsp:forward>
