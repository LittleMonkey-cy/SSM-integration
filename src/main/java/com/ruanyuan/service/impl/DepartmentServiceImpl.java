package com.ruanyuan.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.ruanyuan.dao.DepartmentDao;
import com.ruanyuan.pojo.Department;
import com.ruanyuan.service.DepartmentService;
/**
 * 部门表业务逻辑层实现类
 * @author 陈钰
 *
 */
@Service
public class DepartmentServiceImpl implements DepartmentService{
	@Resource
	private DepartmentDao departmentDao;
	/**
	 * 查询所有部门信息
	 */
	@Override
	public List<Department> getDepts() {
		List<Department> list = departmentDao.listDepartment();
		return list;
	}
}
