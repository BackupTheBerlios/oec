<%--

FILE DESCRIPTION:
View question and its options

CREATION DATE / BY:
26 April 2006 BY Abbas Adel

LAST MODIFY / BY:
26 April 2006 BY Abbas Adel

MODIFICATIONS:
1- Just created

REQUEST VARIABLES:
QID:int             Question ID to edit
User:sessionObject  Contains all user information about user found in Teacher table                 

RESPONSE VARIABLES:
QID:int  

TO DO:
1-show course name of the question
2- show question
3- show auther
4- show all option and mark the selected option
5- forward to edit and pass NOEDIT variable



--%>
<%--

FILE DESCRIPTION:
Edit ONE question from Question Table

CREATION DATE / BY:
18 April 2006 BY Abbas Adel

LAST MODIFY / BY:
18 April 2006 BY Abbas Adel

MODIFICATIONS:
1- Just created

REQUEST VARIABLES:
QID:int             Question ID to edit
User:sessionObject  Contains all user information about user found in Teacher table                 

RESPONSE VARIABLES:
QID:int  

TO DO:
1- List this Teacher courses where the Question's Course is selected in the menu
	& the CID of the course is printed in the "value" atripute ex. value="15" 
2- Show Question in the text area
3- List all options of the Question and check the radio button of the selectedOption
4- All more empty textbox to allaw more options to be added
5- Total number of all Options MUST NOT exceed 10 options
6- Pass QID to the next page usig hiddin input


JOP TO:
Islam Negm

--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>


<form method="post">

    <%-- Store QID value here --%>
    <input type="hidden" name="CID"  value="${param.CID}">
    <%-----------------------------------------------------------------------------------------------------%>
    
    <%-- List teacher's courses here --%>
    <sql:query  var="questionoptions"> 
        SELECT `option`.OID ,`option`.`oname`,`question`.question , `question`.QID
        FROM `teacher`,`course`,`question`,`option`
        WHERE `teacher`.TID=`question`.TID
        AND `course`.CID =?
        AND `question`.QID = ?
        AND `question`.TID = `teacher`.TID
        AND `question`.CID = `course`.CID
        AND `option`.QID = `question`.QID
        <sql:param value="${param.CID}" />
        <sql:param value="${param.QID}" />
    </sql:query>
    <sql:query var="Correctanswer">
        SELECT OID
        FROM `question`
        WHERE `question`.QID = ?
        <sql:param value="${param.QID}"/>
    </sql:query>
    <p>
        <label>Question:<br />
        </label>
        <textarea  name="question" cols="50" >
            ${questionoptions.rows[0].question}
        </textarea>
    </p>
    <p><label>Options:</label>
    </p>
    <p>
        <c:forEach items="${questionoptions.rows}" var="questionoption">
            <c:choose>
                <c:when test="${questionoption.OID == Correctanswer.rows[0].OID}">
                    <input name="selectedOption[${param.QID}]" type="radio" checked="true" value="${questionoption.OID}">  
                </c:when>
                <c:otherwise>
                    <input name="selectedOption[${param.QID}]" type="radio" value="${questionoption.OID}">
                </c:otherwise>
            </c:choose>
            <input name="option[${param.QID}]" type="text" value="${questionoption.oname}" size="50" maxlength="100" selected="selected">
            <br />   
        </c:forEach>
    </p>
</form>





