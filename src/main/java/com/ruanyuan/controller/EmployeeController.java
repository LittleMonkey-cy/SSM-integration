package com.ruanyuan.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ruanyuan.pojo.Department;
import com.ruanyuan.pojo.Employee;
import com.ruanyuan.pojo.Msg;
import com.ruanyuan.service.EmployeeService;

import jakarta.validation.Valid;

@Controller
public class EmployeeController {
	@Autowired
	EmployeeService employeeService;

	/**
	 * 检查用户名是否可用
	 * 
	 * @param ename
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/checkEname")
	public Msg checkEname(@RequestParam("ename") String ename) {
		// 先判断用户名是否合法
		String regex = "(^[a-zA-Z0-9_-]{6,16}$)|(^[\\u2E80-\\u9FFF]{2,5})";
		if (!ename.matches(regex)) {
			return Msg.fail().add("va_msg", "用户名必须是6-16位数字和字母的组合或者2-5位中文");
		}
		// 用户名查重
		int b = employeeService.checkEname(ename);
		if (b == 0) {
			return Msg.success();
		} else {
			return Msg.fail().add("va_msg", "用户名重复不可用");
		}
	}

	/**
	 * 根据员工id查询员工信息
	 * 
	 * @return 消息
	 */
	@RequestMapping(value = "/emp/{id}", method = RequestMethod.GET)
	@ResponseBody
	public Msg getEmpById(@PathVariable("id") Integer id) {
		Employee empById = employeeService.getEmpById(id);
		return Msg.success().add("emp", empById);
	}

	/**
	 * 保存用户信息
	 * 
	 * @param employee
	 * @return
	 */
	@RequestMapping(value = "/emp", method = RequestMethod.POST)
	@ResponseBody
	public Msg saveEmp(@Valid Employee employee, BindingResult result) {
		if (result.hasErrors()) {
			// 如果校验失败，则返回失败，在弹出的框中显示校验失败的信息
			// 定义一个map集合，将错误信息放到map集合中
			Map<String, Object> map = new HashMap<>();
			// 获取所有字段校验的错误信息
			List<FieldError> fieldErrors = result.getFieldErrors();
			// 循环遍历错误信息
			for (FieldError fieldError : fieldErrors) {
				System.out.println("错误的字段名" + fieldError.getField());
				System.out.println("错误信息" + fieldError.getDefaultMessage());
				// 将所有的错误信息放到map集合中
				map.put(fieldError.getField(), fieldError.getDefaultMessage());
			}
			// 将错误信息返回个浏览器界面
			return Msg.fail().add("errorFields", map);
		} else {
			employeeService.saveEmployee(employee);
			return Msg.success();
		}
	}

	/**
	 * 查询员工数据（分页查询）
	 * 
	 * @return
	 */
	@RequestMapping("/emps")
	@ResponseBody
	public Msg getEmpsWithJson(@RequestParam(value = "pageno", defaultValue = "1") Integer pageno, Model model) {
		// 利用分页插件PageHelper
		PageHelper.startPage(pageno, 5);
		List<Employee> emps = employeeService.getAllEmployee();
		PageInfo page = new PageInfo(emps, 5);
		return Msg.success().add("pageInfo", page);
	}

	/**
	 * 修改员工信息
	 * 
	 * @param employee 员工对象信息
	 * @return 自定义消息
	 */
	@RequestMapping(value = "/emp/{empno}", method = RequestMethod.PUT)
	@ResponseBody
	public Msg updateEmployee(Employee employee) {
		int updateEmployeeById = employeeService.updateEmployeeById(employee);
		if (updateEmployeeById > 0) {
			return Msg.success();
		} else {
			return Msg.fail();
		}
	}

	/**
	 * 批量删除
	 * 
	 * @param ids
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/deleteByIds")
	public Msg deleteEmpByIds(List<Integer> ids) {
		employeeService.deleteBatch(ids);
		return Msg.success();
	}

	/**
	 * 单个删除
	 */
	@ResponseBody
	@RequestMapping(value = "/emp/{id}", method = RequestMethod.DELETE)
	public Msg deleteEmpById(@PathVariable("id") Integer id) {
		employeeService.deleteEmpById(id);
		return Msg.success();
	}

	/**
	 * 多条件查询
	 */
	@RequestMapping("/employeeAll")
	@ResponseBody
	public Msg employeeAll(@RequestParam(value = "pageno", defaultValue = "1") Integer pageno, Model model,
			String ename, String job, String startTime, String endTime, Department department) {
		PageHelper.startPage(pageno, 5);
		List<Employee> employeeAll = employeeService.employeeAll(ename, job, startTime, endTime, department);
		for (Employee employee : employeeAll) {
			System.out.println("员工信息===" + employee);
		}
		PageInfo page = new PageInfo(employeeAll, 5);
		if (page != null) {
			return Msg.success().add("pageInfo", page);
		} else {
			return Msg.fail();
		}

	}
}
