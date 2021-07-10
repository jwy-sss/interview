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
.checkb {
	width: 300px;
	height: 120px;
	border-width: 5px;
	border-color: gray;
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
		url="jdbc:mysql://localhost:3306/0703?useUnicode=true&characterEncoding=utf-8&serverTimezone=UTC"
     user="root"  password="admin"/>

	<sql:query dataSource="${snapshot}" var="result">
	SELECT * from proType;
	</sql:query>
	<div class="navbar"> </div>
		<div class="container-fluid">
			<div class="row-fluid">
				<div class="span9">
					<h1 class="page-title">新建面试</h1>
					<div class="well">
						<ul class="nav nav-tabs">
							<li class="active"><a href="#home" data-toggle="tab">基本信息</a></li>
						</ul>
						<div id="myTabContent" class="tab-content">
							<div class="tab-pane active in" id="home">
								<form id="tab" action="addTest.action" method="post">
									<input type="hidden" name="teaId" value="${userId}"/>
									<input type="hidden" name="testSum" value="0"/>
									<label>考生身份证号：</label>
									<input type="text" name="eeNo" value="" id="number" class="input-xlarge" onblur="myFunction()"/>
									<div id="numberwarning" style="display: none; color: red;">请注意身份证号格式为18位</div>
									<label>考生姓名：</label>
									<input type="text" name="eeName" value="" class="input-xlarge" />
									<label>考生性别：</label>
									<select name="eeSex">
										<option value="男">男</option>
										<option value="女">女</option>
									</select>
									
									<label>试题数量：</label>
									<input type="text" name="testNum" value="" class="input-xlarge">
									
									<div class="checkb">
									<label>面试题目类型：</label>
									<c:forEach var="row" items="${result.rows}">
										<input type="checkbox" name="ProTypes" value="${row.proTypeName}" id="p_${row.index}" onclick="checkClick(this,'n_${row.proTypeName}')"/>
										<c:out value="${row.proTypeName}" />
										<br/>
									</c:forEach>
									</div>
									
									<div class="checkb">
									<label>必考类型：</label>
									<c:forEach var="row" items="${result.rows}">
										<input type="checkbox" name="NecessaryProTypes" 
										value="${row.proTypeName}" id="n_${row.proTypeName}" 
										disabled=true onclick="chkbox(this)"/>
										<c:out value="${row.proTypeName}" />
										<br/>
									</c:forEach>
									</div>	
									<div id="warning" style="display: none; color: red;">注意必选题目类型数量不能超过总题数</div>								
																	
									<div class="btn-toolbar">
										<button class="btn btn-primary" type="submit"><i class="icon-plus"></i> 生成试卷</button>
										<div class="btn-group">
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
			<footer>
				<hr>
				<p class="pull-right">Javateam</p>
				<p>&copy; 2020</p>
			</footer>
			<script src="lib/bootstrap/js/bootstrap.js"></script>
		</div>
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
	
	function checkClick(chk,id) {
		if (chk.checked == true) {
			document.getElementById(id).disabled=false;
		}
		else{
			document.getElementById(id).disabled=true;
			document.getElementById(id).checked=false;
		}
	}
	
	function myFunction(){
		var l =document.getElementById('number').value;
		if(l.length!=18){
			document.getElementById('numberwarning').style.display="inline";
		}else{
			document.getElementById('numberwarning').style.display="none";
		}
	}
	
	function chkbox(elm)
	{
		var obj=document.getElementsByName("NecessaryProTypes"); 
		var pronum=document.getElementsByName("testNum")[0].value;
		var num=0; 
		for (var i=0;i<obj.length ;i++ )
		if (obj[i].checked )     num+=1;	    
		if (num>parseInt(pronum))
		{
		document.getElementById('warning').style.display="block";
		elm.checked=false;
		}
		else{
			document.getElementById('warning').style.display="none";
		}
	}
</script>
</html>