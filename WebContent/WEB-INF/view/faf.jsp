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
<title>Insert title here</title>
<link rel="stylesheet" href="<%=basePath %>bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="<%=basePath %>css/font-awesome.min.css">
<link rel="stylesheet" href="<%=basePath %>css/login.css">
<script src="<%=basePath %>jquery/jquery-2.1.1.min.js"></script>
<script src="<%=basePath %>bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript">
	function shoping(gid){
		location.href='<%=basePath%>user/addProduct?gid='+gid;
	}
	function look(){
		location.href='<%=basePath%>user/lookProduct';
	}
</script>
</head>
<body>
<div class="row">
  <div class="col-xs-6 col-md-2"></div>
  <div class="col-xs-6 col-md-8">
  <table class="table table-hover table-bordered ">
  	<tr>
  		<th>商品编号</th>
  		<th>商品名称</th>
  		<th>商品价格</th>
  		<th>商品数量</th>
  		<th>操作<a onclick="look()" >【查看订单】</a></th>
  	</tr> 
  	<c:forEach items="${plist }" var="p">
  		<tr>
  			<th>${p.gid}</th>
  			<th>${p.gname}</th>
  			<th>${p.gprice}</th>
  			<th>${p.gcount}</th>
  			<th>
  			<c:if test="${p.gcount>0}">
  			<a onclick="shoping(${p.gid})" >购买</a>
  			</c:if>
  			<c:if test="${p.gcount==0}">
  			<font style="color: red">缺货</font>
  			</c:if>
  			</th>
  		</tr>
  	</c:forEach>
	
</table>
  </div>
  <div class="col-xs-6 col-md-2"></div>
</div>


</body>
</html>