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


<form action="CP.jsp?action=exam&subaction=submit_insert"  method="post" onsubmit="MM_validateForm('sd','','RinRange1:31','sm','','RinRange1:12','sy','','RinRange2006:2015','ed','','RinRange1:31','em','','RinRange1:12','ey','','RinRange2006:2015','period','','RisNum');return document.MM_returnValue">
    <sql:query var="Groups">
        SELECT `group`.GID ,`group`.gname FROM `group` WHERE `group`.TID =?
        <sql:param value="${User.TID}"/>
    </sql:query>
    <%-- no group found --%>
    <c:if test="${Groups.rowCount == 0}">
        <jsp:forward page="../CP.jsp?action=group&subaction=add" >
            <jsp:param name="ErrorMessage" 
            value="You have to create group before submiting any exams" />
        </jsp:forward>
    </c:if>
    
    <sql:query var="Exams">
        SELECT `exam`.EID ,`exam`.ename , `course`.cname
        FROM `exam` , `course`
        WHERE `exam`.TID = ?  AND `course`.CID = `exam`.CID
        <sql:param value="${User.TID}"/>
    </sql:query>
    
        <%-- no exam  found --%>
    <c:if test="${Exams.rowCount ==  0}">
        <jsp:forward page="../CP.jsp?action=exam&subaction=add" >
            <jsp:param name="ErrorMessage" 
            value="You have to create exam before submiting any exams" />
        </jsp:forward>
    
    </c:if>
    <p><br />
    </p>
    <input type="hidden" name="ename" value="${Exam.ename}">
    <input type="hidden" name="cname" value="${Exam.cname}">
    <table width="100%" border="0">
        <tr>
          <td width="93"><label>Groups:</label></td>
            <td width="775"><select name="GID">
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
                <input name="sd" type="text" size="2" maxlength="2" /> 
                -Month:
                <input name="sm" type="text" size="2" maxlength="2" /> 
                -Year:
                <input name="sy" type="text" size="4" maxlength="4" />            </td>
        </tr>
        <tr>
            <td><label>End Date:</label></td>
            <td>Day:
            <input name="ed" type="text" size="2" maxlength="2" />
            -Month:
            <input name="em" type="text" size="2" maxlength="2" />
            -Year:
          <input name="ey" type="text"size="4" maxlength="4" /></td>
        </tr>
        <tr>
            <td><label>Period:</label></td>
            <td><input name="period" type="text" /></td>
        </tr>
        <tr>
          <td>&nbsp;</td>
          <td><input name="button" type="button" onclick="back();" value="Back" />
            <input name="button" type="button" onclick="document.location.href='CP.jsp?action=exam&amp;subaction=list'" value="Cancel" />
            <input type="submit" value="Finish" />
          </td>
        </tr>
  </table>
    
  <label></label>
</form>
