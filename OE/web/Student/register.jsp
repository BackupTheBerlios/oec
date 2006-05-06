<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/header.jsp" />
<h1>Student Registration</h1>
      <form action="edit.jsp" method="post" onsubmit="MM_validateForm('name','','R','address','','R','tell','','RisNum','email','','RisEmail');return document.MM_returnValue">
        <table width="100%" border="0" cellpadding="2" cellspacing="2">
          <tr>
            <td width="17%"> Full name: </td>
            <td width="83%"><input name="name" type="text" id="name" size="40" />
            </td>
          </tr>
          <tr>
            <td>Password:</td>
            <td><label>
              <input name="password" type="text" id="password" size="40" maxlength="12" />
              </label></td>
          </tr>
          <tr>
            <td> Birth Date: </td>
            <td> Year:
              <select name="birth_year" id="birth_year">
                <c:forEach begin="1900" end="2006" var="years">
                  <option value="${years}">${years}</option>
                </c:forEach>
              </select>
              - Month:
              <label>
              <select name="birth_month" id="birth_month">
                <c:forEach begin="1" end="12" var="months">
                  <option value="${months}">${months}</option>
                </c:forEach>
              </select>
              </label>
              -
              <label> Day:
              <select name="birth_day" id="birth_day">
                <c:forEach begin="1" end="31" var="days">
                  <option value="${days}">${days}</option>
                </c:forEach>
              </select>
              </label></td>
          </tr>
          <tr>
            <td> Address: </td>
            <td><input name="address" type="text" id="address" size="40" />
            </td>
          </tr>
          <tr>
            <td> Tell Number: </td>
            <td><input name="tell" type="text" id="tell" size="30" />
            </td>
          </tr>
          <tr>
            <td> Email: </td>
            <td><input name="email" type="text" id="email" size="40" />
              <input name="action" type="hidden" id="action" value="insert" /></td>
          </tr>
          <tr>
            <td></td>
            <td><input type="submit" name="Submit" value="Submit" />
              <input type="reset" name="Submit2" value="Reset" />
            </td>
          </tr>
        </table>
      </form>
	  <jsp:include page="/footer.jsp" />