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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Admin_AddProType</title>
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


</head>
<body>
	<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
		url="jdbc:mysql://localhost:3306/0703?useUnicode=true&characterEncoding=utf-8"
		user="root" password="admin" />

	<sql:query dataSource="${snapshot}" var="result">
	SELECT * from proType where proTypeName not in ('未分类');
	</sql:query>
	<div class="navbar"></div>

			<div class="span8" style="margin-left:20px;clear:both;">
				<h1 class="page-title">添加题目类型</h1>
				<div class="tab-pane active in" id="home">

					<!-- 用户信息辨识表单，在浏览器中不显示 -->
					<form id="tab" method="post">
						<input name="adminId" value="${sessionScope.userId }"
							type="hidden">

						<table class="table">
							<thead>
								<tr>
									<th>题目类型名称:</th>
								</tr>
							</thead>

							<tbody>
								<tr>
									<td><input class="input-xlarge" id="text0"
										name="proTypeadd" placeholder="" type="text"></td>
								</tr>
								<tr>
									<!-- 点击该按钮后表单提交 -->
									<td><button class="btn" type="submit">
											<i class="icon-search"></i> 添加
										</button></td>
								</tr>
							</tbody>
						</table>
					</form>
				</div>
			</div>


			<div class="navbar"></div>


					<div class="span9" style="margin-left:20px;clear:both;">
						<h1 class="page-title">删除题目类型</h1>
						<div class="tab-pane active in" id="home">

							<!-- 用户信息辨识表单，在浏览器中不显示 -->
							<form id="tab" method="post">
								<input name="adminId" value="${sessionScope.userId }"
									type="hidden">

								<table class="table">
									<thead>
										<tr>
											<th>选择题目类型名称:</th>
										</tr>
									</thead>

									<tbody>
										<td><select name="proTypedel" class="input-xlarge"
											onchange="choosetype(this)">
												<!--  <option value="">/...请选择试题类型.../</option> -->
												<c:forEach var="row" items="${result.rows}">
													<option><c:out value="${row.proTypeName}" /></option>
												</c:forEach>
										</select></td>
										<tr>
											<!-- 点击该按钮后表单提交 -->
											<td><button class="btn" type="submit">
													<i class="icon-search"></i> 删除
												</button></td>
										</tr>
									</tbody>
								</table>
							</form>
						</div>
					</div>

<div>
						<span class="span10">${sucInfo1}${sucInfo2}</span>
					</div>


			<div class="span11" style="margin-left:20px;margin-bottom:10px;clear:both;"> 
			<span style="color:grey;padding-left:20px;padding-bottom:10px">&copy;2020&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&copy;Javateam
			</span>
			<!--  <span style="color:grey;padding-left:700px;padding-bottom:10px">&copy;QUT</span>	-->		
			</div>

			<script src="lib/bootstrap/js/bootstrap.js"></script>




			<%
				String url = "jdbc:mysql://localhost:3306/0703?useUnicode=true&characterEncoding=utf-8";
			String root = "root";
			String pass = "admin";
			Connection conn = null;
			try {
				//指定数据库驱动文件
				Class.forName("com.mysql.jdbc.Driver");
				conn = DriverManager.getConnection(url, root, pass);
			} catch (ClassNotFoundException cnfe) {
				out.print("找不到驱动器文件！");
			} catch (SQLException se) {
				out.print("数据库连接失败！");
			}
			%>
			<%
				String proTypeadd = request.getParameter("proTypeadd");
			String sqladd = "insert into proType values(?)";
			PreparedStatement pstadd = null;
			try {
				pstadd = conn.prepareStatement(sqladd);
				pstadd.setString(1, proTypeadd);
				pstadd.executeUpdate();	
			} catch (SQLException se) {
			}
			%>

			<%
				String proTypedel = request.getParameter("proTypedel");
			String sqldel = "delete from proType where proTypeName=?";
			PreparedStatement pstdel = null;
			try {
				pstdel = conn.prepareStatement(sqldel);
				pstdel.setString(1, proTypedel);
				pstdel.executeUpdate();
				
			} catch (SQLException se) {
			}
			%>
		
</body>
</html>