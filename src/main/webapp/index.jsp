<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>员工列表</title>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/static/js/jquery-3.6.0.min.js"></script>
<link
	href="${pageContext.request.contextPath}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="${pageContext.request.contextPath}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>
<body>
	<!-- 员工修改 -->
	<div class="modal fade" id="empUpdate" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">修改员工</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" id="empAdd_form">
						<div class="form-group">
							<label for="ename_update" class="col-sm-2 control-label">员工姓名</label>
							<div class="col-sm-10">
								<p class="form-control-static" id="ename_update"></p>
							</div>
						</div>
						<div class="form-group">
							<label for="job_update" class="col-sm-2 control-label">员工职位</label>
							<div class="col-sm-10">
								<select class="form-control" id="job_update" name="job">
									<option>经理</option>
									<option>员工</option>
									<option>人事</option>
									<option>部长</option>
									<option>职员</option>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label for="hiredate" class="col-sm-2 control-label">入职时间</label>
							<div class="col-sm-10">
								<input type="date" class="form-control" id="hiredate_update"
									name="hiredate" placeholder="员工入职时间">
							</div>
						</div>
						<div class="form-group">
							<label for="sal" class="col-sm-2 control-label">工资</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="sal_update"
									name="sal" placeholder="员工工资">
							</div>
						</div>
						<div class="form-group">
							<label for="comm" class="col-sm-2 control-label">奖金</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="comm_update"
									name="comm" placeholder="员工奖金">
							</div>
						</div>
						<div class="form-group">
							<label for="department" class="col-sm-2 control-label">部门</label>
							<!--提交部门id  -->
							<div class="col-sm-4">
								<select class="form-control" id="department_update"
									name="department.deptno">
								</select>
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
					<button type="button" class="btn btn-primary" id="emp_update">修改</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 员工添加 -->
	<div class="modal fade" id="empAdd" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">添加员工</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" id="empAdd_form">
						<div class="form-group">
							<label for="ename" class="col-sm-2 control-label">员工姓名</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="ename" name="ename"
									placeholder="员工姓名"> <span class="help-block"></span>
							</div>
						</div>
						<div class="form-group">
							<label for="job" class="col-sm-2 control-label">员工职位</label>
							<div class="col-sm-10">
								<select class="form-control" id="job" name="job">
									<option>经理</option>
									<option>员工</option>
									<option>人事</option>
									<option>部长</option>
									<option>职员</option>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label for="hiredate" class="col-sm-2 control-label">入职时间</label>
							<div class="col-sm-10">
								<input type="date" class="form-control" id="hiredate"
									name="hiredate" placeholder="员工入职时间">
							</div>
						</div>
						<div class="form-group">
							<label for="sal" class="col-sm-2 control-label">工资</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="sal" name="sal"
									placeholder="员工工资">
							</div>
						</div>
						<div class="form-group">
							<label for="comm" class="col-sm-2 control-label">奖金</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="comm" name="comm"
									placeholder="员工奖金">
							</div>
						</div>
						<div class="form-group">
							<label for="department" class="col-sm-2 control-label">部门</label>
							<!--提交部门id  -->
							<div class="col-sm-4">
								<select class="form-control" id="department"
									name="department.deptno">
								</select>
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
					<button type="button" class="btn btn-primary" id="emp_save">添加</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 搭建显示页面 -->
	<div class="container">
		<!-- 标题 -->
		<div class="row">
			<div class="col-md-12">
				<h1>SSM-CRUD</h1>
			</div>
			<!-- 多条件查询的表单 -->
			<form id="employeeAll_select">
				<div class="col-md-14">
					<div class="form-group">
						<div class="form-inline">
							<div class="form-group">
								<label for="slt_dept">部门</label> <select class="form-control "
									id="slt_dept" name="department.deptno"></select>
							</div>
							<div class="form-group">
								<label class="control-label hidden-xs" for="job_select">职位</label>
								<input type="text" class="form-control" id="job_select"
									name="job" placeholder="请输入职位" />
							</div>
							<div class="form-group">
								<label class="control-label hidden-xs" for="empName">姓名</label>
								<input type="text" class="form-control" id="empName"
									name="ename" placeholder="请输入姓名" />
							</div>
							<div class="form-group">
								<label class="control-label" for="dt_stime">入职时间</label> <input
									type="date" class="form-control" id="dt_stime" name="startTime" />
							</div>
							<div class="form-group">
								<label class="control-label hidden-xs" for="dt_etime"> —
								</label> <input type="date" class="form-control" id="dt_etime"
									name="endTime" />
							</div>
							<div class="form-group">
								<button type="button" class="btn btn-primary" id="btn_query">
									搜索</button>
								<button type="reset" class="btn btn-white">重置</button>
								<button type="button" class="btn btn-info">
									<span class="glyphicon glyphicon-download"></span>
								</button>
							</div>
						</div>
					</div>
				</div>
			</form>
		</div>
		<!-- 按钮 -->
		<div class="row">
			<div class="col-md-12 col-md-offset-8">
				<button type="button" class="btn btn-primary" id="emp_add">添加</button>
				<button type="button" class="btn btn-danger" id="delete_all_emp">批量删除</button>
				<button type="button" class="btn btn-danger" id="select_all_emp">显示所有</button>
			</div>
		</div>
		<!-- 表格数据 -->
		<div class="row">
			<div class="col-md-12">
				<table class="table table-hover" id="emps_tables">
					<thead>
						<tr>
							<th><input type="checkbox" id="check_all" /></th>
							<th>ID</th>
							<th>姓名</th>
							<th>职位</th>
							<th>入职日期</th>
							<th>工资</th>
							<th>奖金</th>
							<th>部门</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>

					</tbody>
				</table>
			</div>
		</div>
		<!-- 分页信息 -->
		<div class="row">
			<!-- 分页文字信息 -->
			<div class="col-md-6" id="page_info_workspace"></div>
			<!-- 分页条信息 -->
			<div class="col-md-6" id="page_nav_workspace"></div>
		</div>
	</div>


