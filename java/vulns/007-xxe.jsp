<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="org.w3c.dom.*, javax.xml.parsers.*" %>
<%@ page import="org.xml.sax.InputSource" %>
<%@ page import="java.io.StringReader" %>
<%
    String data = request.getParameter("data");
    String tmp  = "";

    if (data != null) {
	    try {
           DocumentBuilderFactory docFactory = DocumentBuilderFactory.newInstance();
           DocumentBuilder docBuilder = docFactory.newDocumentBuilder();
           Document doc = docBuilder.parse(new InputSource(new StringReader(request.getParameter("data"))));

           NodeList RegistrationNo = doc.getElementsByTagName("foo");
           tmp = RegistrationNo.item(0).getFirstChild().getNodeValue();
		} catch (Exception e) {
            if (e.getClass().getName().equals("com.fuxi.javaagent.exception.SecurityException")) {
                response.sendError(400, "Request blocked by OpenRasp");
            }else {	
                out.print(e);
            }
		}
    }
%>
<html>
<head>
	<meta charset="UTF-8"/>
	<title>007 XXE 漏洞测试</title>

</head>

<body>
	<p>正常调用: </p>
	<pre>curl <%=request.getRequestURL()%> -d data=%3C%3F%78%6D%6C%20%76%65%72%73%69%6F%6E%3D%22%31%2E%30%22%20%65%6E%63%6F%64%69%6E%67%3D%22%49%53%4F%2D%38%38%35%39%2D%31%22%3F%3E%3C%21%44%4F%43%54%59%50%45%20%66%6F%6F%20%5B%20%20%20%3C%21%45%4C%45%4D%45%4E%54%20%66%6F%6F%20%41%4E%59%20%3E%20%20%3C%21%45%4E%54%49%54%59%20%78%78%65%20%53%59%53%54%45%4D%20%22%66%69%6C%65%3A%2F%2F%2F%65%74%63%2F%70%61%73%73%77%64%22%20%3E%5D%3E%3C%66%6F%6F%3E%31%32%33%3C%2F%66%6F%6F%3E</pre>

	<p>不正常调用-linux (读取 /etc/passwd)</p>
	<pre>curl <%=request.getRequestURL()%> -d data=%3C%3F%78%6D%6C%20%76%65%72%73%69%6F%6E%3D%22%31%2E%30%22%20%65%6E%63%6F%64%69%6E%67%3D%22%49%53%4F%2D%38%38%35%39%2D%31%22%3F%3E%3C%21%44%4F%43%54%59%50%45%20%66%6F%6F%20%5B%20%20%20%3C%21%45%4C%45%4D%45%4E%54%20%66%6F%6F%20%41%4E%59%20%3E%20%20%3C%21%45%4E%54%49%54%59%20%78%78%65%20%53%59%53%54%45%4D%20%22%66%69%6C%65%3A%2F%2F%2F%65%74%63%2F%70%61%73%73%77%64%22%20%3E%5D%3E%3C%66%6F%6F%3E%26%78%78%65%3B%3C%2F%66%6F%6F%3E</pre>

    <p>不正常调用-windows (读取 c:/windows/win.ini)</p>
    <pre>curl <%=request.getRequestURL()%> -d data=%3C%3Fxml%20version%3D%221.0%22%20encoding%3D%22ISO-8859-1%22%3F%3E%3C%21DOCTYPE%20foo%20%5B%20%20%20%3C%21ELEMENT%20foo%20ANY%20%3E%20%20%3C%21ENTITY%20xxe%20SYSTEM%20%22file%3A%2F%2F%2Fc%3A%2Fwindows%2Fwin.ini%22%20%3E%5D%3E%3Cfoo%3E%26xxe%3B%3C%2Ffoo%3E</pre>
    <pre>或直接请求:<%=request.getRequestURL()%>?data=%3C%3Fxml%20version%3D%221.0%22%20encoding%3D%22ISO-8859-1%22%3F%3E%3C%21DOCTYPE%20foo%20%5B%20%20%20%3C%21ELEMENT%20foo%20ANY%20%3E%20%20%3C%21ENTITY%20xxe%20SYSTEM%20%22file%3A%2F%2F%2Fc%3A%2Fwindows%2Fwin.ini%22%20%3E%5D%3E%3Cfoo%3E%26xxe%3B%3C%2Ffoo%3E</pre>

    <p>节点内容: <%= tmp %></p>
</body>
</body>
</html>
