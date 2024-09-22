package com.employee.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.employee.modal.Employee;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

@Repository
public class EmployeeRepository {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	public List<Employee> findAll() {
		String sql = "SELECT * FROM employees";
		return jdbcTemplate.query(sql, (rs, rowNum) -> mapRowToEmployee(rs));
	}

	public void addEmployee(Employee employee) {
		String sql = "INSERT INTO employees (firstname, lastname, email, dob, designation, gender, start_date) VALUES (?, ?, ?, ?, ?, ?, ?)";
		jdbcTemplate.update(sql, employee.getFirstname(), employee.getLastname(), employee.getEmail(),
				employee.getDob(), employee.getDesignation(), employee.getGender(), employee.getStartDate());
	}

	public Employee findById(int id) {
		String sql = "SELECT * FROM employees WHERE id = ?";
		return jdbcTemplate.queryForObject(sql, new Object[] { id }, (rs, rowNum) -> mapRowToEmployee(rs));
	}

	public void updateEmployee(Employee employee) {
		String sql = "UPDATE employees SET firstname = ?, lastname = ?, email = ?, dob = ?, designation = ?, gender = ?, start_date = ? WHERE id = ?";
		jdbcTemplate.update(sql, employee.getFirstname(), employee.getLastname(), employee.getEmail(),
				employee.getDob(), employee.getDesignation(), employee.getGender(), employee.getStartDate(),
				employee.getId());
	}

	public void deleteEmployee(int id) {
		String sql = "DELETE FROM employees WHERE id = ?";
		jdbcTemplate.update(sql, id);
	}
	
	public void updateDesignation(String designation) {
		String sql = "INSERT INTO designation_master (designation_name) VALUES (?)";
		jdbcTemplate.update(sql,designation);
	}
	
	public List<String> getDesignationList(){
		String sql = "SELECT designation_name FROM designation_master";
		List<String> designations = jdbcTemplate.queryForList(sql, String.class);
		return designations;
		
	}

	private Employee mapRowToEmployee(ResultSet rs) throws SQLException {
		Employee employee = new Employee();
		employee.setId(rs.getInt("id"));
		employee.setFirstname(rs.getString("firstname"));
		employee.setLastname(rs.getString("lastname"));
		employee.setEmail(rs.getString("email"));
		employee.setDob(rs.getDate("dob"));
		employee.setDesignation(rs.getString("designation"));
		employee.setGender(rs.getString("gender"));
		employee.setStartDate(rs.getDate("start_date"));
		return employee;
	}
	
	
}
