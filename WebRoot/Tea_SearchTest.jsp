<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8">
    <title>Tea_SearchTest</title>
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
    <link rel="shortcut icon" href="../assets/ico/favicon.ico">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="../assets/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="../assets/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="../assets/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="../assets/ico/apple-touch-icon-57-precomposed.png">
  </head>
  <body> 
    <div class="navbar"> </div>
    <div class="container-fluid">
        <div class="row-fluid">
<div class="span9">
    <h1 class="page-title">面试记录查询</h1>
	<div class="tab-pane active in" id="home">
	<!--  
	<form id="tab">
	    <label>请选择命题单位：</label>
        <select name="Test" id="Test" class="input-xlarge">
          <option value="test1">马克思主义学院</option>
          <option value="test2">信息与控制工程学院</option>
          <option value="test3">理学院</option>
    </select>
 </form>
 	-->
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
        <td style="text-align: center;"><c:out value="${test.testId}"></c:out></td>
		<td style="text-align: center;"><c:out value="${test.testTime}"></c:out></td>
		<td style="text-align: center;"><c:out value="${test.testSum}"></c:out></td>
		<td style="text-align: center;"><c:out value="${test.eeName}"></c:out></td>
		<td style="text-align: center;"><c:out value="${test.eeNo}"></c:out></td>
		<td style="text-align: center;"><c:out value="${test.eeSex}"></c:out></td>
		<td style="text-align: center;">
          <a href="findTestById.action?testId=${test.testId}"><i class="icon-pencil"></i></a>
        </td>
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
        <p class="pull-right">Javateam </p>
        <p>&copy; 2020 </p>
    </footer>
    <script src="lib/bootstrap/js/bootstrap.js">
    </script>
  </body>
</html>
