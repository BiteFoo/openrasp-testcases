<?php
	$baseurl = 'http://' . $_SERVER['HTTP_HOST'] . $_SERVER['PHP_SELF'] . '?cmd=';
	$linux   = $baseurl . 'cp+/etc/passwd+/tmp/';
	$windows = $baseurl . 'calc';
?>

<html>
<head>	
	<meta charset="UTF-8"/>
	<title>004 - 命令执行 - exec 方式，无回显</title>
</head>
<body>
	<h1>004 - 命令执行 - exec 方式，无回显</h1>

	<p>Linux 触发: </p>
	<p>curl '<a href="<?= $linux ?>" target="_blank"><?= $linux ?></a>'</p>
	<p>然后检查 /tmp 是否存在 passwd 这个文件</p>
	<br>

	<p>Windows 触发 - 运行计算器: </p>
	<p>curl '<a href="<?= $windows ?>" target="_blank"><?= $windows ?></a>'</p>

<?php 
	if (isset ($_GET['cmd']))
	{
		exec ($_GET['cmd']);
	}
?>
</body>
</html>