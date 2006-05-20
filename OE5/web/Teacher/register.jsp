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
degree:int
action:String (insert)


TO DO:
1- dispaly form to register the user

JOP TO:
Abbas Adel

--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@page  errorPage="/index.jsp" %>

<jsp:include page="/header.jsp" />
<h1>Teacher Registration</h1>
<form action="edit.jsp" method="post" onsubmit="MM_validateForm('name','','R','password','','R','address','','R','tell','','RisNum','email','','RisEmail');return document.MM_returnValue">
    <table width="100%" border="0" cellpadding="2" cellspacing="2">
        <tr>
            <td>Full name: </td>
            <td><input name="name" type="text" size="40" maxlength="20" /></td>
        </tr>
        <tr>
            <td width="17%">Password:</td>
            <td width="83%"><input name="password" type="password" size="40" maxlength="12" /></td>
        </tr>
        <tr>
            <td> Birth Date: </td>
            <td> Year:
                <select name="birth_year">
                    <c:forEach begin="1900" end="2006" var="years">
                        <option value="${years}">${years}</option>
                    </c:forEach>
                </select>
                - Month:
                <select name="birth_month">
                    <c:forEach begin="1" end="12" var="months">
                        <option value="${months}">${months}</option>
                    </c:forEach>
                </select>
                - Day:
                <select name="birth_day">
                    <c:forEach begin="1" end="31" var="days">
                        <option value="${days}">${days}</option>
                    </c:forEach>
                </select>
            </td>
        </tr>
        <td> Address: </td>
        <td><input name="address" type="text"  size="40" maxlength="40" />
        </td>
        </tr>
        <tr>
            <td> Tell Number: </td>
            <td><input name="tell" type="text"size="30" maxlength="10" />
            </td>
        </tr>
        <tr>
            <td> Email: </td>
            <td><input name="email" type="text"size="40" maxlength="20" />
            </td>
        </tr>
        <tr>
            <td> Degree: </td>
            <td><select name="degree">
                <option value="4">Professor</option>
                <option value="3">Lecturer</option>
                <option value="2">Assistant Lecturer</option>
                <option value="1" selected="selected">Demonstrator</option>
            </select>
            <input name="action" type="hidden" value="insert" /></td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td><input type="submit"/>
                <input type="reset"/>
            </td>
        </tr>
    </table>
</form>
<jsp:include page="/footer.jsp" />
