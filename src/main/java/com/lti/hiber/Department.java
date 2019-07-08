package com.lti.hiber;

import java.util.List;

import javax.persistence.*;

@Entity
@Table(name="department100")



public class Department {

@Id
@GeneratedValue(strategy=GenerationType.AUTO)
private int dept_id;
private String dept_name;

@OneToMany(cascade=CascadeType.ALL)
@JoinColumn(name="dept_id")
private List  <Employee1>emp;



public List<Employee1> getEmp() {
 return emp;
}
public void setEmp(List<Employee1> emp) {
 this.emp = emp;
}
public int getDept_id() {
 return dept_id;
}
public void setDept_id(int dept_id) {
 this.dept_id = dept_id;
}
public String getDept_name() {
 return dept_name;
}
public void setDept_name(String dept_name) {
 this.dept_name = dept_name;
}



}



