<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>

<c:set var="subsectionTitle" value="List Exams" scope="request"/>
     
  <table width="100%" cellspacing="2" cellpadding="2">
      <tr>
          <td align="right">
          <form method="post" action="CP.jsp?action=exam&subaction=list">
              <label> <em><u>Filter by:</u></em></label>
              <sql:query var="Teachers" sql="SELECT DISTINCT teacher.TID,tname FROM teacher, exam WHERE exam.TID = teacher.TID" />
              <select name="FTID">
                  <option value="0">All</option>
                  <c:forEach items="${Teachers.rows}" var="MyTeacher">
                      <option value="${MyTeacher.TID}" ${param.FTID == MyTeacher.TID?"selected":""}>${MyTeacher.tname}</option>
                  </c:forEach>
              </select>
              <label>Course:</label>
              <sql:query var="Courses">
                  SELECT DISTINCT Course.CID,cname FROM Course, Teach, Exam
                  WHERE Teach.CID = Course.CID AND Teach.TID = ? AND Exam.CID = Course.CID
                  <sql:param value="${User.TID}" />
              </sql:query>
              <select name="FCID">
                  <option value="0">All</option>
                  <c:forEach items="${Courses.rows}" var="MyCourse">
                      <option value="${MyCourse.CID}" ${param.FCID == MyCourse.CID?"selected":""}>${MyCourse.cname}</option>
                  </c:forEach>
              </select>
              <input type="submit" name="Submit" value="Filter" />
          </form></td>
      </tr>
      <tr>
          <td>
              <table width="100%" cellpadding="2" cellspacing="2" class="list">
                  <tr>
                      <th width="23%">Exam name </th>
                      <th width="18%">Course</th>
                      <th width="22%">Auther</th>
                      <th width="20%">Submit Time Stamp</th>
                      <th width="17%">Action</th>
                  </tr>
                  <sql:query var="TeacherExams">
                      SELECT `Exam`.CID ,Exam.ename , Course.cname , Teacher.tname ,Exam.edate ,
                      Exam.TID,Exam.EID
                      FROM `Teacher` , `Exam` , `Course` , `Teach`
                      WHERE 
                      <c:if test="${!empty param.FTID && param.FTID != 0}" >
                          `Teacher`.TID = ? AND
                          <sql:param value="${empty param.FTID?User.TID:param.FTID}" />
                      </c:if>
                      <c:if test="${!empty param.FCID && param.FCID != 0}" >
                          `Course`.CID = ? AND
                          <sql:param value="${param.FCID}" />
                      </c:if>
                      Exam.TID = Teacher.TID
                      AND Exam.CID = Course.CID
                      AND Teach.CID = Course.CID
                      AND Teach.TID = Teacher.TID 
                      ORDER BY Course.cname, Exam.edate
                  </sql:query>
                  <c:forEach items="${TeacherExams.rows}" var ="TeacherExam">
                      <tr>
                          <td>${TeacherExam.ename}</td>
                          <td>${TeacherExam.ename}</td>
                          <td>${TeacherExam.ename}</td>
                          <td nowrap="nowrap">${TeacherExam.edate}</td>
                          <td nowrap="nowrap">
                              <c:choose>
                                  <c:when test="${TeacherExam.TID == User.TID}">
                                      <a href="CP.jsp?action=exam&subaction=edit&EID=${TeacherExam.EID}&CID=${TeacherExam.CID}">Edit</a> 
                                      <a href="CP.jsp?action=exam&subaction=delete&EID=${TeacherExam.EID}&CID=${TeacherExam.CID}">Delete</a>
                                  </c:when>
                                  <c:otherwise>
                                      <a href="CP.jsp?action=exam&subaction=view&EID=${TeacherExam.EID}&CID=${TeacherExam.CID}">View</a>
                                  </c:otherwise>
                              </c:choose>                          
                          </td>
                      </tr>
                  </c:forEach>
              </table>
          </td>
      </tr>
  </table>
