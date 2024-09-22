package com.employee.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.employee.dao.EmployeeRepository;
import com.employee.modal.Employee;

import java.sql.Date;
import java.util.List;

@Controller
public class EmployeeController {

	@Autowired
	private EmployeeRepository employeeRepository;

	@GetMapping("/")
	public String showHomePage() {
		return "employees";
	}

	@GetMapping("/employees")
	public String listEmployees(Model model) {
		List<Employee> employees = employeeRepository.findAll();
		model.addAttribute("employees", employees);
		return "employees";
	}
	
	   @GetMapping("/employee/new")
	    public String showNewEmployeeForm(Model model) {
		   List<String> designations = employeeRepository.getDesignationList();
	        model.addAttribute("employee", new Employee());
	        model.addAttribute("designations", designations);
	        return "addEmployee";
	    }

	@PostMapping("/employee/add")
	public String addEmployee(@ModelAttribute Employee employee) {
		employeeRepository.addEmployee(employee);
		return "redirect:/employees";
	}

	@GetMapping("/employee/edit/{id}")
	public String showEditEmployeeForm(@PathVariable("id") int id, Model model) {
		Employee employee = employeeRepository.findById(id);
		model.addAttribute("employee", employee);
		return "editEmployee";
	}

	@PostMapping("/employee/update")
	public String updateEmployee(@ModelAttribute Employee employee) {
		employeeRepository.updateEmployee(employee);
		return "redirect:/employees";
	}

	@GetMapping("/employee/delete/{id}")
	public String deleteEmployee(@PathVariable("id") int id) {
		employeeRepository.deleteEmployee(id);
		return "redirect:/employees";
	}
	
	@GetMapping("/designation/new")
    public String showAddDesignationPage() {
        return "addDesignation";
    }

    // Add designation to the database
    @PostMapping("/designation/add")
    public String addDesignation(@RequestParam("designation") String designation) {
    	employeeRepository.updateDesignation(designation);
        return "redirect:/designation/new";
    }

}
