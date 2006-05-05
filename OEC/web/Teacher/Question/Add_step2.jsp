<%--

FILE DESCRIPTION:
Create list of questions and options to the teacher to add

CREATION DATE / BY:
18 April 2006 BY Abbas Adel

LAST MODIFY / BY:
18 April 2006 BY Abbas Adel

MODIFICATIONS:
1- 

REQUEST VARIABLES:
questions:int           number of questions to display
options:int             double array of options of each question
CID:int                 Course ID


TO DO:
1- Modify the HTML presentation
2- Validation

JOP TO:
Abbas Adel

--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>

<form method="post" action="CP.jsp?action=question&subaction=add&step=3" onsubmit="return validateQuestions(this)" name="addQuestions">
  <input type="hidden" name="CID"  value="${param.CID}">
  <input type="hidden" name="countQuestions"  value="${param.questions}">
  <input type="hidden" name="countOptions"  value="${param.options}">
  <c:forEach begin="1" end="${param.questions}" var="QuestCount">
    <p>
      <label>Question[${QuestCount}]</label>
    </p>
    <textarea name="question"  cols="50"></textarea>
    <p>
    <ul>
      <c:forEach begin="1" end="${param.options}" var="OpCount">
        <li>
          <input name="selectedOption[${QuestCount}]" type="radio" value="${OpCount}" />
          <input name="option[${QuestCount}]" type="text"  size="50" maxlength="100" />
        </li>
      </c:forEach>
    </ul>
    <hr>
  </c:forEach>
  <input type="submit" name="Submit" value="Submit" />
</form>