</body>
<script type="text/javascript">
	// 定义一个总记录数,当前页
	var totalPage, currentPage;
	// 页面加载完成后直接发送ajax数据，获取到分页数据
	$(function() {
		// 当页面加载完成后直接跳转到首页
		to_page(1);
		getDepts("#slt_dept");
	});
	// 跳转页面的函数方法
	function to_page(pageno) {
		$.ajax({
			url : "${pageContext.request.contextPath}/emps",
			data : "pageno=" + pageno,
			type : "GET",
			success : function(result) {
				console.log(result);
				// 1.解析并显示员工数据
				empsTable(result);
				// 2.显示分页信息
				page_info(result);
				// 3.显示分页条数据
				pageNav(result);

			}
		});
	}
	function empsTable(result) {
		// 每次调用之前先进行数据清空
		$("#emps_tables tbody").empty();
		const emps = result.extend.pageInfo.list;
		$
				.each(
						emps,
						function(index, item) {
							const checkBox = $("<td><input type='checkbox' class='check_item'></input></td>")
							var empno = $("<td></td>").append(item.empno);
							const ename = $("<td></td>").append(item.ename);
							const job = $("<td></td>").append(item.job);
							const hiredate = $("<td></td>").append(
									item.hiredate);
							const sal = $("<td></td>").append(item.sal);
							const comm = $("<td></td>").append(
									item.comm == null ? 0 : item.comm);
							const dname = $("<td></td>").append(
									item.department.dname);
							// 增加按钮
							const editBtn = $("<button></button>")
									.addClass(
											"btn btn-primary btn-sm update_btn")
									.append(
											$("<span></span>")
													.addClass(
															"glyphicon glyphicon-pencil"))
									.append("编辑");
							// 为编辑按钮添加自定义属性，表示当前员工的id
							editBtn.attr("edit_id", item.empno);
							const delBtn = $("<button></button>").addClass(
									"btn btn-danger btn-sm delete_btn").append(
									$("<span></span>").addClass(
											"glyphicon glyphicon-trash"))
									.append("删除");
							// 为删除按钮添加自定义属性表示当前要删除的员工id
							delBtn.attr("del_id", item.empno)
							// 将按钮放在一个单元格中
							var btn = $("<td></td>").append(editBtn)
									.append(" ").append(delBtn);
							// 向行中增加数据
							$("<tr></tr>").append(checkBox).append(empno)
									.append(ename).append(job).append(hiredate)
									.append(sal).append(comm).append(dname)
									.append(btn).appendTo("#emps_tables tbody")
						});
	}
	// 显示分页信息
	function page_info(result) {
		// 调用之前先清空数据
		$("#page_info_workspace").empty();
		$("#page_info_workspace").append(
				"当前" + result.extend.pageInfo.pageNum + "页,总"
						+ result.extend.pageInfo.pages + "页,总"
						+ result.extend.pageInfo.total + "条记录")
		// 给之前定义的全局变量的总记录数进行赋值
		totalPage = result.extend.pageInfo.total
		// 给之前定义的全局变量的当前页数进行赋值
		currentPage = result.extend.pageInfo.pageNum;
	}
	// 显示分页条
	function pageNav(result) {
		// 调用之前先清空数据
		$("#page_nav_workspace").empty();
		const ul = $("<ul></ul>").addClass("pagination");
		const firstPage = $("<li></li>").append(
				$("<a></a>").append("首页").attr("href", "#"));

		const prePage = $("<li></li>").append($("<a></a>").append("&laquo;"));
		if (result.extend.pageInfo.hasPreviousPage == false) {
			firstPage.addClass("disabled");
			prePage.addClass("disabled");
		} else {
			// 添加点击翻页事件
			firstPage.click(function() {
				// 跳转到首页
				to_page(1);
			});
			prePage.click(function() {
				// 当前页-1为上一页
				to_page(result.extend.pageInfo.pageNum - 1);
			});
		}
		const nextPage = $("<li></li>").append($("<a></a>").append("&raquo;"));
		const lastPage = $("<li></li>").append(
				$("<a></a>").append("尾页").attr("href", "#"));
		if (result.extend.pageInfo.hasNextPage == false) {
			nextPage.addClass("disabled");
			lastPage.addClass("disabled");
		} else {
			nextPage.click(function() {
				// 当前页+1为下一页
				to_page(result.extend.pageInfo.pageNum + 1);
			});
			lastPage.click(function() {
				// 最后一页为末页总页数
				to_page(result.extend.pageInfo.pages);
			});
		}
		// 将首页和上一页添加到ul列表中
		ul.append(firstPage).append(prePage)
		// 遍历返回结果中的导航页数,给ul中添加页数
		$.each(result.extend.pageInfo.navigatepageNums, function(index, item) {
			// 创建页数的列表
			const num = $("<li></li>").append($("<a></a>").append(item));
			// 判断当前页是否和遍历的页面相等，如果相等则进行高亮显示
			if (result.extend.pageInfo.pageNum == item) {
				num.addClass("active");
			}
			// 当点击页面时进行跳转操作，item：当前点击的页面
			num.click(function() {
				to_page(item);
			})
			// 将页码数添加到ul中
			ul.append(num);
		});
		// 遍历完之后添加下一页和尾页
		ul.append(nextPage).append(lastPage);
		// 把url加入到nav中
		const nav = $("<nav></nav>").append(ul);
		nav.appendTo("#page_nav_workspace");
	}
	// 表单重置的方法函数(清空表单内容及样式)
	function reset_form(element) {
		// 清空表单数据
		$(element)[0].reset();
		// 清空表单样式
		$(element).find("*").removeClass("has-error has-success");
		$(element).find(".help-block").text("");
	}
	// 点击添加按钮时调用方法
	$("#emp_add").click(function() {
		// 清除表单数据（表单重置）
		reset_form("#empAdd form");
		// 发送ajax请求，查询部门信息，显示在下拉列表框中
		getDepts("#department");
		$("#empAdd").modal({
			backdrop : "static"
		})
	});
	// 查询所有部门信息
	function getDepts(element) {
		// 每次弹窗弹出的时候先清空所有的部门信息
		$(element).empty();
		$.ajax({
			url : "${pageContext.request.contextPath}/depts",
			type : "GET",
			success : function(result) {
				// 循环遍历取得数据
				$.each(result.extend.depts, function() {
					const option = $("<option></option>").append(this.dname)
							.attr("value", this.deptno);
					// 将返回的数据添加到页面中
					option.appendTo(element);
				});
			}
		})
	}
	// 校验表单数据的方法
	function validate_add() {
		// 获取到要校验的数据
		const ename = $("#ename").val();
		const regName = /(^[a-zA-Z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,5})/;
		if (!regName.test(ename)) {
			// 调用检验提示信息的函数方法
			show_vialidate_msg("#ename", "error",
					"用户名不合法!!用户名是2-5位中文或6-16位英文和数字的组合")
			return false;
		} else {
			show_vialidate_msg("#ename", "success", "")
		}
		;
		return true;
	}
	// 定义一个校验数据的提醒信息的函数，显示校验结果的提示信息
	function show_vialidate_msg(element, status, msg) {
		// 清除当前元素的校验状态
		$(element).parent().removeClass("has-success has-error");
		$(element).next("span").text("");
		// 进行校验判断
		if ("success" == status) {
			$(element).parent().addClass("has-success");
			$(element).next("span").text(msg);
		} else if ("error" == status) {
			$(element).parent().addClass("has-error");
			$(element).next("span").text(msg)
		}
	}
	// 校验用户名是否可用
	$("#ename").change(
			function() {
				const ename = this.value;
				$.ajax({
					url : "${pageContext.request.contextPath}/checkEname",
					data : "ename=" + ename,
					type : "POST",
					success : function(result) {
						if (result.code == 200) {
							show_vialidate_msg("#ename", "success", "用户名可用");
							$("#emp_save").attr("ajax-va", "success")
						} else {
							show_vialidate_msg("#ename", "error",
									result.extend.va_msg);
							$("#emp_save").attr("ajax-va", "error");
						}
					}
				})
			})
	// 点击保存数据保存员工
	$("#emp_save").click(
			function() {
				// 填写的数据返回给服务器端进行保存
				// 对提交给数据库的数据进行验证
				if (!validate_add()) {
					return false;
				}
				// 判断上边的ajax校验是否成功
				if ($(this).attr("ajax-va") == "error") {
					return false;
				}
				// 发送ajax请求保存员工
				$.ajax({
					url : "${pageContext.request.contextPath}/emp",
					type : "POST",
					// 将表格中的内容序列化
					data : $("#empAdd form").serialize(),
					success : function(result) {
						// 对返回结果进行判断
						if (result.code == 200) {
							// 数据保存成功
							// 关闭弹窗组件
							$("#empAdd").modal('hide');
							// 跳转到最后一页，显示刚刚添加成功的数据
							// 调用定义的页面跳转函数即可
							to_page(totalPage);
						} else {
							// 显示字段错误信息
							if (undefined != result.extend.errorFields.ename) {
								// 显示员工名字的错误信息
								show_vialidate_msg("#ename", "error",
										result.extend.errorFields.ename);
							}
						}
					}
				})
			});
	// 绑定按钮时，利用普通的click会绑定不上，原因是我们在创建按钮之前就绑定了click
	// 解决办法：我们可以在创建按钮的时候进行绑定；绑定点击on（新版jquery的方法）
	// 绑定更新按钮
	$(document).on("click", ".update_btn", function() {
		// 查询并填充部门列表
		getDepts("#department_update");
		// 查询并显示员工信息
		getEmps($(this).attr("edit_id"));
		// 把员工的id传递给弹出框的更新按钮
		$("#emp_update").attr("edit_id", $(this).attr("edit_id"));
		$("#empUpdate").modal({
			backdrop : "static"
		})
	});
	// 查询所有的员工信息
	function getEmps(id) {
		$.ajax({
			url : "${pageContext.request.contextPath}/emp/" + id,
			type : "GET",
			success : function(result) {
				const empDate = result.extend.emp;
				$("#ename_update").text(empDate.ename);
				$("#hiredate_update").val(empDate.hiredate);
				$("#sal_update").val(empDate.sal);
				// 判断奖金是否为0
				if (empDate.comm == null) {
					$("#comm_update").val(0);
				} else {
					$("#comm_update").val(empDate.comm);
				}
				// 下拉列表框赋值时
				$("#job_update").val([ empDate.job ]);
				$("#department_update").val([ empDate.deptno ]);
			}
		});
	}
	// 点击修改按钮，进行员工修改
	$("#emp_update").click(
			function() {
				// 发送ajax数据将请求信息保存到更新的员工数据当中
				$.ajax({
					url : "${pageContext.request.contextPath}/emp/"
							+ $(this).attr("edit_id"),
					type : "PUT",
					// 表单序列化当中的参数没有method要手动添加
					// ajax put方式引发的血案，当type为post时需要写下面的代码，并要在web.xml文件中进行配置
					// data:$("#empUpdate form").serialize()+"&_method=PUT",
					data : $("#empUpdate form").serialize(),
					success : function(result) {
						// 关闭弹窗
						$("#empUpdate").modal("hide");
						// 调回到修改的页面
						to_page(currentPage);
					}
				});
			})
	// 绑定按钮时，利用普通的click会绑定不上，原因是我们在创建按钮之前就绑定了click
	// 解决办法：我们可以在创建按钮的时候进行绑定；绑定点击on（新版jquery的方法）
	// 绑定删除按钮（单个删除）
	$(document).on("click", ".delete_btn", function() {
		// 弹出是否确认删除的弹框
		// 找到所有祖先节点中的tr元素，然后在继续向下找第二个td，获取到它的文本值即员工姓名
		const ename = $(this).parents("tr").find("td:eq(2)").text();
		// 定义要删除的员工ID
		const empno = $(this).attr("del_id");
		if (confirm("确认删除[" + ename + "]吗？")) {
			// 当点击确认时进行删除操作
			$.ajax({
				url : "${pageContext.request.contextPath}/emp/" + empno,
				type : "DELETE",
				success : function() {
					// 删除后跳转到当前页面
					to_page(currentPage);
					alert("删除成功");
				}
			})
		}
	});
	// 全选，全不选
	$("#check_all").click(function() {
		// attr 获取checked属性时返回值时未定义
		// 当我们获取原生的dom属性时要用prop
		// attr获取自定义属性的值
		$(".check_item").prop("checked", $(this).prop("checked"));
	});
	// 当小的单选框被选中时，上边的总的选框也被选中
	$(document)
			.on(
					"click",
					".check_item",
					function() {
						// 判断当前选中的元素个数和页面中的元素个数是否一致
						const flag = $(".check_item:checked").length == $(".check_item").length;
						$("#check_all").prop("checked", flag);
					});
	// 当点击批量删除按钮时进行提示
	$("#delete_all_emp").click(
			function() {
				// 遍历选中的要删除的员工信息，获取到要删除的员工姓名
				var enames = "";
				var del_idstr = "";
				$.each($(".check_item:checked"), function() {
					enames += $(this).parents("tr").find("td:eq(2)").text()
							+ ",";
					// 组装员工id字符串
					del_idstr += $(this).parents("tr").find("td:eq(1)").text
							+ "-";
				});
				// 去除多余的‘,’
				enames = enames.substring(0, enames.length - 1);
				if (!enames.length > 0) {
					alert("请选中要删除的用户信息！！！")
				} else if (confirm("确认删除【" + enames + "】吗？")) {
					var ids = "";
					var n = 0;
					for (var i = 0; i < $(".check_item").length.length; i++) {
						if ($(".check_item")[i].checked == true) {
							var id = $(".check_item")[i].val();
							if (n == 0) {
								ids += "ids=" + id;
							} else {
								ids += "&ids=" + id;
							}
							n++;
						}
					}
					// 发送ajax请求
					$.get("${pageContext.request.contextPath}/deleteByIds",
							ids, function(result) {
								if (result.code == 200) {
									alert("删除成功");
									// 删除之后跳转到当前页面
									to_page(currentPage);
								} else {
									alert("请选中")
								}
							});
					return true;
				} else {
					// 不删除
					return false;
				}
			});

	/* 多条件查询 */
	$("#btn_query").click(function() {
		// 序列化表格内容为字符串  
		var formParam = $("#employeeAll_select").serialize();
		$.ajax({
			url : "${pageContext.request.contextPath}/employeeAll",
			type : "POST",
			data : formParam,
			success : function(result) {
				if (result.code == 200) {
					// 数据查询成功
					console.log(result);
					// 1.解析并显示员工数据
					empsTable(result);
					// 2.显示分页信息
					page_info(result);
					// 3.显示分页条数据
					pageNav(result)
				}
			}
		});
	})
	// 点击显示全部进行页面加载
	$("#select_all_emp").click(function() {
		to_page(1);
	})
</script>
</html>