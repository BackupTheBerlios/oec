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
                <th width="10%">Mark </th>
                <th width="10%">Grade </th>              
            </tr>
            <sql:query var="Exams">
SELECT Exam.EID, Exam.ename, Course.cname, Teacher.tname, submitExam.StartDate, submitExam.EndDate, mark, grade
                FROM Exam, Student, `assign`,  submitExam, course, teach, teacher, `result`
                WHERE  `result`.SID = Student.SID AND Student.SID = `assign`.SID AND `assign`.GID = submitExam.GID
                AND `submitExam`.EID = exam.EID AND exam.CID = course.CID AND exam.TID = teacher.TID AND course.CID = teach.CID 
                AND teach.TID = teacher.TID 
                AND Student.SID = ${User.SID}
                
            </sql:query>
            
            
            <c:forEach items="${Exams.rows}" var="Exam">
                <tr>
                    <td>${Exam.EName}</td>
                    <td>${Exam.CName}</td>
                    <td>${Exam.TName}</td>
                    <td align="center" nowrap="nowrap">${Exam.startDate}</td>
                    <td align="center" nowrap="nowrap">${Exam.endDate}</td>
                    <td align="center">${Exam.mark}</td>
                    <td align="center">${Exam.grade}</td>
                </tr>
            </c:forEach>
        </table>

