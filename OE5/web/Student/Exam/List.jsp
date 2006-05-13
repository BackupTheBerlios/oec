
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>

<c:set var="subsectionTitle" value="List Exams" scope="request"/>
<table width="100%" cellpadding="2" cellspacing="2" class="list">
    <tr>
        <th width="23%">Exam name </th>
        <th width="18%">Course</th>
        <th width="22%">Auther</th>
        <th width="10%">Start Date </th>
        <th width="10%">End Date </th>
        <th width="10%">Period </th>
        <th width="17%">Action</th>
    </tr>
    <sql:query var="Exams">
        SELECT SubmitExam.SEID, Exam.ename, Course.cname, Teacher.tname, submitExam.startDate, SubmitExam.EndDate, SubmitExam.period,
        IF(CURRENT_DATE()<= submitExam.endDate, 'Examine','Not Yet')
        FROM Exam, `Assign`,  SubmitExam, Course,  Teacher
        WHERE  `assign`.GID = submitExam.GID
        AND `submitExam`.EID = exam.EID AND exam.CID = course.CID AND exam.TID = teacher.TID 
        AND `Assign`.SID = ${User.SID}
        AND CURRENT_DATE() >= submitExam.startDate
        AND SubmitExam.SEID NOT IN (SELECT SEID FROM `Result` WHERE SID = ${User.SID})
                
    </sql:query>

    <c:forEach items="${Exams.rows}" var="Exam">
        <tr>
            <td>${Exam.EName}</td>
            <td>${Exam.CName}</td>
            <td>${Exam.TName}</td>
            <td align="center" nowrap="nowrap">${Exam.startDate}</td>
            <td align="center" nowrap="nowrap">${Exam.endDate}</td>
            <td align="center" nowrap="nowrap">${Exam.period} Minutes</td>
            <td nowrap="nowrap">
            <c:if test="${Exam['']=='Examine'}">
            <a href="CP.jsp?action=exam&subaction=prepare&SEID=${Exam.SEID}" onclick="return confirm('Are you sure that you want to have ${Exam.CName} exam? \n Press OK when you are ready.');">Examine</a> </td>
            </c:if>
            <c:if test="${Exam['']!='Examine'}">
                Not Yet
            </c:if>
        </tr>
    </c:forEach>
</table>

