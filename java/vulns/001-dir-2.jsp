<%@page import="java.io.*" %>
<%@page import="java.util.*" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<html>
<head>	
	<meta charset="UTF-8"/>
	<title>001 任意目录读取</title>
</head>
<body>
	<h1>001 - 1 - 使用 File.listFiles 遍历目录（无路径拼接）</h1>
<%
String dirname = request.getParameter("dirname");
if (dirname != null) {
try {
	File folder = new File(dirname);
	if (folder.isDirectory()) {
		File[] listOfFiles = folder.listFiles();
		for (File file : listOfFiles) {
		    out.println(file.getName());
		}
	}
} catch (Exception e) {
   if (e.getClass().getName().equals("com.fuxi.javaagent.exception.SecurityException")) {
       response.sendError(400, "Request blocked by OpenRasp");
   }else {	
       out.print(e);
   }
}
} else {
%>
<p>正常调用: </p>
<pre>curl <%=request.getRequestURL()%>?dirname=reports</pre>
<p>不正常调用 - Linux: </p>
<pre>curl <%=request.getRequestURL()%>?dirname=../../../../../../../../../../../../../../../var/log/</pre>
<%
	}
%>
</body>
</html>
