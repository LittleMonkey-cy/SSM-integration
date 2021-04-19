package com.ruanyuan.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ruanyuan.pojo.Department;
import com.ruanyuan.pojo.Employee;

/**
 * 员工控制器类
 * 
 * @author 陈钰
 *
 */
public interface EmployeeDao {
	/**
	 * 根据用户编号查询用户信息
	 * 
	 * @param id 员工编号
	 * @return 员工对象集合
	 */
	Employee getEmpById(Integer id);

	/**
	 * 查询所有
	 * 
	 * @return 员工集合
	 */
	List<Employee> listEmployees();

	/**
	 * 添加员工记录
	 * 
	 * @return
	 */
	int insertEmployee(Employee employee);

	/**
	 * 修改员工记录
	 */
	int updateEmployeeById(Employee employee);

	/**
	 * 查询员工姓名
	 */
	int countEname(String ename);

	/**
	 * 根据员工编号删除员工信息
	 * 
	 * @param id 员工编号
	 * @return 删除的条数记录
	 */
	int deleteEmpById(Integer id);

	/**
	 * 多条件查询
	 */
	List<Employee> employeeAll(@Param("ename") String ename, @Param("job") String job,
			@Param("startTime") String startTime, @Param("endTime") String endTime,@Param("department")Department department);

	/**
	 * 批量删除
	 * 
	 * @param ids
	 */
	void deleteBatch(List<Integer> ids);

}
