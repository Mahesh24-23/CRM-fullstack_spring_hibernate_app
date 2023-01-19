package com.luv2code.springdemo.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.luv2code.springdemo.entity.Customer;


@Repository  //just like @Component in spring frame work
public class CustomerImpl implements CustomerDAO {
	
	
	//need to inject dependency injection of sessionfactory
	
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public List<Customer> getCustomers() {
		
		//get the current hibernate session 
		Session currentSession=sessionFactory.getCurrentSession();
		
		//create a query to retrieve all the customers
		Query<Customer> query=currentSession.createQuery("from Customer order by lastname",
				Customer.class);
		
		//execute the query and get all the list of customers
		List<Customer> customers =query.getResultList();
		
		
		//return the result
		
		return customers;
	}

	@Override
	public void saveCustomer(Customer customer) {
		Session currentSession=sessionFactory.getCurrentSession();
		
		//save or updathe customer
		currentSession.saveOrUpdate(customer);
		
		
	}

	@Override
	@Transactional
	public Customer getcustomer(int id) {
		Session currentSession=sessionFactory.getCurrentSession();
		
		Customer customer=currentSession.get(Customer.class,id);
		return customer;
		
		
	}

}
