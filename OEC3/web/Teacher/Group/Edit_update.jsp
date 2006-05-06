<%--

FILE DESCRIPTION:
Update the Question after edit

CREATION DATE / BY:
18 April 2006 BY Abbas Adel

LAST MODIFY / BY:
18 April 2006 BY Abbas Adel

MODIFICATIONS:
1- Just created

REQUEST VARIABLES:
QID:int             Question ID to update
CID:int             Course ID
question:String     Question String
options[]:String    String array of options           
SelectedOption:int  SelectedOption number
User:sessionObject  Contains all user information about user found in Teacher table
                 


TO DO:
1- Update the Question row using QID
2- Delete all old Options and insert new ones
3- Don't insert empty question
4- If SelectedOption point to empty question don't update the question
5- Redirect if success to "../CP.jsp?action=question&subaction=list"


JOP TO:
Hamada 

--%>