<%--

FILE DESCRIPTION:
Show summary

CREATION DATE / BY:
6 May 2006 BY Abbas Adel

LAST MODIFY / BY:
6 May 2006 BY Abbas Adel
9 May 2006 by hamada

MODIFICATIONS:
1- Just created
2-done

REQUEST VARIABLES:
User:sessionObject  Contains all user information about user found in Teacher table                 

RESPONSE VARIABLES:


TO DO:
1- show all user private information and make it editable

JOB TO:
Hamada

--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>

<c:set var="subsectionTitle" value="Summary" scope="request"/>
<table width="100%" cellspacing="2" cellpadding="2">
    <tr>
        <th>Courses</th>
    </tr>
    <tr>
        <td><table width="100%" cellspacing="2" cellpadding="2" class="list">
            <tr class="th2">
                <th>CID</th>
                <th width="57%">Course Name</th>
                <th width="32%">Course Date </th>
            </tr>        
    
            <sql:query var="AllCourses">
                SELECT COUNT(*) AS `TotalCount`
                FROM `Course`    
                                                                         
            </sql:query>
            <sql:query var="YourCourses">
                SELECT COUNT(*) AS `YourCount`
                FROM `Course`,`Teach`
                WHERE `Course`.CID=`Teach`.CID
                AND `Teach`.TID=?
         
                <sql:param value="${User.TID}"/>    
            </sql:query>     
                           
                           
                          
            <sql:query var="Courses">
                SELECT Course.CID, Course.cname, Teach.date FROM Course,Teach                 
                WHERE Teach.CID = Course.CID  AND teach.TID = ? 
                <sql:param value="${User.TID}" />
            </sql:query>
                                                                                                   
                                 
            <tr>
                <br>
                <p><strong>You have <b>${YourCourses.rows[0]['']}</b> courses from <b>${AllCourses.rows[0]['']}</b> Courses </strong>
       
            </tr>               
  
            <c:forEach items="${Courses.rows}" var="course">
                <tr>
                    <td>${course.CID}</td>
                    <td>${course.cname}</td>
                    <td>${course.date}</td>
                </tr>           
              
            </c:forEach>      
                     
        </table></td>
    </tr>
</table>


 
<%--              question section  --%>
 <sql:query var="AllQuestions">
     SELECT COUNT(*) AS `TotalCount`
     FROM `Question`    
                                                                         
 </sql:query>
     <sql:query var="YourQuestions">
         SELECT COUNT(*) AS `YourCount`
         FROM `Question`
         WHERE 
         `Question`.TID=?
         <sql:param value="${User.TID}"/>    
     </sql:query>   
	                     
<table width="100%" cellspacing="2" cellpadding="2">
    <tr>
        <th scope="col">Questions</th>
    </tr>
    <tr>
        <td><table width="100%" cellspacing="2" cellpadding="2" class="list">
            <tr  class="th2">
                <th>Questions</th>
                <th>Courses</th>
                <th>Exams</th>
            </tr>
            <tr>
                <br>
                <p><strong>You have <b>${YourQuestions.rows[0]['']}</b> Questions  from <b>${AllQuestions.rows[0]['']}</b> Questions </strong>
            </tr>
            <sql:query var="questions">
                SELECT Question,Course.cname,Exam.ename FROM Question,Course,Exam
                WHERE 
                Course.CID=Exam.CID
                AND
                Question.CID=Course.CID
                AND
                Question.TID=?  
                <sql:param value="${User.TID}"/>
        
            </sql:query>    
            <c:forEach items="${questions.rows}" var="question">
                <tr>
                    <td>${question.question}</td>
                    <td>${question.cname}</td>
                    <td>${question.ename}</td>
                </tr>
            </c:forEach>
     
        </table></td>
    </tr>
