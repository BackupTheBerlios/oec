<%--

FILE DESCRIPTION:
submit exam to a group

CREATION DATE / BY:
6 May 2006 BY Abbas Adel

LAST MODIFY / BY:
6 May 2006 BY Abbas Adel

MODIFICATIONS:
1- Just created

REQUEST VARIABLES:
User:SessionObject

RESPONSE VARIABLES:
GID:int             Eroup ID
EID:int             Exam ID

TO DO:
1- list all groups of this teacher
2- list exams (of this teacher) where startDate and EndDate are valid + course name

JOP TO:
Hamada

--%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>

<c:set var="subsectionTitle" value="Submit Exams" scope="request"/>


<form  method="post" action="CP.jsp?action=exam&subaction=submit_insert">
  
    <p><label>Groups:</label><br />
        <select name="GID">
            <option value="1">CS</option>
            <option value="2">IT</option>
        </select>
        <br />
        <br />
    </p>
    <p>
        <label>Exams:</label><br />
        <select name="EID">
            <option value="2">Midterm - Math</option>
            <option value="3">Final - Logic </option>
        </select>
        <br />
        <br />
    </p>
    <p>
        <input type="button" onclick="back();" value="Back" />
        <input type="button" onclick="document.location.href='CP.jsp?action=exam&amp;subaction=list'" value="Cancel" />
        <input type="submit" name="Submit" value="Finish" />
    </p>
</form>