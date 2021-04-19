package com.ruanyuan.pojo;

import java.math.BigDecimal;
import java.math.BigInteger;


import jakarta.validation.constraints.Pattern;

/**
 * 员工表实体类
 * @author 陈钰
 *
 */
public class Employee {
	/**
	 * 员工编号
	 */
	@Pattern(regexp = "(^[a-zA-Z0-9_-]{6,16}$)|(^[\\\\u2E80-\\\\u9FFF]{2,5})",message = "用户名必须是2-5位中文或者6-16位英文和数字的结合")
	private BigInteger empno;
	/**
	 * 员工名称
	 */
	private String ename;
	/**
	 * 工作
	 */
	private String job;
	/**
	 * 入职日期
	 */
	private String hiredate;
	/**
	 * 薪水
	 */
	private BigDecimal sal;
	/**
	 * 奖金
	 */
	private BigDecimal comm;
	/**
	 * 部门编号
	 */
	private Integer deptno;
	/**
	 * 部门
	 */
	private Department department;
	
	public Employee() {
		super();
	}
	
	public Employee(BigInteger empno, String ename, String job, String hiredate, BigDecimal sal, BigDecimal comm,
			Integer deptno, Department department) {
		super();
		this.empno = empno;
		this.ename = ename;
		this.job = job;
		this.hiredate = hiredate;
		this.sal = sal;
		this.comm = comm;
		this.deptno = deptno;
		this.department = department;
	}

	public BigInteger getEmpno() {
		return empno;
	}
	public void setEmpno(BigInteger empno) {
		this.empno = empno;
	}
	public String getEname() {
		return ename;
	}
	public void setEname(String ename) {
		this.ename = ename;
	}
	public String getJob() {
		return job;
	}
	public void setJob(String job) {
		this.job = job;
	}
	public String getHiredate() {
		return hiredate;
	}
	public void setHiredate(String hiredate) {
		this.hiredate = hiredate;
	}
	public BigDecimal getSal() {
		return sal;
	}
	public void setSal(BigDecimal sal) {
		this.sal = sal;
	}
	public BigDecimal getComm() {
		return comm;
	}
	public void setComm(BigDecimal comm) {
		this.comm = comm;
	}
	public Department getDepartment() {
		return department;
	}
	public void setDepartment(Department department) {
		this.department = department;
	}
	
	public Integer getDeptno() {
		return deptno;
	}

	public void setDeptno(Integer deptno) {
		this.deptno = deptno;
	}

	@Override
	public String toString() {
		return "Employee [empno=" + empno + ", ename=" + ename + ", job=" + job + ", hiredate=" + hiredate + ", sal="
				+ sal + ", comm=" + comm + ", deptno=" + deptno + ", department=" + department + "]";
	}


	
	
	
}

