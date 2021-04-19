package com.ruanyuan.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ruanyuan.dao.EmployeeDao;
import com.ruanyuan.pojo.Department;
import com.ruanyuan.pojo.Employee;
import com.ruanyuan.service.EmployeeService;

/**
 * 员工业务逻辑层实现类
 * 
 * @author 陈钰
 *
 */
@Service
public class EmployeeServiceImpl implements EmployeeService {
	@Autowired
	EmployeeDao employeeDao;

	/**
	 * 查询所有员工
	 */
	@Override
	public List<Employee> getAllEmployee() {
		return employeeDao.listEmployees();
	}

	/**
	 * 页面添加数据
	 */
	@Override
	public int saveEmployee(Employee employee) {
		return employeeDao.insertEmployee(employee);
	}

	/**
	 * 根据员工编号进行修改
	 */
	@Override
	public int updateEmployeeById(Employee employee) {
		return employeeDao.updateEmployeeById(employee);
	}

	/**
	 * 检查用户名是否可用 true可用，false不可用
	 */
	@Override
	public int checkEname(String ename) {
		int count = employeeDao.countEname(ename);
		if (count == 0) {
			return 0;
		} else {
			return 1;
		}
	}

	/**
	 * 根据员工id查询员工信息
	 */
	@Override
	public Employee getEmpById(Integer id) {
		return employeeDao.getEmpById(id);
	}

	/**
	 * 根据Id删除员工信息
	 */
	@Override
	public void deleteEmpById(Integer id) {
		employeeDao.deleteEmpById(id);
	}

	@Override
	public void deleteBatch(List<Integer> ids) {
		employeeDao.deleteBatch(ids);
	}

	/**
	 * 多条件查询
	 */
	@Override
	public List<Employee> employeeAll(String ename, String job, String startTime, String endTime,
			Department department) {
		return employeeDao.employeeAll(ename, job, startTime, endTime, department);
	}

}
