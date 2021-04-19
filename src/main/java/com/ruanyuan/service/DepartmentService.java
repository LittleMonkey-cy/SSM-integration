package com.ruanyuan.service;

import java.util.List;


import com.ruanyuan.pojo.Department;
public interface DepartmentService {
	/**
	 * 查询所有部门信息
	 * @return 部门集合
	 */
	List<Department> getDepts();

}
