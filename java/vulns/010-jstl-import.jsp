<p>正常调用: </p>
<pre>curl <%=request.getRequestURL()%>?url=/</pre>
<p>不正常调用: </p>
<pre>curl <%=request.getRequestURL()%>?url=file:////etc/passwd</pre>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    String url = request.getParameter("url");
    if(url == null) {
        url = "/";
    }
%>
<c:import url="<%= url %>" />