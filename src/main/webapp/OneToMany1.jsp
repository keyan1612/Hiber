<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ page import="org.hibernate.*,
    javax.persistence.TypedQuery,
    com.lti.hiber.Employee1,
    com.lti.hiber.Department,
    org.hibernate.boot.registry.StandardServiceRegistryBuilder,
    org.hibernate.boot.registry.StandardServiceRegistry,
    org.hibernate.boot.Metadata,
    org.hibernate.boot.MetadataSources,
    org.hibernate.cfg.Configuration,java.util.*" %>

<!DOCTYPE html >
<html>
<head>
<meta charset="ISO-8859-1">
<title>Example</title>
</head>
<body>
<%

Configuration configuration= new Configuration();
configuration.configure("hibernate.cfg.xml");
SessionFactory factory=configuration.buildSessionFactory(new StandardServiceRegistryBuilder().configure().build());
Session sess=factory.openSession();
sess.beginTransaction();


 ArrayList<Employee1> list1=new ArrayList<Employee1>();
 ArrayList<Employee1> list2=new ArrayList<Employee1>();
 
  
 Employee1 emp1=new Employee1();
 emp1.setEname("Moni");
 emp1.setDesig("Manager");
 list1.add(emp1);
 
 
 Employee1 emp2=new Employee1();
 emp2.setEname("Mahesh");
 emp2.setDesig("Mgr");
 list1.add(emp2);
 
 
 Employee1 emp3=new Employee1();
 emp3.setEname("AJ");
 emp3.setDesig("Sr. Manager");
 list2.add(emp3);
 
 
 
 Employee1 emp4=new Employee1();
 emp4.setEname("Rocky");
 emp4.setDesig("Owner");
 list2.add(emp4);
 
 
 Employee1 emp5=new Employee1();
 emp5.setEname("Candy");
 emp5.setDesig("Manager");
 list2.add(emp5);
 
 Department dept1=new Department();
 dept1.setDept_name("Admin");
 dept1.setEmp(list1);
 

 Department dept2=new Department();
 dept2.setDept_name("Sales");
 dept2.setEmp(list2);
 
 
 
 
 
 sess.persist(dept1);

 sess.persist(dept2);
 

 sess.getTransaction().commit();

 
out.println("Table Created & Record Successfully Inserted");
 
 out.println("<br>"+"******************* Display Data *********************"+"<br>");
 TypedQuery<Department> query=sess.createQuery("from Department",Department.class);
 List<Department> list= query.getResultList();
 
 Iterator<Department> itr=list.iterator();
 while(itr.hasNext())
 {
 Department d=itr.next();
 out.println(d.getDept_name());
 out.println(d.getDept_id());
 
 
 List<Employee1> list3=d.getEmp();
 Iterator<Employee1> itr2=list3.iterator();
 while(itr2.hasNext())
 {
 Employee1 e=itr2.next();
  out.println("<br>" + e.getId()+" " +e.getEname()+":"+e.getDesig());

 }
 out.println("<br>");
 }
 
 sess.close();
 out.println("success");
 
 %>
</body>
</html>