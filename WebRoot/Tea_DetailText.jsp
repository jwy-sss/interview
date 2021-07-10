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
    <meta charset="utf-8">
    <title>试题详情</title>
    <meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <link rel="stylesheet" type="text/css" href="lib/bootstrap/css/bootstrap_0.css">
    <link rel="stylesheet" type="text/css" href="lib/bootstrap/css/bootstrap-responsive.css">
    <link rel="stylesheet" type="text/css" href="stylesheets/theme.css">
    <link rel="stylesheet" href="lib/font-awesome/css/font-awesome.css">

    <script src="lib/jquery-1.8.1.min.js" type="text/javascript"></script>

    <!-- Demo page code -->
    
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
    <link rel="shortcut icon" href="../assets/ico/favicon.ico">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="../assets/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="../assets/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="../assets/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="../assets/ico/apple-touch-icon-57-precomposed.png">
  </head>
  
  <body> 
  

  	<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
     url="jdbc:mysql://localhost:3306/0703?useUnicode=true&characterEncoding=utf-8"
     user="root"  password="admin"/>
     
     <sql:query dataSource="${snapshot}" var="result">
	SELECT * from testProRela;
	</sql:query>
  
           
  
    <div class="navbar"> </div>
    <div class="container-fluid">  
        <div class="row-fluid">
<div class="span9">
    <h1 class="page-title">试题详情</h1>
    
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
          <th style="width: 10%;"></th>
        </tr>
      </thead>
      <tbody>
        <tr>
        <td style="text-align: center;"><c:out value="${test.testId}"></c:out></td>
		<td style="text-align: center;"><c:out value="${test.testTime}"></c:out></td>
		<td style="text-align: center;"><c:out value="${test.testSum}"></c:out></td>
		<td style="text-align: center;"><c:out value="${test.eeName}"></c:out></td>
		<td style="text-align: center;"><c:out value="${test.eeNo}"></c:out></td>
		<td style="text-align: center;"><c:out value="${test.eeSex}"></c:out></td>
        </tr>
      </tbody>
    </table>
</div>
    
	<c:forEach items="${proList}" var="pro"> 
<div class="well">
    <table class="table">
      <thead>     
        <tr>
          <th style="width: 10%;">类别</th>
          <th style="width: 90%;">内容</th>
           </tr>
      </thead>
                    
      <tbody>
      	<tr>
      	<td style="width: 10%;">题目编号:</td>
      	<td style="width: 90%;"><c:out value="${pro.proId}"></c:out></td>
      	</tr>
      	
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
	     <td style="width: 10%;">得分:</td> 
	     <td style="width: 90%;">
      	<c:forEach var="row" items="${result.rows}">
      	<c:if test="${pro.proId == row.tpProid && test.testId == row.tpTestid}"><c:out value="${row.tpScore}"></c:out></c:if>
      	</c:forEach>
      	</td>
      	</tr>
      	      	
      	</tbody>     
            
     </table>
</div>

	</c:forEach>
        </div>
    </div>
    <footer>
        <hr>
        <p class="pull-right">© Javateam </p>
        <p>&copy; 2020</p>
    </footer>
    <script src="lib/bootstrap/js/bootstrap.js"></script>
		</div>
  </body>
</html>
