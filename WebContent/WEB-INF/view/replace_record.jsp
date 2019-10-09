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
</script>
</head>
<body>
<div class="row">
  <div class="col-xs-6 col-md-2"></div>
  <div class="col-xs-6 col-md-8">
  <center>
  	<h3><b><font style="color: purple">宿舍更换记录</font></b></h3>
  	
  <table class="table table-hover table-bordered ">
  	<tr>
  		<th>宿舍编号</th>
  		<th>宿舍人数</th>
  		<th>进入日期</th>
  		<th>离开日期</th>
  	</tr> 
  	<c:forEach items="${list }" var="l">
  		<tr>
  			<th>${l.did}</th>
  			<th>${l.sumpeople}</th>
  			<th>${l.startdate}</th>
  			<th>
  				<c:if test="${l.stopdate==null}">至今</c:if>
  				<c:if test="${l.stopdate!=null}">${l.stopdate }</c:if>
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