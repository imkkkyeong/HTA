package hr.dao;

import java.util.List;

import helper.JdbcTemplate;
import hr.vo.Job;

public class JobDao {
	
	public void insetJob(Job job) {
		String sql = """
				INSERT INTO JOBS
				(JOB_ID, JOB_TITLE, MIN_SALARY, MAX_SALARY)
				VALUES
				(?, ?, ?, ?)
				""";
		
		JdbcTemplate.insert(sql, job.getId(), job.getTitle(),
							job.getMinSalary(), job.getMaxSalary());	
	}

	
	public List<Job> getAllJobs(){
		String sql ="""
				SELECT
					JOB_ID,
					JOB_TITLE,
					MIN_SALARY,
					MAX_SALARY
				FROM 
					JOBS
				WHERE 
					JOB_ID IS NOT NULL
				ORDER BY 
					JOB_ID ASC
				""";
		
		return JdbcTemplate.selectList(sql, rs -> {
			Job job = new Job();
			job.setId(rs.getString("job_id"));
			job.setTitle(rs.getString("job_title"));
			job.setMinSalary(rs.getInt("min_salary"));
			job.setMaxSalary(rs.getInt("max_salary"));
			
			return job;
		});
	}
	
	public Job getJobById(String jobId) {
		String sql = """
				select
					job_id, job_title,
					min_salary, max_salary
				from jobs
				where job_id = ?
				""";
		
		return JdbcTemplate.selectOne(sql, rs ->{
			Job job = new Job();
			job.setId(rs.getString("job_id"));
			job.setTitle(rs.getString("job_title"));
			job.setMinSalary(rs.getInt("min_salary"));
			job.setMaxSalary(rs.getInt("MAX_SALARY"));
			
			return job;
		},jobId);
	}
	
}
