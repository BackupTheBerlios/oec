<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<pre>
    <sql:query var="biso">
        SELECT biso as hh FROM test
        SELECT TANAHY
        SELECT ISLAM
    </sql:query>  
    <c:forEach items="${biso.rows}"  var="q">
        <tr  class="row2">
        <c:forEach items="${q}" var="rrrr">
            ${rrrr}
        </c:forEach>
    </c:forEach>
</pre>