</table>


 
  <%--      Exams section   --%>
   <sql:query var="AllExams">
       SELECT COUNT(*) AS `TotalCount`
       FROM `Exam`    
                                                                         
   </sql:query>
     <sql:query var="YourExams">
         SELECT COUNT(*) AS `YourCount`
         FROM `Exam`
         WHERE `Exam`.TID=?
                 
         <sql:param value="${User.TID}"/>    
     </sql:query>     
  <table width="100%" cellspacing="2" cellpadding="2">
      <tr>
          <th scope="col">Exams</th>
      </tr>
      <tr>
          <td><table width="100%" cellspacing="2" cellpadding="2" class="list">
  
              <tr class="th2">
                  <th>Exams</th>
                  <th>Courses</th>
                  <th>Date</th>
              </tr>
              <tr>
                  <br>
                  <p><strong>You have  <b>${YourExams.rows[0]['']}</b> Exams from <b>${AllExams.rows[0]['']}</b> Exams </strong>
              </tr>
              <sql:query var="exams">
                  SELECT ename,Course.cname,edate FROM Exam,Course
                  WHERE Exam.TID=?
                  AND 
                  Course.CID=Exam.CID
                  <sql:param value="${User.TID}"/>
              </sql:query> 
              <c:forEach items="${exams.rows}" var="exam">
                  <tr>
                      <td>${exam.ename}</td>
                      <td>${exam.cname}</td>
                      <td>${exam.edate}</td>
      
                  </tr>
      
              </c:forEach>  
    
          </table></td>
      </tr>
  </table>

 
<%--                   group section   --%>
 <sql:query var="AllGroups">
     SELECT COUNT(*) AS `TotalCount`
     FROM `Group`    
                                                                         
 </sql:query>
     <sql:query var="YourGroups">
         SELECT COUNT(*) AS `YourCount`
         FROM `Group`
         WHERE `Group`.TID=?
                  
         <sql:param value="${User.TID}"/>    
     </sql:query>         

<table width="100%" cellspacing="2" cellpadding="2">
    <tr>
        <th scope="col">Groups</th>
    </tr>
    <tr>
        <td><table width="100%" cellspacing="2" cellpadding="2"  class="list">
            <tr class="th2">
                <th>Groups </th>
                <th>Date</th>
            </tr>
            <tr>
                <br>
                <p><strong>You have <b>${YourGroups.rows[0]['']} </b> groups  from <b>${AllGroups.rows[0]['']}</b> Groups</strong>
            </tr>
            <sql:query var="groups">
                SELECT gname,gdate FROM `Group`
                WHERE TID=?
        
                <sql:param value="${User.TID}"/> 
            </sql:query>   
    
            <c:forEach items="${groups.rows}" var="group">
                <tr>
                    <td>${group.gname}</td>
                    <td>${group.gdate}</td>
                </tr>
            </c:forEach>    
    
    
        </table></td>
    </tr>
</table>


 <%--      Student section       --%>
   
  <sql:query var="AllStudents">
      SELECT COUNT(*) AS `TotalCount`
      FROM `Student`    
                                                                         
  </sql:query>
     <sql:query var="YourStudents">
         SELECT COUNT(*) AS `YourCount`
         FROM `Student`,`Assign`,`Group`
         WHERE `Student`.SID=`Assign`.SID
         AND `Group`.GID=`Assign`.GID
         AND `Group`.TID=?
         <sql:param value="${User.TID}"/>    
     </sql:query>  
	<table width="100%" cellspacing="2" cellpadding="2">
            <tr>
                <th scope="col">Students</th>
            </tr>
            <tr>
                <td><table width="100%" cellspacing="2" cellpadding="2"  class="list">
                    <tr class="th2">
                        <th>ID</th>   
                        <th width="37%">Students</th>
                        <th width="26%">Group</th>
                        <th width="24%">Date</th>
                    </tr>
   
                    <tr>
                        <br>
                        <p><strong>There are <b>${YourStudents.rows[0]['']} </b> Student's Registeration  assigned to you from  <b>${AllStudents.rows[0]['']}</b> Students </strong>
   
                    </tr>
    
                    <sql:query var="students">
                        SELECT Student.SID,Student.sname,`Group`.gname,`Assign`.date
                        FROM Student,`Assign`,`Group`
        
                        WHERE Student.SID=`Assign`.SID
                        AND
                        `Assign`.GID=`Group`.GID
                        AND
                        `Group`.TID=?  
     
       
                        <sql:param value="${User.TID}"/> 
        
        
                    </sql:query>    
    
                    <c:forEach items="${students.rows}" var="student">
                        <tr>
                            <td>${student.SID}</td>
                            <td>${student.sname}</td>
                            <td>${student.gname}</td>
                            <td>${student.date}</td>
                        </tr>

                    </c:forEach>

                </table></td>
            </tr>
	</table>
    

