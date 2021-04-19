<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加员工</title>

<link href="${pageContext.request.contextPath}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/static/css/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">
 <script src="${pageContext.request.contextPath}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
 <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-3.6.0.min.js"></script>
 <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/bootstrap-datetimepicker.js"></script>
 <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/bootstrap-datetimepicker.fr.js"></script>
</head>
<body>
	<form>
		<div class="form-group">
			<label for="exampleInputText1">姓名</label> <input type="text"
				class="form-control" id="exampleInputText1" placeholder="姓名">
		</div>
		<div class="form-group">
			<label for="check1">职位</label>
			 <select
				class="form-control" id=check1>
				<option>销售员</option>
				<option>经理</option>
				<option>人事</option>
				<option>4</option>
				<option>5</option>
			</select>
		</div>
		<div  class="form-group">
			<label for="exampleInputText3">入职时间</label> 
			<input type="datetime"
				class="form-control" id="exampleInputText3" placeholder="入职时间">
		</div>
		<div class="form-group">
			<label for="exampleInputText4">工资</label> <input type="text"
				class="form-control" id="exampleInputText4" placeholder="工资">
		</div>
		<div class="form-group">
			<label for="exampleInputText2">奖金</label> <input type="text"
				class="form-control" id="exampleInputText2" placeholder="奖金">
		</div>
			<div class="form-group">
			<label for="check2">部门</label>
			 <select
				class="form-control" id=check2>
				<option>教研部</option>
				<option>后勤部</option>
				<option>3</option>
				<option>4</option>
				<option>5</option>
			</select>
		</div>
		<button type="submit" class="btn btn-default">立即提交</button>
	</form>
</body>
</html>