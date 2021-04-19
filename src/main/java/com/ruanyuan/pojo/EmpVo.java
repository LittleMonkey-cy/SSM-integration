package com.ruanyuan.pojo;



/**
 * 多条件查询的实体类
 * 
 * @author 陈钰
 *
 */
public class EmpVo {

	private Department department;
	private String job;
	private String ename;
	private String startTime;
	private String endTime;
	public EmpVo() {
		super();
	}
	
	public EmpVo(Department department, String job, String ename, String startTime, String endTime) {
		super();
		this.department = department;
		this.job = job;
		this.ename = ename;
		this.startTime = startTime;
		this.endTime = endTime;
	}

	public Department getDepartment() {
		return department;
	}
	public void setDepartment(Department department) {
		this.department = department;
	}
	public String getJob() {
		return job;
	}
	public void setJob(String job) {
		this.job = job;
	}
	public String getEname() {
		return ename;
	}
	public void setEname(String ename) {
		this.ename = ename;
	}
	public String getStartTime() {
		return startTime;
	}
	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}
	public String getEndTime() {
		return endTime;
	}
	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}
	@Override
	public String toString() {
		return "EmpVo [department=" + department + ", job=" + job + ", ename=" + ename + ", startTime=" + startTime
				+ ", endTime=" + endTime + "]";
	}


}
