<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
    <title>Online Examination Center</title>
    <link href="/OE/css.css" rel="stylesheet" type="text/css" />
    <script language="JavaScript" type="text/JavaScript" src="/OE/validation.js"></script>
</head>

<body>


<table width="100%"  align="center" cellpadding="0" cellspacing="0">
  <tr>
      <td id="hearder" valign="bottom">
                <c:choose>
              <c:when test="${! empty User}" >
                  <a href="/OE/index.jsp">Home</a> - <a href="/OE/logout.jsp">Logout</a> 
              </c:when>
              <c:otherwise>
                  <form action="login.jsp" method="post" onsubmit="MM_validateForm('ID','','R','password','','R');return document.MM_returnValue">
                      <label>Your ID:</label>
                      <input name="ID" type="text" size="10" maxlength="20" />
                      <label>Password:</label>
   
                      <input name="password" type="password" size="10" maxlength="20" />
                      <label>Type:</label>
                      <select name="type">
                          <option value="student" selected="selected">Student</option>
                          <option value="teacher">Teacher</option>
                      </select>
                      <input type="submit" name="Submit" value="Submit" />
                  </form>
              </c:otherwise>
              
          </c:choose>  
      </td>
  </tr>
  <tr>
    <td colspan="2">
    
 
