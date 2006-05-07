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

<c:if test="${empty param.GID}" >
    <jsp:forward page="../CP.jsp?action=group&subaction=list" >
        <jsp:param name="ErrorMessage" 
        value="Please press on <b>'Edit'</b> link in the <b>\"Group List\"</b>"/>
    </jsp:forward>
</c:if>
<c:set var="subsectionTitle" value="Edit Group" scope="request"/>
        
   


<c:if test="${param.Submit}">
    <c:redirect url="Edit_update.jsp" />
</c:if>
<form method="post">

    <%-- Store QID value here --%>
    <input type="hidden" name="QID" value="???" />
    <%-- List teacher's courses here --%>
  <p>
        <label>Group name :</label>
        <label>
        <input name="textfield" type="text" value="Group Name" />
        </label>
  </p>
    <p>
      <label></label>
        <label>Students:</label><label></label>
    </p>
    <table width="200" border="0">
      <tr>
        <td width="29">&nbsp;</td>
        <td width="161">Name</td>
      </tr>
      <tr>
        <td><label>
          <input name="checkbox" type="checkbox" value="checkbox" checked="checked" />
        </label></td>
        <td>Ahmed Eltanahy </td>
      </tr>
      <tr>
        <td><label>
          <input name="checkbox" type="checkbox" value="checkbox" checked="checked" />
        </label></td>
        <td>Ahmed Eltanahy </td>
      </tr>
      <tr>
        <td><label>
          <input type="checkbox" name="checkbox" value="checkbox" />
        </label></td>
        <td>Ahmed Eltanahy </td>
      </tr>
      <tr>
        <td><label>
          <input type="checkbox" name="checkbox" value="checkbox" />
        </label></td>
        <td>Ahmed Eltanahy </td>
      </tr>
    </table>
    <p>
        <input type="submit" name="Submit" value="Submit">
        <input type="reset" name="Reset" value="Reset">
    </p>
</form>
