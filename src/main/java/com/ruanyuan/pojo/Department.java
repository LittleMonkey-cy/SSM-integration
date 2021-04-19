package com.ruanyuan.pojo;

import java.math.BigInteger;

/**
 * 部门表实体类
 * @author 陈钰
 *
 */
public class Department {
	/**
	 * 部门编号
	 */
	private BigInteger deptno;
	/**
	 * 部门名称
	 */
	private String dname;
	/**
	 * 部门地址
	 */
	private String loc;
	public BigInteger getDeptno() {
		return deptno;
	}
	public void setDeptno(BigInteger deptno) {
		this.deptno = deptno;
	}
	public String getDname() {
		return dname;
	}
	public void setDname(String dname) {
		this.dname = dname;
	}
	public String getLoc() {
		return loc;
	}
	public void setLoc(String loc) {
		this.loc = loc;
	}
	@Override
	public String toString() {
		return "Department [deptno=" + deptno + ", dname=" + dname + ", loc=" + loc + "]";
	}
	public Department(BigInteger deptno, String dname, String loc) {
		super();
		this.deptno = deptno;
		this.dname = dname;
		this.loc = loc;
	}
	public Department() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}
