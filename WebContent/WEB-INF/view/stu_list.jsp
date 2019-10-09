<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>学生信息</title>
<link rel="stylesheet" href="<%=basePath %>bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="<%=basePath %>css/font-awesome.min.css">
<link rel="stylesheet" href="<%=basePath %>css/login.css">
<script src="<%=basePath %>jquery/jquery-2.1.1.min.js"></script>
<script src="<%=basePath %>bootstrap/js/bootstrap.min.js"></script>
<script src="<%=basePath %>layer/layer.js"></script>
<script type="text/javascript">
	function replacement(sid){
		location.href="<%=basePath%>student/replacement?sid="+sid;
		
	}
	function Replace(sid){
		location.href="<%=basePath%>student/Replace?sid="+sid;
	}
	function selectsname(){
		var sname=$("[name=name]").val();
		location.href="<%=basePath%>student/toStudentList?sname="+sname;
	}
</script>
</head>
<body>
<div class="row">
  <div class="col-xs-6 col-md-2"></div>
  <div class="col-xs-6 col-md-8">
  <center>
  	<h3><b><font style="color: purple">学生信息管理平台—宿舍管理</font></b></h3>
  	<div class="form-group"style="margin-right: 75%">
    <label for="exampleInputFile">学生名字:</label>
    <input type="text" class="form-control"  name="sname" placeholder="请输入姓名" style="width: 100px;display: inline;">
    <button class="btn  btn-info"  onclick="selectsname()">查询</button>
  </div>
  	
  <table class="table table-hover table-bordered ">
  	<tr>
  		<th>学生姓名</th>
  		<th>性别</th>
  		<th>学院名称</th>
  		<th>入学日期</th>
  		<th>当前宿舍</th>
  		<th>宿舍人数</th>
  		<th>操作</th>
  	</tr> 
  	<c:forEach items="${list }" var="l">
  		<tr>
  			<th>${l.sname}</th>
  			<th>${l.sex}</th>
  			<th>${l.college}</th>
  			<th>${l.sdate }</th>
  			<th>${l.did }</th>
  			<th>${l.sumpeople }</th>
  			<th><button class="btn  btn-xs btn-success" style="width: 60px" onclick="replacement(${l.sid})">更换宿舍</button>
  				<button class="btn  btn-xs btn-primary" style="width: 80px" onclick="Replace(${l.sid})">宿舍更换记录</button>
  			</th>
  		</tr>
  	</c:forEach>
	
</table>
</center>
  </div>
  <div class="col-xs-6 col-md-2"></div>
</div>
</body>
</html>