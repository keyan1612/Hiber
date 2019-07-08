package com.lti.hiber;

import javax.persistence.*;

@Entity
@Table(name="employee100")

public class Employee1 {
@Id
@Column(name = "ID")
@GeneratedValue(strategy=GenerationType.AUTO)// generator = "id_Sequence")
//@SequenceGenerator(name = "id_Sequence", sequenceName = "ID_SEQ")
private int id;
private String ename;
private String desig;
 





public int getId() {
 return id;
}
public void setId(int id) {
 this.id = id;
}
public String getEname() {
 return ename;
}
public void setEname(String ename) {
 this.ename = ename;
}
public String getDesig() {
 return desig;
}
public void setDesig(String desig) {
 this.desig = desig;
}



}
