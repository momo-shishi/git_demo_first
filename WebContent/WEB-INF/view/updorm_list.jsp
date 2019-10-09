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
<title>Insert title here</title>
<link rel="stylesheet" href="<%=basePath %>bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="<%=basePath %>css/font-awesome.min.css">
<link rel="stylesheet" href="<%=basePath %>css/login.css">
<script src="<%=basePath %>jquery/jquery-2.1.1.min.js"></script>
<script src="<%=basePath %>bootstrap/js/bootstrap.min.js"></script>
<script src="<%=basePath %>layer/layer.js"></script>
<script type="text/javascript">
	function dologin(){
		  $.post(
			"<%=basePath%>student/updorm",
			$("form").serialize(),
			function(b){
				if(b){
					layer.msg("更换成功", {time:5000, icon:2, shift:6}, function(){});
					location.href="<%=basePath%>student/toStudentList";
				}else{
					layer.msg("更换失败", {time:5000, icon:3, shift:6}, function(){});
				}
			},"json"
		) 
		
	}
</script>
</head>
<body>
<div class="container">
<center>

      <form class="form-signin" role="form">
      
        <h3 class="form-signin-heading"> 更换宿舍</h3>
		  <div class="form-group has-success has-feedback">
		  <label><h3><b style="">学生姓名:</b></h3></label>
		  	<input type="hidden" name="sid" value="${s.sid }"/>
			<input type="text"class="form-control" disabled="disabled" style="width: 50%;display: inline;" value="${s.sname}">
		  </div>
		  <div class="form-group has-success has-feedback">
		  <label><h3><b style="">性别:</b></h3></label>
			<input type="text" class="form-control"  disabled="disabled" style="margin-top:10px;width: 50%;display: inline;"value="${s.sex }" >

		  </div>
		  <div class="form-group has-success has-feedback">
		  <label><h3><b style="">所属学院:</b></h3></label>
			<input type="text" class="form-control" id="gcount" disabled="disabled" style="margin-top:10px;width: 50%;display: inline;"  value="${s.college }">
		  </div>
		  <div class="form-group has-success has-feedback">
		  <label><h3><b style="">当前宿舍:</b></h3></label>
			<input type="text" class="form-control" id="gcount" disabled="disabled" style="margin-top:10px;width: 50%;display: inline;"  value="${s.did }">
		  </div>
		  <div class="form-group has-success has-feedback">
		  <label><h3><b style="">更换宿舍:</b></h3></label>
				<select name="did" class="form-control"style="width: 30%;display: inline;">
				<c:forEach items="${dlist }" var="d">
					<c:if test="${d.did!=s.did }">
					<option value="${d.did }"> ${d.did }</option>
					</c:if>
					</c:forEach>
				</select>
		  </div>
        <a class="btn btn-lg btn-success btn-block" onclick="dologin()"style="width: 60%;display: inline;"  >更换</a>
      </form>
      </center>
    </div> 
</body>
</html>