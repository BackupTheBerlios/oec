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
                SELECT Exam.EID, Exam.ename, Course.cname, Teacher.tname, submitExam.StartDate, submitExam.EndDate, submitExam.period
                FROM Exam, Student, `assign`,  submitExam, course, teach, teacher
                WHERE  Student.SID = `assign`.SID AND `assign`.GID = submitExam.GID
                AND `submitExam`.EID = exam.EID AND exam.CID = course.CID AND exam.TID = teacher.TID AND course.CID = teach.CID 
                AND teach.TID = teacher.TID 
                AND Student.SID = ${User.SID}
                AND submitExam.EndDate >= CURRENT_DATE()
                
            </sql:query>
            
            
            <c:forEach items="${Exams.rows}" var="Exam">
                <tr>
                    <td>${Exam.EName}</td>
                    <td>${Exam.CName}</td>
                    <td>${Exam.TName}</td>
                    <td align="center" nowrap="nowrap">${Exam.startDate}</td>
                    <td align="center" nowrap="nowrap">${Exam.endDate}</td>
                    <td align="center" nowrap="nowrap">${Exam.period} Minutes</td>
                    <td nowrap="nowrap"><a href="CP.jsp?action=exam&subaction=prepare&EID=${Exam.EID}" onclick="return confirm('Are you sure that you want to have ${Exam.CName} exam? \n Press OK when you are ready.');">Examine</a> </td>
                </tr>
            </c:forEach>
        </table>

