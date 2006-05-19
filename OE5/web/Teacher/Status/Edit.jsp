<%--

FILE DESCRIPTION:
Show summary

CREATION DATE / BY:
6 May 2006 BY Abbas Adel

LAST MODIFY / BY:
6 May 2006 BY Abbas Adel

MODIFICATIONS:
1- Just created

REQUEST VARIABLES:
User:sessionObject  Contains all user information about user found in Teacher table                 


TO DO:
1- show all my courses added (like course>list)
2- show all my questions (like question>list)
3- show all my exams (like exam>list)
5- show latest 5 my groups (like group>list)
6- show latest 5 my student (like student>list)
7- change numbers in each paragraphs

JOP TO:
Hamada

--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>

<c:set var="subsectionTitle" value="Edit Your Information" scope="request"/>
<sql:query var="TeacherData" sql="SELECT * FROM `Teacher` WHERE `Teacher`.TID =${User.TID}"/>
<form action="edit.jsp" method="post" onsubmit="MM_validateForm('name','','R','password','','R','address','','R','tell','','RisNum','email','','RisEmail');return document.MM_returnValue">
    <table width="100%" border="0" cellpadding="2" cellspacing="2">
        <tr>
            <td>Full name: </td>
            <td><input name="name" type="text" value="${TeacherData.rows[0].tname}" size="40" maxlength="20" /></td>
        </tr>
        <tr>
            <td width="17%">Password:</td>
            <td width="83%"><input name="password" value="${TeacherData.rows[0].password}"type="text" size="40" maxlength="12" /></td>
        </tr>
        <tr>
            <td> Birth Date: </td>
            <td><input name="birth" type="text" value="${TeacherData.rows[0].birth}"  size="40" maxlength="" />
            </td>
        </tr>
        <td> Address: </td>
        <td><input name="address" type="text" value="${TeacherData.rows[0].address}" size="40" maxlength="40" />
        </td>
        </tr>
        <tr>
            <td> Tell Number: </td>
            <td><input name="tell" value="${TeacherData.rows[0].tell}" type="text"size="30" maxlength="10" />
            </td>
        </tr>
        <tr>
            <td> Email: </td>
            <td><input name="email" type="text" value="${TeacherData.rows[0].email}" size="40" maxlength="20" />
            </td>
        </tr>
        <tr>
            <td> Degree:</td>
            <td><select name="degree">
                <option value="4" ${TeacherData.rows[0].Degree == Professor?"selected":""}>Professor</option>
                <option value="3" ${TeacherData.rows[0].Degree == Lecturer?"selected":""}>Lecturer</option>
                <option value="2" ${TeacherData.rows[0].Degree == AssistantLecturer?"selected":""}>Assistant Lecturer</option>
                <option value="1" ${TeacherData.rows[0].Degree == Demonstrator?"selected":""}>Demonstrator</option>
            </select>
            <input name="action" type="hidden" value="update" /></td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td><input type="submit"/>
                <input type="reset"/>
            </td>
        </tr>
    </table>
</form>