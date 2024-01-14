package hr.dto;

import java.util.Date;

public class EmpListDto {

	private int id;
	private String firstName;
	private String phoneNumber;
	private Date hireDate;
	private String jobId;
	private String departmentName;

	public EmpListDto () {}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public Date getHireDate() {
		return hireDate;
	}

	public void setHireDate(Date hireDate) {
		this.hireDate = hireDate;
	}

	public String getJobId() {
		return jobId;
	}

	public void setJobId(String jobId) {
		this.jobId = jobId;
	}

	public String getDepartmentName() {
		return departmentName;
	}

	public void setDepartmentName(String departmentName) {
		this.departmentName = departmentName;
	}

	@Override
	public String toString() {
		return "EmpListDto [id=" + id + ", firstName=" + firstName + ", phoneNumber=" + phoneNumber + ", hireDate="
				+ hireDate + ", jobId=" + jobId + ", departmentName=" + departmentName + "]";
	}
	
	
	
}

/**
 * 
 * 이 클래스는 주로 데이터 전송에 사용되며, 다른 계층 간에 데이터를 효과적으로 전달할 때 사용
 * 데이터베이스에서 조회한 직원 정보를 이 클래스의 객체로 담아 전달하거나 출력할 때 사용
 * 
 * 
 */


