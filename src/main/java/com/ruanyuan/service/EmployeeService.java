package com.ruanyuan.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ruanyuan.pojo.Department;
import com.ruanyuan.pojo.Employee;

public interface EmployeeService {
	/**
	 * 查询所有
	 * @return 员工集合
	 */
	List<Employee> getAllEmployee();
	/**
	 * 添加数据
	 * @param employee 员工集合
	 * @return 添加的记录
	 */
	int saveEmployee(Employee employee);
	/**
	 * 根据员工编号进行修改
	 * @param employee
	 * @return
	 */
	int updateEmployeeById(Employee employee);
	/**
	 * 检验用户名是否可用
	 * @param ename 用户名
	 * @return 布尔值
	 */
	int checkEname(String ename);
	/**
	 * 根据员工id查询员工信息
	 * @param id 员工编号
	 * @return 员工集合
	 */
	Employee getEmpById(Integer id);
	/**
	 * 根据员工编号删除员工信息
	 * @param id 员工编号
	 * @return 删除的条数
	 */
	void deleteEmpById(Integer id);
	/**
	 * 根据员工编号批量删除员工信息
	 * @param ids 编号集合
	 */
	void deleteBatch(List<Integer> ids);
	/**
	 * 多条件查询
	 * @param map1 
	 * @param string 
	 * @param empvo 
	 * @return 员工集合对象
	 */
	List<Employee> employeeAll( String ename, String job,
			 String startTime,  String endTime,Department department);
}
