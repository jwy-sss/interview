<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%
	String path = request.getContextPath();
String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<title>录入题目</title>
<meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">

<link rel="stylesheet" type="text/css"
	href="lib/bootstrap/css/bootstrap.css">
<link rel="stylesheet" type="text/css"
	href="lib/bootstrap/css/bootstrap-responsive.css">
<link rel="stylesheet" type="text/css" href="stylesheets/theme.css">
<link rel="stylesheet" href="lib/font-awesome/css/font-awesome.css">

<script src="lib/jquery-1.8.1.min.js" type="text/javascript"></script>
<script type="text/javascript" src="js/jquery.js"></script>
<!--<script type="text/javascript" src="js/jquery.select.js"></script>-->
<script type="text/javascript"></script>

<!-- Demo page code -->

<style type="text/css">
#line-chart {
	height: 300px;
	width: 800px;
	margin: 0px auto;
	margin-top: 1em;
}

.brand {
	font-family: georgia, serif;
}

.brand .first {
	color: #ccc;
	font-style: italic;
}

.brand .second {
	color: #fff;
	font-weight: bold;
}

.textareaform {
	width: 276px;
	height: 133px;
}
</style>
<link rel="shortcut icon" href="../assets/ico/favicon.ico">
<link rel="apple-touch-icon-precomposed" sizes="144x144"
	href="../assets/ico/apple-touch-icon-144-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="114x114"
	href="../assets/ico/apple-touch-icon-114-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="72x72"
	href="../assets/ico/apple-touch-icon-72-precomposed.png">
<link rel="apple-touch-icon-precomposed"
	href="../assets/ico/apple-touch-icon-57-precomposed.png">
</head>
<body>
	<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
		url="jdbc:mysql://localhost:3306/0703?useUnicode=true&characterEncoding=utf-8"
		user="root" password="admin" />

	<sql:query dataSource="${snapshot}" var="result">
	SELECT * from proType;
	</sql:query>
	<div class="navbar"></div>
	<div class="container-fluid">
		<div class="row-fluid">
			<div class="span9">
				<h1 class="page-title" id="home">录入题目</h1>
				<div class="well">
					<ul class="nav nav-tabs">
						<li class="active"><a href="#home" data-toggle="tab">基本信息</a></li>
						<li></li>
					</ul>
					<form id="table1" action="addPro.action" method="post">
						<table class="table">
							<thead>
								<tr>
									<th>类别</th>
									<th>内容</th>
									<th style="width: 26px;"></th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>题目：</td>
									<td><textarea rows="5" cols="30" name="proTitle" value=""
											class="textareaform"></textarea></td>
								</tr>
								<tr>
									<td>关键字：</td>
									<td><input type="text" name="proKey" value=""
										class="input-xlarge"></td>
								</tr>
								<tr>
									<td>题目类型：</td>
									<!-- 	<td><input type="text" name="proType" value="" class="input-xlarge"></td> -->
									<td><select name="proType" class="input-xlarge"
										onchange="choosetype(this)">
											<!--  <option value="">/...请选择试题类型.../</option> -->
											<c:forEach var="row" items="${result.rows}">
												<option><c:out value="${row.proTypeName}" /></option>
											</c:forEach>
									</select></td>
								</tr>
								<tr>
								<tr>
									<td>图片链接：</td>
									<td><input type="file" name="proPic" value="上传图片"
										multiple="multiple" style="width: 276px"></td>
								</tr>


							</tbody>
						</table>
						<div class="btn-toolbar">
							<button class="btn btn-primary" type="submit">
								<i class="icon-save"></i> 添加
							</button>
							<div class="btn-group"></div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

	<footer>
	<hr>
	<p class="pull-right">Javateam</p>
	<p>&copy; 2020</p>
	</footer>
</body>
<script type="text/javascript">
	var height = $(window).height() > 445 ? $(window).height() : 445;
	$("#container").height(height);
	var bdheight = ($(window).height() - $('#bd').height()) / 2 - 20;
	$('#bd').css('padding-top', bdheight);
	$(window).resize(function(e) {
		var height = $(window).height() > 445 ? $(window).height() : 445;
		$("#container").height(height);
		var bdheight = ($(window).height() - $('#bd').height()) / 2 - 20;
		$('#bd').css('padding-top', bdheight);
	});
	$('select').select();/*用法：http://www.w3school.com.cn/jquery/event_select.asp*/
</script>
</html>