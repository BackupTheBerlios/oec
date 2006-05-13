<%--

FILE DESCRIPTION:
INSERT Group Name and Select Students to enter this group

CREATION DATE / BY:
28 April 2006 BY Abbas Adel

LAST MODIFY / BY:
28 April 2006 BY Abbas Adel

MODIFICATIONS:
1- Just created

TO DO:
1- Modify the HTML presentation
2- Validation

RESPONSE PRAMTERS:
1- SID:int[].
2- gname:String.

JOP FOR:
Abbas Adel

--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>


<sql:query var= "Students" sql="SELECT SID , sname , `date` FROM Student" />
<form action="CP.jsp?action=group&subaction=add&step=3" method="post" onsubmit="MM_validateForm('gname','','R');return checkOne('SID', 'Please Select at least one student') && document.MM_returnValue">
  <table width="100%" cellspacing="2" cellpadding="2">
    <tr>
      <td><label>Group Name:</label>
        <input name="gname" type="text" /></td>
    </tr>
    <tr>
      <td>
	  <table width="100%" cellspacing="2" cellpadding="2" class="list">
          <tr>
            <th width="10"><input type="checkbox" name="checkbox" value="checkbox"  onchange="checkAll('SID')"/></th>
            <th width="49%">Student Name </th>
            <th width="48%">Registration Date </th>
          </tr>
          <c:forEach items="${Students.rows}" var="Student">
          <tr>
            <td><input name="SID" type="checkbox" value="${Student.SID}" /></td>
            <td>${Student.Sname} </td>
            <td>${Student.date}</td>
          </tr>
          </c:forEach>
        </table>
	  </td>
    </tr>
    <tr>
      <td><input type="submit" name="Submit" value="Submit" /></td>
    </tr>
  </table>
</form>
