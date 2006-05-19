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
SELECT Exam.EID, Exam.ename, Course.cname, Teacher.tname, submitExam.startdate, submitExam.enddate, mark, grade
                FROM Exam, Student, `Assign`,  SubmitExam, Course, Teach, Teacher, `Result`
                WHERE  `Result`.SID = Student.SID AND Student.SID = `Assign`.SID AND `Assign`.GID = SubmitExam.GID
                AND `SubmitExam`.EID = Exam.EID AND Exam.CID = Course.CID AND Exam.TID = Teacher.TID AND Course.CID = Teach.CID 
                AND Teach.TID = Teacher.TID 
                AND Student.SID = ${User.SID}
                
            </sql:query>
            
            
            <c:forEach items="${Exams.rows}" var="Exam">
                <tr>
                    <td>${Exam.ename}</td>
                    <td>${Exam.cname}</td>
                    <td>${Exam.tname}</td>
                    <td align="center" nowrap="nowrap">${Exam.startdate}</td>
                    <td align="center" nowrap="nowrap">${Exam.enddate}</td>
                    <td align="center">${Exam.mark}</td>
                    <td align="center">${Exam.grade}</td>
                </tr>
            </c:forEach>
        </table>

