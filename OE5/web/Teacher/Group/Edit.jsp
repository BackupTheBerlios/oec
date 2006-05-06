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

<c:set var="subsectionTitle" value="Edit Question" scope="request"/>

<c:if test="${empty param.QID}" >
    <jsp:forward page="../CP.jsp?action=group&subaction=list" >
        <jsp:param name="ErrorMessage" 
        value="Please press on <b>'Edit'</b> link in the <b>\"Group List\"</b>"/>
    </jsp:forward>
</c:if>
        
   


<c:if test="${param.Submit}">
    <c:redirect url="Edit_update.jsp" />
</c:if>
<form method="post">

    <%-- Store QID value here --%>
    <input type="hidden" name="QID" value="???" />
    <%-- List teacher's courses here --%>
	<p>
    <label>Course:</label>
    
        <select name="CID">
            <%--  Selected course goes here --%>
            <option value="???" selected="selected">MySelectedCourse1</option>
            <option value="???">MyCourse2</option>
        </select>
    </p>
    <p>
        <label>Question:<br />
        </label>
        <textarea name="question" cols="50">
            my question does here
        </textarea>
    </p>
    <p><label>Options:</label></p>
    <p>
        <input name="SelectedOption" type="radio" value="1">
        <input name="options[1]" type="text" value="Option a" size="50" maxlength="100">
        <br />
        <input name="SelectedOption" type="radio" value="2">
        <input name="options[2]" type="text" value="Option B" size="50" maxlength="100">
        <br />
        <input name="SelectedOption" type="radio" value="3" checked>
        <input name="options[3]" type="text" value="SelectedOption" size="50" maxlength="100">
        <br />
        <input name="SelectedOption" type="radio" value="4">
        <input name="options[4]" type="text" value="Option D" size="50" maxlength="100">
        <br />
        <input name="SelectedOption" type="radio" value="5">
        <input name="options[5]" type="text" value="empty for extention..." size="50" maxlength="100">
        <br />
        <input name="SelectedOption" type="radio" value="6">
        <input name="options[6]" type="text" size="50" maxlength="100">
        <br />
        <input name="SelectedOption" type="radio" value="7">
        <input name="options[7]" type="text" size="50" maxlength="100">
        <br />
        <input name="SelectedOption" type="radio" value="8">
        <input name="options[8]" type="text" size="50">
        <br />
        <input name="SelectedOption" type="radio" value="9">
        <input name="options[9]" type="text" size="50" maxlength="100">
        <br />
        <input name="SelectedOption" type="radio" value="10">
        <input name="options[10]" type="text" size="50" maxlength="100">
    </p>
    <p>
        <input type="submit" name="Submit" value="Submit">
        <input type="reset" name="Reset" value="Reset">
    </p>
</form>
