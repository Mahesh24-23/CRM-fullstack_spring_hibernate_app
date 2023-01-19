package com.luv2code.springdemo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.luv2code.springdemo.entity.Customer;
import com.luv2code.springdemo.service.CustomerService;


@Controller
@RequestMapping("/customer")
public class CustomerController {
	
	//need to inject our customer service
	
	@Autowired
	private CustomerService custerservice;
	
	@GetMapping("/list")
	public String listCustomers(Model theModel) {
		
		//get the customers
		List<Customer> customers=custerservice.getCustomers();
		
		//add the customers to the model
		theModel.addAttribute("customers",customers);
		
		
		return "list-customers";
		
	}
	
	@GetMapping("/showFormForAdd")
	public String showFormForAdd(Model theModel) {
		
		Customer customers=new Customer();
		theModel.addAttribute("customers", customers);
	
		
		return "customers-form";
		
	}
	
	@PostMapping("/saveCustomer")
	public String saveCustomer(@ModelAttribute("customers") Customer customer) {
		
		//save the model customer attribute using service class
		
		custerservice.saveCustomer(customer); //no changes here to save the updates ,but we will change in the customerdao
		
		
		
		return "redirect:/customer/list";
	}
	
	
	@GetMapping("/showFormForUpdate")
	public String showFormForUpdate(@RequestParam("customerId" )int id,Model themodel){
		
		//get the customer from the db service
		Customer customer=custerservice.getcustomer(id);
		//prepopulate the form using the customer details
		themodel.addAttribute("customers",customer);
	
		return "customers-form";
	}
	
	

}
