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

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<title>Tea_SearchTest</title>
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

<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet"
	href="bootstrap-datepicker-master/dist/css/bootstrap-datepicker3.min.css">
<script src="lib/jquery-1.8.1.min.js" type="text/javascript"></script>
<script src="js/bootstrap.min.js"></script>
<script src="bootstrap-datepicker-master/js/bootstrap-datepicker.js"></script>
<script
	src="bootstrap-datepicker-master/js/locales/bootstrap-datepicker.zh-CN.js"></script>

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
			SELECT * from interviewer;
		</sql:query>
	<div class="navbar"></div>
	<div class="container-fluid">
		<div class="row-fluid">
			<div class="span9">
				<h1 class="page-title">面试记录查询</h1>
				<div class="tab-pane active in" id="home">
					<form id="tab" action="selectTest.action" method="post">
						<input name="adminId" value="${sessionScope.userId }"
							type="hidden">


						<table class="table">
							<thead>
								<tr>
									<th>面试官:</th>
									<th>时间:</th>
								</tr>
							</thead>

							<tbody>
								<tr>
									<td><select name="teaId" class="input-xlarge"
										onchange="choosetype(this)">
											<!--  <option value="">/...请选择试题类型.../</option> -->
											<c:forEach var="row" items="${result.rows}">
												<option><c:out value="${row.erId}" /></option>
											</c:forEach>
									</select></td>
									<!-- <td><input class="input-xlarge" name="testTime" placeholder="" id="text1" type="text"></td> -->
									<td><input name="time" type="text" readonly
										id="datepicker" placeholder="选择时间"></td>
								</tr>
								<tr>
									<!-- 点击该按钮后表单提交 -->
									<td><button class="btn" type="submit">
											<i class="icon-search"></i> 搜索
										</button></td>
								</tr>
							</tbody>
						</table>
					</form>
				</div>
				<div class="well">
					<table class="table">
						<thead>
							<tr>
								<th style="text-align: center;">面试编号</th>
								<th style="text-align: center;">面试时间</th>
								<th style="text-align: center;">面试总分</th>
								<th style="text-align: center;">考生姓名</th>
								<th style="text-align: center;">考生身份证号</th>
								<th style="text-align: center;">考生性别</th>
								<th style="text-align: center;">题目列表</th>
								<th style="width: 26px;"></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${testList}" var="test">
								<tr>
									<td style="text-align: center;"><c:out
											value="${test.testId}"></c:out></td>
									<td style="text-align: center;"><c:out
											value="${test.testTime}"></c:out></td>
									<td style="text-align: center;"><c:out
											value="${test.testSum}"></c:out></td>
									<td style="text-align: center;"><c:out
											value="${test.eeName}"></c:out></td>
									<td style="text-align: center;"><c:out
											value="${test.eeNo}"></c:out></td>
									<td style="text-align: center;"><c:out
											value="${test.eeSex}"></c:out></td>
									<td style="text-align: center;"><a
										href="findTestById.action?testId=${test.testId}"><i
											class="icon-pencil"></i></a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				
			</div>

		</div>
	</div>
	<footer>
	<hr>
	<p class="pull-right">Javateam</p>
	<p>&copy; 2020</p>
	</footer>
	<script src="lib/bootstrap/js/bootstrap.js">
		function exporExcel() {
			var obj = document.getElementById("contrller"); //定位id
			var index = obj.selectedIndex; // 选中索引
			//var text = obj.options[index].text; // 选中文本
			var contrller = obj.options[index].value; // 选中值
			var startdate = document.getElementById("start").value;
			var startend = document.getElementById("end").value;

			window.location.href = "/javawebservlet/ExportExcelServlet?startdate="
					+ startdate
					+ "&"
					+ "startend="
					+ startend
					+ "&"
					+ "contrller=" + contrller;
		}
	</script>
</body>

<script type="text/javascript">
	$('#datepicker').datepicker({
		language : 'zh-CN', //语言
		autoclose : true, //选择后自动关闭
		clearBtn : true,//清除按钮
		format : "yyyy-mm-dd"//日期格式
	});
</script>

</html>
