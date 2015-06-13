<?php 
/*
 * 对提交创意的数据操作
 * 插入数据到数据库，读取数据库中的数据
 * 2015.6.9
*/
	$con = mysql_connect("localhost","root","");
	if (!$con) {
		die('Could not connect: ' . mysql_error());
	}
	mysql_select_db('ideastreat', $con);

	public function InsertIdea($idcard, $title, $content, $externalurl, $pictureid, $publishtime, $worker, $is)
	{
		$sql = "INSERT INTO submission (idcard, title, content, externalurl, pictureid, publishtime, worker, is)VALUES('{$idcard}', '{$title}', '{$content}', '{$externalurl}', '{$pictureid}', '{$publishtime}', '{$worker}', '{$is}');";
		if(!mysql_query($sql)){
			die('Error: '. mysql_error());
		}else{

		}
		
	}

	public function ReadIdea()
	{
		$sql = "select * from submission;";
		$rs = mysql_query($sql);
		while ($row = mysql_fetch_array($rs)) {
			// 获取到的idea的每一条数据
		}
	}

	mysql_close();
?>