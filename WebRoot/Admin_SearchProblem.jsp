<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Admin_SearchProb</title>
<meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    
	<link rel="stylesheet" type="text/css" href="lib/bootstrap/css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="lib/bootstrap/css/bootstrap-responsive.css">
    <link rel="stylesheet" type="text/css" href="stylesheets/theme.css">
    <link rel="stylesheet" href="lib/font-awesome/css/font-awesome.css">
    
    <script src="lib/jquery-1.8.1.min.js" type="text/javascript"></script>
    <style type="text/css">
        #line-chart {
            height:300px;
            width:800px;
            margin: 0px auto;
            margin-top: 1em;
        }
        .brand { font-family: georgia, serif; }
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
     user="root"  password="admin"/>
     
     <sql:query dataSource="${snapshot}" var="result">
	SELECT * from proType;
	</sql:query>
<div class="navbar"></div>
<div class="container-fluid">
<div class="row-fluid">

<div class="span9">
<h1 class="page-title">试题查询</h1>
<div class="tab-pane active in" id="home">

<!-- 用户信息辨识表单，在浏览器中不显示 -->
<form id="tab" action="selectPro.action" method="post">
	<input name="adminId" value="${sessionScope.userId }" type="hidden">


<table class="table">
	<thead>
	<tr>
		<th>题目类型:</th>
		<th>关键字:</th>
	</tr>
	</thead>
	
	<tbody>
	<tr>
		<!--  <td><input class="input-xlarge" id="text0" name="proType" placeholder="" type="text"></td>-->
		<td>	
			 <select name="proType"  class="input-xlarge" onchange="choosetype(this)">
			 <!--  <option value="">/...请选择试题类型.../</option> -->
    		 <c:forEach var="row" items="${result.rows}">
  			 <option><c:out value="${row.proTypeName}"/></option>
			 </c:forEach>
   			</select>
 		</td>
		<td><input class="input-xlarge" name="proKey" placeholder="" id="text1" type="text"></td>
	</tr>
	<tr><!-- 点击该按钮后表单提交 -->
		  <td><button class="btn" type="submit"><i class="icon-search"></i> 搜索</button></td>
	</tr>
	</tbody>
</table>
</form>
</div>
</div>
<div class="well">
    <table class="table">
      <thead>
        <tr>
          <th style="text-align: center;">题目类型</th>
          <th style="text-align: center;">关键字</th>
		  <th style="text-align: center;">题目</th>
		  <th>配图</th>
		  <th style="text-align: center;">操作</th>
          <th style="width: 30px;"></th>
        </tr>
      </thead>
      
      <tbody>
      	<c:forEach items="${proList}" var="pro">
      	<tr>
      	<td style="text-align: center;"><c:out value="${pro.proType}" ></c:out></td>
      	<td style="text-align: center;"><c:out value="${pro.proKey}" ></c:out></td>
      	<td style="text-align: center;"><c:out value="${pro.proTitle}" ></c:out></td>
      	<td style="text-align: center;">
      	<a href="findProById.action?proId=${pro.proId}"><i class="icon-pencil"></i></a>
        <a href="delProById.action?proId=${pro.proId} " role="button" data-toggle="modal"><i class="icon-remove"></i></a>
      	</td>
      	</tr>
      	<tr>
      	<c:forTokens items="${pro.proPic}" delims="," var="image">
      	<td><image class="pro" src="${image}" width="400" height="300" ></image></td>
      	</c:forTokens>
      	</tr>
      	</c:forEach>
      	</tbody>
      </table>
</div>
</div>
</div>

<footer>
        <hr>
        <p class="pull-right">Javateam </p>
        <p>&copy;2020 </p>
    </footer>
    <script src="lib/bootstrap/js/bootstrap.js"></script>
  </body>
</html>