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
<title>Edit_problem</title>

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
<div class="navbar"> </div>
    <div class="container-fluid">  
        <div class="row-fluid">
<div class="span9">
<form id="table0" action="updPro.action" method="post">
	<div class="well" id="tb2">
	
	
	<!-- 默认题目编号无法被修改 -->
	<label>题目编号:</label>
    <input type="text" name="proId" value="${pro.proId}" class="input-xlarge" readonly>
	<label>题目类型:</label>
	<!--  <input class="input-xlarge" name="proType" value="${pro.proType}"  id="text0" type="text">
	-->	
	<td>	
		<select name="proType"  class="input-xlarge" onchange="choosetype(this)">
		<!--  <option value="">/...请选择试题类型.../</option> -->
    	<c:forEach var="row" items="${result.rows}">
  		<option><c:out value="${row.proTypeName}"/></option>
		</c:forEach>
   		<select>
 	</td>								   
	<label>关键字:</label>
	<input class="input-xlarge" name="proKey" value="${pro.proKey}"  id="text1" type="text">
	<label>题干:</label>
	<input class="input-xlarge" name="proTitle" value="${pro.proTitle}" id="text2" type="text">
	<label>配图:</label>
	<input class="input-xlarge" name="proPic" value="${pro.proPic}" id="text3" type="text">
	</div>
	
	<button type="submit" class="btn btn-primary"><i class="icon-save"></i>保存</button>
	
  <div class="btn-group">
  </div>
  </form>
</div>
	</div>
        </div>
   <div>
    <footer>
        <hr>
        <p class="pull-right">Javateam</p>
        <p>&copy; 2020</p>
    </footer>
    <script src="lib/bootstrap/js/bootstrap.js"></script>
		</div>
  </body>
</html>