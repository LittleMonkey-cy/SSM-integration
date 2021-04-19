package com.ruanyuan.dao;

import java.util.List;

import com.ruanyuan.pojo.Department;

/**
 * 部门表数据访问层接口方法类
 * @author 陈钰
 *
 */
public interface DepartmentDao {
	/**
	 * 查询所有的部门信息
	 * @return 部门集合
	 */
	List<Department> listDepartment();
}
