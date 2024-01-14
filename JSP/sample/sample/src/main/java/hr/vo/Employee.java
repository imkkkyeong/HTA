package hr.vo;

import java.util.Date;

public class Employee {

	private int id;
	private String firstName;
	private String lastName;
	private String email;
	private String phoneNumber;
	private Date hireDate;
	private String jobId;
	private Double salary;
	private Double commission;
	private Integer managerId;
	private Integer departmentId;
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
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
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
	public Double getSalary() {
		return salary;
	}
	public void setSalary(Double salary) {
		this.salary = salary;
	}
	public Double getCommission() {
		return commission;
	}
	public void setCommission(Double commission) {
		this.commission = commission;
	}
	public Integer getManagerId() {
		return managerId;
	}
	public void setManagerId(Integer managerId) {
		this.managerId = managerId;
	}
	public Integer getDepartmentId() {
		return departmentId;
	}
	public void setDepartmentId(Integer departmentId) {
		this.departmentId = departmentId;
	}
	@Override
	public String toString() {
		return "Employee [id=" + id + ", firstName=" + firstName + ", lastName=" + lastName + ", email=" + email
				+ ", phoneNumber=" + phoneNumber + ", hireDate=" + hireDate + ", jobId=" + jobId + ", salary=" + salary
				+ ", commission=" + commission + ", managerId=" + managerId + ", departmentId=" + departmentId + "]";
	}
	
	
}

/*
 * Value Object (VO)로서 데이터를 담고 있는 클래스
 * . VO는 주로 데이터베이스의 특정 테이블과 일치하거나, 비슷한 역할을 하는 데이터 전송 객체(Data Transfer Object, DTO)의 한 형태
 *   각 변수에 대한 getter와 setter 메서드를 제공하여 클래스 외부에서 멤버 변수에 접근하고 값을 설정할 수 있다.
 *   
 *  toString 메서드:
	toString 메서드는 객체를 문자열로 표현하는 메서드로, 객체의 각 필드 값을 문자열로 조합하여 반환
 *  toString 메서드를 오버라이딩하여 해당 객체의 필드들을 문자열로 표현하도록 구현하면, 객체의 내용확인가능
 * 
 * 
 */
