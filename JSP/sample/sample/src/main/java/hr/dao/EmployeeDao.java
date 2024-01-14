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
				(EMPLOYEES_SEQ.nextval, ?, ?, ?, ?, ?, ?, ?, ?, ?)
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


/*
 * JdbcTemplate.selectOne 메서드를 사용하여 단일 결과를 조회하고 반환
 * JdbcTemplate.insert 메서드를 사용하여 쿼리를 실행하고, 직원 객체에서 각 필드 값을 매개변수로 전달
 * JdbcTemplate.selectList 메서드를 사용하여 여러 행의 결과를 조회하고 반환
 * row_number() 함수와 over 절을 사용하여 행 번호를 부여하고, 해당 번호의 범위에 속하는 직원 데이터를 조회
 * 
 * 
 * 
 * VO 클래스는 주로 데이터를 담는 객체로 사용되며, DAO 클래스에서는 이 VO 객체를 생성하고 필요한 정보를 세팅하여 데이터베이스와의 상호작용을 수행한다.
 * VO 클래스는 데이터베이스 테이블의 구조에 맞게 정의되며, DAO 클래스에서는 VO를 통해 데이터를 전달하거나 결과를 받아온다
 * 
 * 
 * JDBC(Java Database Connectivity)는 자바 프로그램과 관계형 데이터베이스 간의 표준 데이터베이스 접속을 제공하는 자바 API(응용 프로그래밍 인터페이스)
 * JDBC를 사용하면 자바 애플리케이션에서 데이터베이스에 접속하고 SQL 쿼리를 실행하여 데이터를 검색, 추가, 수정, 삭제한다.
 * */

