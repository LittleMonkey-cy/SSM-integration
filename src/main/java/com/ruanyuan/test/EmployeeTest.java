package com.ruanyuan.test;

import java.math.BigInteger;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.ruanyuan.pojo.Department;
import com.ruanyuan.pojo.Employee;
import com.ruanyuan.service.EmployeeService;


/**
 * 
 * 员工测试类
 * @author 陈钰
 *
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
public class EmployeeTest {
	@Autowired
	EmployeeService employeeService;
	@Test
	public void getAllEmployeeTest(){
		List<Employee> emps=employeeService.getAllEmployee();
		for (Employee employee : emps) {
			System.out.println(employee);
		}
	}
	@Test
	public void insertEmployeeTest(){
		Employee employee = new Employee();
		employee.setEname("张三");
		int row = employeeService.saveEmployee(employee);
		if (row > 0){
			System.out.println("添加成功");
		}else{
			System.out.println("添加失败");
		}
	}
	@Test
	public void updateEmployeeTest(){
		Employee employee = new Employee();
		employee.setEmpno(BigInteger.valueOf(1));
		employee.setEname("李四");
		Department department = new Department();
		department.setDeptno(BigInteger.valueOf(2));
		employee.setDepartment(department);
		int row = employeeService.updateEmployeeById(employee);
		if (row > 0){
			System.out.println("修改成功");
		}else{
			System.out.println("修改失败");
		}
	}
	@Test
	public void countEmployeeTest(){
		Employee employee = new Employee();
		String ename = "嘻哈";
		employee.setEname(ename);
		int checkEname = employeeService.checkEname(ename);
		if(checkEname==0){
			employeeService.saveEmployee(employee);
			System.out.println("添加成功");
		}else{
			System.out.println("用户名重复");
		}
	}

}
