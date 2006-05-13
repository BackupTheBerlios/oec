<%--

FILE DESCRIPTION:
Alist of Questions

CREATION DATE / BY:
18 April 2006 BY Abbas Adel

LAST MODIFY / BY:
20 April 2006 BY Abbas Adel

MODIFICATIONS:
1- Added Filter by 

REQUEST VARIABLES:
User:Session        all user information (TID)
FTID:int			Filter by TID
FCID:int			Filter by CID

RESPONSE VARIABLES:
NormalMessage:String    Message to send if success
ErrorMessage:String     Message to send if failure

TO DO:
1- default behavior: list questions filtered by Teacher(current) Course(all)
2- List all questions with 2 defferent color rows
3- if the question is owned by the teacher show (Edit - Delete) links else show (View) link
4- use FTID and FCID to filter questions list
5- FTID = 0 when choose (All), FCID is the same

JOP FOR:
Islam

--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>

<c:set var="subsectionTitle" value="List Questions" scope="request"/>
  
<table width="100%" cellspacing="2" cellpadding="2">
    <tr>
        <td align="right">
        <form method="post" action="CP.jsp?action=question&subaction=list">
            <label> <em><u>Filter by:</u></em> Teacher: </label>
            <sql:query var="Teachers">
                <%--
                SELECT Teacher.TID, Teacher.tname 
                FROM Teacher, Question, Teach 
                WHERE Question.TID = Teacher.TID AND Teacher.TID = Teach.TID AND Question.CID = Teach.TID
                --%>
                SELECT Teacher.TID, Teacher.tname 
                FROM Teacher, Question, Teach 
                WHERE Question.TID = Teacher.TID AND Teacher.TID = Teach.TID AND Question.CID IN (
                SELECT Teach.CID FROM Teach WHERE Teach.TID = ?)
                GROUP BY Teacher.TID
                <sql:param value="${User.TID}" />
            </sql:query>
            
            <%-- forward if no question --%>
            <c:if test="${Teachers.rowCount == 0}" >
                <jsp:forward page="../CP.jsp?action=question&subaction=add" >
                     <jsp:param name="ErrorMessage"  value="Please insert questions first"/>
                </jsp:forward>
            </c:if>
            
            <select name="FTID">
                <option value="0">All</option>
                <c:forEach items="${Teachers.rows}" var="MyTeacher">
                    <option value="${MyTeacher.TID}" ${param.FTID == MyTeacher.TID?"selected":""}>${MyTeacher.tname}</option>
                </c:forEach>
            </select>
            <label>Course:</label>
            <sql:query var="Courses">
                SELECT DISTINCT Course.CID, Course.cname FROM Course, Teach, Question
                WHERE  Question.CID = Course.CID AND Course.CID = Teach.CID AND Teach.TID = ? 
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
        <td><table width="100%" cellpadding="2" cellspacing="2"  class="list">
            <tr>
                <th width="21%">Question</th>
                <th width="26%">Correct Answer </th>
                <th width="14%">Course</th>
                <th width="14%">Teacher</th>
                <th width="12%">Date</th>
                <th width="50">Action</th>
            </tr>
            <sql:query var="questions"> 
                SELECT Question.QID, Question.question, `Option`.oname, Course.cname, Teacher.tname, Question.`date`, Question.TID ,`Course`.CID
                FROM `Teacher`, `Question`, `Option`, `Teach`, `Course` 
                WHERE 
                <c:if test="${!empty param.FTID && param.FTID != 0}" >
                    `Teacher`.TID = ? AND
                    <sql:param value="${empty param.FTID?User.TID:param.FTID}" />
                </c:if>
                <c:if test="${!empty param.FCID && param.FCID != 0}" >
                    `Course`.CID = ? AND
                    <sql:param value="${param.FCID}" />
                </c:if>
                `Teacher`.TID = `Question`.TID AND `Question`.QID = `Option`.QID
                AND`Question`.OID = `Option`.OID AND `Teacher`.TID = `Teach`.TID AND `Teach`.CID = `Course`.CID 
                AND `Question`.CID = `Course`.CID AND Course.CID IN (SELECT Teach.CID FROM Teach WHERE Teach.TID = ?)
                <sql:param value="${User.TID}" />
            </sql:query>
            <c:forEach items="${questions.rows}"  var="question">
                <tr>
                    <td>${question.question}</td>
                    <td>${question.oname}</td>
                  <td nowrap="nowrap">${question.cname}</td>
                  <td nowrap="nowrap">${question.tname}</td>
                    <td nowrap="nowrap">${question.date}</td>
                    <td nowrap="nowrap">
                        <c:choose>
                            <c:when test="${question.TID == User.TID}">
                                <a href="CP.jsp?action=question&subaction=edit&QID=${question.QID}&CID=${question.CID}">Edit</a> 
                                <a href="CP.jsp?action=question&subaction=delete&QID=${question.QID}">Delete</a> 
                            </c:when>
                            <c:otherwise>
                                <a href="CP.jsp?action=question&subaction=view&QID=${question.QID}&CID=${question.CID}">View</a> 
                            </c:otherwise>
                        </c:choose>
                    </td>
                </tr>
            </c:forEach>
        </table></td>
    </tr>
</table>
