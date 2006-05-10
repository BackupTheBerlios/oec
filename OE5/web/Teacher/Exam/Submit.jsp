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
    <sql:query var="Groups">
        SELECT `group`.GID ,`group`.gname FROM `group` WHERE `group`.TID =?
        <sql:param value="${User.TID}"/>
    </sql:query>
    <sql:query var="Exams">
        SELECT `exam`.EID ,`exam`.ename , `course`.cname
        FROM `exam` , `course`
        WHERE `exam`.TID = ?  AND `course`.CID = `exam`.CID
        <sql:param value="${User.TID}"/>
    </sql:query>
    <p><label></label><br />
    </p>
    <table width="302" border="0">
        <tr>
            <td width="65"><label>Groups:</label></td>
            <td width="227"><select name="GID">
                <c:forEach items="${Groups.rows}" var="Group">
                    <option value="${Group.GID}">${Group.gname}</option>
                </c:forEach>
            </select></td>
        </tr>
        <tr>
            <td><label>Exams:</label>
            <br /></td>
            <td><select name="EID">
                <c:forEach items="${Exams.rows}" var="Exam">
                    <option value="${Exam.EID}">${Exam.ename}-${Exam.cname}</option>
                </c:forEach>
            </select></td>
        </tr>
        <tr>
            <td><label>Start date: </label></td>
            <td>Day:
                <input name="sd" type="text" id="sd" size="2" maxlength="2" /> 
                -Month:
                <input name="sm" type="text" id="sm" size="2" maxlength="2" /> 
                -Year:
                <input name="sy" type="text" id="sy" size="4" maxlength="4" />            </td>
        </tr>
        <tr>
            <td><label>End Date:</label></td>
            <td>Day:
            <input name="ed" type="text" id="ed" size="2" maxlength="2" />
            -Month:
            <input name="em" type="text" id="em" size="2" maxlength="2" />
            -Year:
          <input name="ey" type="text" id="ey" size="4" maxlength="4" /></td>
        </tr>
        <tr>
            <td><label>Period:</label></td>
            <td><input name="period" type="text" id="period" /></td>
        </tr>
    </table>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <p>
        
        <label></label>
        <br />
        <br />
        <br />
    </p>
    <p>
        <input type="button" onclick="back();" value="Back" />
        <input type="button" onclick="document.location.href='CP.jsp?action=exam&amp;subaction=list'" value="Cancel" />
        <input type="submit" name="Submit" value="Finish" />
    </p>
</form>