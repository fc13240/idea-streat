<?php
/*
 * 点赞数的数据库操作
 * 2015.6.13
*/

	$con = mysql_connect("localhost","root","");
	if (!$con) {
		die('Could not connect: ' . mysql_error());
	}
	mysql_select_db('ideastreat', $con);

	public function readSupport($idcard)
	{
		$sql = "SELECT support FROM support WHERE idcard='{$idcard}';";
		$rs = mysql_query($sql);
		$row = mysql_fetch_array($rs);

		return $row;
	}

	public function addSupport($idcard)
	{
		$row = readSupport($idcard) + 1;
		$sql2 = "UPDATE support SET support='{$row}' WHERE idcard='{$idcard}';";
	}

	mysql_close();
?>