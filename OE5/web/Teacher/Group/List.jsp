<%--

FILE DESCRIPTION:
List Groups

CREATION DATE / BY:
18 April 2006 BY Abbas Adel

LAST MODIFY / BY:
6 May 2006 BY Abbas Adel

REQUEST VARIABLES:
User:sessionObject  Contains all user information about user found in Teacher table                 


TO DO:
1- List all groups

JOP TO:
Islam Negm

--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>

<c:set var="subsectionTitle" value="List Groups" scope="request"/>

     <sql:query var="groups">
         SELECT `Group`.GID,`Group`.gname,`Group`.TID,`Teacher`.tname,COUNT(`Assign`.SID) AS `count`,`Group`.gdate
         FROM `Group`,`Assign`,`Teacher`      
         WHERE
         <c:if test="${param.FTID > 0  }" >
             `Teacher`.TID= ?  AND  
             <sql:param value="${param.FTID}" />   
         </c:if>
         `Teacher`.TID = `Group`.TID  AND `Group`.GID = `Assign`.GID
         GROUP BY `Assign`.GID                                                                        
     </sql:query>    
                                               
     <%--<sql:param value="${User.TID}" />--%>


<%-- forward if no groups  --%>
    <c:if test="${groups.rowCount == 0}" >
        <jsp:forward page="../CP.jsp?action=group&subaction=add" >
            <jsp:param name="ErrorMessage"  value="Please create at least one group"/>
        </jsp:forward>
    </c:if>
    
<form method="post" action="CP.jsp?action=group&subaction=edit_update">
    <table width="100%" cellspacing="2" cellpadding="2">
        <tr>
            <td align="right">
                <label></label>
                <label> Filter by:</label>
                
                <sql:query  var="Groups" sql="SELECT DISTINCT `Teacher`.TID,`Teacher`.tname  FROM `Group`,`Teacher` WHERE  `Group`.TID =`Teacher`.TID;"  />
                <select name="FGID" onchange="MM_jumpMenu('parent',this,0)">
                    <option value="CP.jsp?action=group&subaction=list&FTID=0">All</option>
                    <c:forEach items="${Groups.rows}" var="MyGroup">--!>
                        <option value="CP.jsp?action=group&subaction=list&FTID=${MyGroup.TID}" ${param.FTID == MyGroup.TID?"selected":""}>${MyGroup.TName}</option>
                    </c:forEach> 
                </select>
            </td>
        </tr>
        <tr>
            <td>
                <table width="100%" cellpadding="2" cellspacing="2" class="list">
                    <tr>
                        <th width="27%">Group Name </th>
                        <th width="17%">Owner</th>
                        <th width="17%">Number of students </th>
                        <th width="23%">Submit Time Stamp</th>
                        <th width="16%">Action</th>
                    </tr>
                    
                    <c:forEach items="${groups.rows}" var="group" >
                        <tr>
                            <td>${group.gname} </td>
                            <td>${group.tname} </td>
                            <td>${group.count}</td>
                            <td>${group.gdate} </td>
                            <c:choose>
                                <c:when test="${group.TID == User.TID}">
                                    <td>
                                        <a href="CP.jsp?action=group&subaction=edit&GID=${group.GID}">Edit</a>
                                        <a href="CP.jsp?action=group&subaction=delete&GID=${group.GID}">Delete</a>
                                    </td>
                                </c:when>
                                <%--
                                <c:when test="${param.FTID==0}">
                                <c:if test="${group.TID != User.TID}">
                                <td><a href="CP.jsp?action=group&subaction=view&GID=${group.GID}">View</a> </td>
                                </c:if>  
                                <c:if test="${group.TID == User.TID}">
                                <td><a href="CP.jsp?action=group&subaction=edit&GID=${group.GID}">Edit</a>
                                <a href="CP.jsp?action=group&subaction=delete&GID=${group.GID}">Delete</a>  </td>
                                </c:if>  
                                </c:when>
                                --%>
                                <c:otherwise>
                                    <td><a href="CP.jsp?action=group&subaction=view&GID=${group.GID}">View</a> </td>
                                </c:otherwise>
                            </c:choose>                       
                        </tr>
                    </c:forEach>
                </table>
            </td>
        </tr>
    </table>
</form>