package hr.dao;

import java.util.List;

import helper.JdbcTemplate;
import hr.dto.EmpListDto;
import hr.vo.Employee;

public class EmployeeDao {
	
	public int getTotalRows() {
		String sql = """
				select count(*) cnt
				from employees
				""";
		return JdbcTemplate.selectOne(sql, s -> {
			int cnt = s.getInt("cnt");
			return cnt;
		});
						
	}
	
	public void insertEmployee(Employee emp) {
		String sql = """
				INSERT INTO EMPLOYEES
				(EMPLOYEE_ID, FISRT_NAME, LAST_NAME, EMAIL, PHONE_NUMBER,
				HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, DEPARTMENT_ID)
				VALUES
				(EMPLOTEES_SEQ.nextval, ?, ?, ?, ?, ?, ?, ?, ?, ?)
				""";
		
		JdbcTemplate.insert(sql,emp.getFirstName(), emp.getLastName(),
							emp.getEmail(), emp.getPhoneNumber(), emp.getHireDate(),
							emp.getJobId(), emp.getSalary(), emp.getCommission(),
							emp.getDepartmentId());
	}
	
	public List<EmpListDto> getEmployees(int start, int end) {
		String sql = """
				
				SELECT X.EMPLOYEE_ID, X.FIRST_NAME, X.PHONE_NUMBER, X.HIRE_DATE, X.JOB_ID, D.DEPARTMENT_NAME
				FROM ( SELECT row_number() over ( ORDER BY E.employee_id DESC ) NUM,
						employee_id, first_name, PHONE_NUMBER, HIRE_DATE,
                        JOB_ID, DEPARTMENT_ID
						FROM Employees E) X, DEPARTMENTS D
				WHERE X.NUM BETWEEN ? AND ?
				AND X.DEPARTMENT_ID = D.DEPARTMENT_ID(+)
			""";
		
		return JdbcTemplate.selectList(sql, ss -> {
			EmpListDto dto = new EmpListDto();
			dto.setId(ss.getInt("employee_id"));
			dto.setFirstName(ss.getString("first_name"));
			dto.setPhoneNumber(ss.getString("phone_number"));
			dto.setHireDate(ss.getDate("hire_date"));
			dto.setJobId(ss.getString("job_id"));
			dto.setDepartmentName(ss.getString("department_name"));
			
			return dto;
		}, start, end);
	}
}
