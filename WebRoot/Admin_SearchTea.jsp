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
    <title>查询面试官</title>
    <meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <link rel="stylesheet" type="text/css" href="lib/bootstrap/css/bootstrap.css">
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
    <div class="navbar"> </div>
    <div class="container-fluid">
        <div class="row-fluid">
<div class="span9">
    <h1 class="page-title">面试官查询</h1>
  </div>
</div>
<div class="well">
    <table class="table">
      <thead>
        <tr>
          <th style="text-align: center;">面试官编号</th>
          <th style="text-align: center;">面试官姓名</th>
          <th style="text-align: center;">面试官账号</th>
		  <th style="text-align: center;">操作</th>
          <th style="width: 26px;"></th>
        </tr>
      </thead>
      <tbody>
          <c:forEach items="${teaList}" var="tea">
		  <tr>
					<td style="text-align: center;"><c:out value="${tea.teaId}"></c:out></td>
					<td style="text-align: center;"><c:out value="${tea.teaName}"></c:out></td>
					<td style="text-align: center;"><c:out value="${tea.teaNo}"></c:out></td>
		            <td style="text-align: center;">
		              <a href="findTeaById.action?teaId=${tea.teaId}"><i class="icon-pencil"></i></a>
		              <a href="delTeaById.action?teaId=${tea.teaId}" role="button" data-toggle="modal"><i class="icon-remove"></i></a>
		            </td>
		  </tr>
		  </c:forEach>
      </tbody>
    </table>
</div>


</div>
    <footer>
        <hr>
        <p class="pull-right">© Javateam </p>
        <p>&copy; 2020 </p>
    </footer>
    <script src="lib/bootstrap/js/bootstrap.js"></script>
	</body>
</html>