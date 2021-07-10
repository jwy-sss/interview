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
<title>打分界面</title>
<meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    
	<link rel="stylesheet" type="text/css" href="lib/bootstrap/css/bootstrap_0.css">
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
<h1 class="page-title">面试题目评分</h1>
<div class="tab-pane active in" id="home"></div>
 <form  action="insertTestPro.action" method="post">
 <tbody>
      	<c:forEach items="${finalproList}" var="pro">
<div class="well">

 
 <input type="hidden" value="${testId}" name="testId">
    <table class="table">
    <thead>
        <tr>
          <th style="width: 10%;">类别</th>
          <th style="width: 90%;">内容</th>
           </tr>
      </thead>
                    
     

      	<tr>
      	<td style="width: 10%;">题目类型:</td>
      	<td style="width: 90%;"><c:out value="${pro.proType}" ></c:out></td>
      	</tr>
      	
      	<tr>
      	<td style="width: 10%;">关键字:</td>
      	<td style="width: 90%;"><c:out value="${pro.proKey}" ></c:out></td>
      	</tr>
      	
      	<tr>
      	<td style="width: 10%;">题目:</td>
      	<td style="width: 90%;"><c:out value="${pro.proTitle}" ></c:out></td>
      	</tr>
      	        	
      	<tr>
      	<td style="width: 10%;">配图:</td>
      	<td style="width: 90%;">
      	<c:forTokens items="${pro.proPic}" delims="," var="image">
      	<image class="pro" src="${image}" width="40%" height="500px" ></image>
      	</c:forTokens>
      	</td>
      	</tr>
      	      	
	    <tr>
	     <td style="width: 10%;">打分:</td> 
	     <td style="width: 90%;">
      	<input type="text" name="score" />
      	<input type="hidden" name="proId" value="${pro.proId}">
      	</td>
      	</tr>
		  
    	
      	
      </table>
      
</div>
      	</c:forEach>
      	<tr><!-- 点击该按钮后表单提交 -->
		  <td><button class="btn" type="submit"><i class="icon-plus"></i>提交分数</button></td>
		</tr>
      	</tbody>
      	</form>
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