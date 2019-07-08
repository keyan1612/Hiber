package com.lti.hiber;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

@Entity
@Table(name="emp500")
public class Employee {
	@Id
	@GeneratedValue(strategy=GenerationType.SEQUENCE,generator="empid_generator")
	@SequenceGenerator(name="empid_generator" ,sequenceName="employee_id",allocationSize=1)
	@Column(name="id",updatable=false,nullable=false)
	private int id;
	@Column(name="fname")
	private  String firstName;
	@Column(name="lname")
			private String lastName;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstname(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastname(String lastName) {
		this.lastName = lastName;
	}
	
}
