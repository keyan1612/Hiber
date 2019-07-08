<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ page import="org.hibernate.*,org.hibernate.boot.*,org.hibernate.boot.registry.StandardServiceRegistryBuilder,
    org.hibernate.cfg.Configuration,java.util.*,
    com.lti.hiber.Employee" %>

<!DOCTYPE html >
<html>
<head>
<meta charset="ISO-8859-1">
<title>HIBERNATE ANNOTATION</title>
</head>
<body>
<%
 Configuration configuration=new Configuration();
 configuration.configure("hibernate.cfg.xml");
 SessionFactory factory=configuration.buildSessionFactory(new StandardServiceRegistryBuilder().configure().build());
 Session sess=factory.openSession();
 
 sess.beginTransaction();
 
 Employee e1=new Employee();
 //e1.setId(104);
 e1.setFirstname("Mahesh");
 e1.setLastname("Mama");
  sess.save(e1);
 sess.getTransaction().commit();
 out.println("successfully saved");
 
 out.println("<br>"+"********************"+"<br>");
 List<Employee> emp=sess.createQuery("from Employee").list();
 
 for(Employee e:emp)
 {
  out.println(e.getId()+" "+e.getFirstName()+" "+e.getLastName()+"<br>");
 }
 
 sess.close();
 factory.close();
 
 %>
</body>
</html>
