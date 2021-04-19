package com.ruanyuan.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ruanyuan.pojo.Department;
import com.ruanyuan.pojo.Msg;
import com.ruanyuan.service.DepartmentService;
/**
 *部门的控制器类
 * @author 陈钰
 *
 */
@Controller
public class DepartmentController {
	@Autowired
	private DepartmentService departmentService;
	@RequestMapping("/depts")
	@ResponseBody
	public Msg getDepts() {
		// 查询所有的部门信息
		List<Department> list = departmentService.getDepts();
		return Msg.success().add("depts", list);
	}
}
