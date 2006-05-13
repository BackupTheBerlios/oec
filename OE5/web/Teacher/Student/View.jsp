<%--

FILE DESCRIPTION:
Show Student information

CREATION DATE / BY:
2 May 2006 BY Abbas Adel

LAST MODIFY / BY:
2 May 2006 BY Abbas Adel

MODIFICATIONS:
1- 

REQUEST VARIABLES:
User:Session        all user information (TID)
SID:int

TO DO:
1- Show student information from Student table
2- list all exams that the student has did (Result+Exam)

JOP FOR:
Hamada

--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>

<c:if test="${empty param.SID}" >
    <jsp:forward page="../CP.jsp?action=student&subaction=list" >
        <jsp:param name="ErrorMessage" 
        value="Please press on <b>'View'</b> link in the <b>\"Student List\"</b>"/>
    </jsp:forward>
</c:if>
<c:set var="subsectionTitle" value="View Student Information" scope="request"/>

<sql:query var="myStudent">
    SELECT SName, Email, Address, `date`
    FROM student
    WHERE SID=?
    <sql:param value="${param.SID}"/>   
</sql:query>


<table width="100%" cellspacing="2" cellpadding="2">
    <tr>
        <td><p><strong>Student Name: </strong>${myStudent.rows[0].sname}</p>
        <p><strong>Address: </strong>${myStudent.rows[0].address}</p>
        <p><strong>Email:</strong>${myStudent.rows[0].email}</p>
        <p><strong>Registration Date: </strong>${myStudent.rows[0].date}</p></td>
    </tr>
    <tr>
        <td>
            <table width="100%" cellspacing="2" cellpadding="2" class="list">
                <tr>
                    <th scope="col">Exam Name </th>
                    <th scope="col">Course Name </th>
                    <th scope="col">Date of Exam </th>
                    <th scope="col">Grade</th>
                    <th scope="col">Mark</th>
                </tr>
                <sql:query var="Exams">
                    SELECT exam.EName, course.CName,exam.EDate,`result`.Grade,`result`.Mark
                    FROM exam,course,`result`, SubmitExam
                    WHERE Course.CID = Exam.CID AND Exam.EID = SubmitExam.EID AND SubmitExam.SEID = `result`.SEID
                    AND exam.TID=?
                    <sql:param value="${User.TID}" />
                    And `result`.SID=?
                    <sql:param value="${param.SID}"/>       
                </sql:query>    
                <c:forEach items="${Exams.rows}" var="exam" >
                    <tr>
                        <td>${exam.ename}</td>
                        <td>${exam.cname}</td>
                        <td>${exam.edate}</td>
                        <td>${exam.grade}</td>
                        <td>${exam.mark}</td>
                    </tr>
                </c:forEach>
            </table>
        </td>
    </tr>
</table>
