<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>

<c:set var="subsectionTitle" value="List Exams" scope="request"/>
<table width="100%" cellspacing="2" cellpadding="2">
    <tr>
        <td align="right"><form id="form1" name="form1" method="post" action="">
            <label><em>Filter</em>:</label>
            <select name="Filter" onchange="MM_jumpMenu('parent',this,0)">
                <option value="CP.jsp?action=exam&subaction=list&Filter=0" ${param.Filter==0?"selected":""}>All</option>
                <option value="CP.jsp?action=exam&subaction=list&Filter=1" ${param.Filter==1?"selected":""}>New Exams</option>
                <option value="CP.jsp?action=exam&subaction=list&Filter=2" ${param.Filter==2?"selected":""}>Old Exams</option>
            </select>
        </form>
        </td>
    </tr>
    <tr>
        <td><table width="100%" cellpadding="2" cellspacing="2" class="list">
            <tr>
                <th width="23%">Exam name </th>
                <th width="18%">Course</th>
                <th width="22%">Auther</th>
                <th width="10%">Start Date </th>
                <th width="10%">End Date </th>
                <th width="10%">Mark </th>
                <th width="10%">Grade </th>
                <th width="17%">Action</th>
            </tr>
            <sql:query var="Exams">
                SELECT Exam.EID, Exam.ename, Course.cname, Teacher.tname, 
                Exam.StartDate, Exam.EndDate, `Result`.Mark,`Result`.Grade, 
                IF(`result`.Mark IS NULL && ((CURRENT_DATE >= `exam`.startDate 
                && CURRENT_DATE <=`exam`.endDate) 
                || `exam`.endDate IS NULL
                || `exam`.startDate IS NULL)
                ,'Examine','') AS `action`
                FROM Exam, Student, `assign`,  submitExam, course, teach, teacher, `result`
                WHERE `Result`.SID = Student.SID AND Student.SID = `assign`.SID AND `assign`.GID = submitExam.GID
                AND `submitExam`.EID = exam.EID AND exam.CID = course.CID AND exam.TID = teacher.TID AND course.CID = teach.CID 
                AND teach.TID = teacher.TID 
                AND Student.SID = ${User.SID}
                <c:if test="${param.Filter == 1}" >
                    AND IF(exam.startDate IS NULL && exam.endDate IS NULL  
                    || ( exam.endDate <= CURRENT_TIMESTAMP() &&  exam.startDate >= CURRENT_TIMESTAMP()), 1,0)
                </c:if>
                
                <c:if test="${param.Filter == 2}" >
                    AND IF(exam.startDate IS NULL && exam.endDate IS NULL  
                    || ( exam.endDate > CURRENT_TIMESTAMP() &&  exam.startDate < CURRENT_TIMESTAMP()), 1,0)
                </c:if>
                
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
                    <td nowrap="nowrap"><a href="CP.jsp?action=exam&subaction=examine&EID=${Exam.EID}">${Exam['']}</a> </td>
                </tr>
            </c:forEach>
        </table>
    </tr>
</table>
