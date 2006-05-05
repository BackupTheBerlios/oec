<!-- this is atest -->
<pre>
    <sql:query var="biso">
        SELECT biso as hh FROM test
    </sql:query>  
    <c:forEach items="${biso.rows}"  var="q">
        <tr  class="row2">
        <c:forEach items="${q}" var="rrrr">
            ${rrrr}
        </c:forEach>
    </c:forEach>
</pre>