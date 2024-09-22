package com.employee.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.employee.dao.EmployeeRepository;
import com.employee.modal.Employee;

@RestController
@RequestMapping("/emp")
public class EmployeeRestController {
	
	@Autowired
	private EmployeeRepository employeeRepository;

	//localhost:9091/employment/{10}
	
	@GetMapping("/empdata/{id}")
	public Employee findById(@PathVariable int id) {
		Employee findById = employeeRepository.findById(id);
		return findById;
		
	}
	
	@PostMapping("/employee/add")
	public String addEmployee(@ModelAttribute Employee employee) {
		employeeRepository.addEmployee(employee);
		return "redirect:/employees";
	}
	
}
