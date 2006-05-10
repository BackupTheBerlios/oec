<%--

FILE DESCRIPTION:
Correct exam and save the result

CREATION DATE / BY:
7 May 2006 BY Abbas Adel

LAST MODIFY / BY:
7 May 2006 BY Abbas Adel

MODIFICATIONS:
1- Insert into database

REQUEST VARIABLES:
EID:int             Exam ID
ename:String        Exam name
QID[]:int           contain all question IDs
OID[]:int           contain the answer ( OID[1] )
User:SessionObject

TO DO:
1- Correct the questions and save them in the database (result)
2- Forward to CP.jsp?action=exam&subaction=list
3- Send message to the teacher and to the student

JOP TO:
Abbas Adel

--%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>


<!-- Forward and display error message if QID is not recieved --!>
    <jsp:forward page="../CP.jsp?action=question&subaction=list" >
        <jsp:param name="NormalMessage" 
        value="Your exam have submitted successfully"/>
    </jsp:forward>

    
