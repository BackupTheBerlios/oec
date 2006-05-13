<%--

FILE DESCRIPTION:
Teacher register

CREATION DATE / BY:
6 May 2006 BY Abbas Adel

LAST MODIFY / BY:
6 May 2006 BY Abbas Adel

MODIFICATIONS:
1- Just created

REQUEST VARIABLES:

RESPONSE VARIABLES:
name:String
password:String
birth_year:int
birth_month:int
birth_day:int
address:String
tell:int
email:String
action:String (insert)


TO DO:
1- dispaly form to register the student

JOP TO:
Abbas Adel

--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>

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
                  <td>
                  <input name="password" type="text" id="password" size="40" maxlength="12" />
                  </td>
              </tr>
              <tr>
                  <td> Birth Date:</td>
                  <td> Year:
                      <select name="birth_year" id="birth_year">
                          <c:forEach begin="1900" end="2006" var="years">
                              <option value="${years}">${years}</option>
                          </c:forEach>
                      </select>
                      - Month:

                      <select name="birth_month" id="birth_month">
                          <c:forEach begin="1" end="12" var="months">
                              <option value="${months}">${months}</option>
                          </c:forEach>
                      </select>
                      -Day:
                      <select name="birth_day" id="birth_day">
                          <c:forEach begin="1" end="31" var="days">
                              <option value="${days}">${days}</option>
                          </c:forEach>
                      </select>
                  </td>
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
                  <input name="action" type="hidden" value="insert" /></td>
              </tr>
              <tr>
                  <td></td>
                  <td>
                      <input type="submit" name="Submit" value="Submit" />
                      <input type="reset" value="Reset" />
                  </td>
              </tr>
          </table>
      </form>
<jsp:include page="/footer.jsp" />