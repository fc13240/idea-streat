<?php
/*
 * 周五佳的评定与录入
*/

	public function selectFive()
	{
		$sql = "SELECT idcard,time FROM support ORDER BY support;";
		$rs = mysql_query($sql);
		while ($row = mysql_fetch_array($rs)) {
			// 获取到的idea的每一条数据
			readTime($row['idcard'],$row['time']);
		}
	}

	public function readTime($idcard,$time)
	{
		$sql = "SELECT publishTime FROM submission WHERE idcard='{$idcard}';";
		$rs = mysql_query($sql);
		while ($row = mysql_fetch_array($sql)) {
			if (strtotime($row[0])<strtotime($time)) {
				// 处理时间不在这一周的情况
			}
		}
		
	}
?>