<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ page import="org.hibernate.*,org.hibernate.cfg.Configuration,java.util.*,
    javax.persistence.TypedQuery,
    com.lti.hiber.Customer,
    com.lti.hiber.Address,
    org.hibernate.boot.Metadata,
    org.hibernate.boot.MetadataSources,
    org.hibernate.boot.registry.StandardServiceRegistry,
    org.hibernate.boot.registry.StandardServiceRegistryBuilder" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
Configuration configuration = new Configuration();
configuration.configure("hibernate.cfg.xml");
SessionFactory factory = configuration.buildSessionFactory(
		new StandardServiceRegistryBuilder().configure().build());
Session sess= factory.openSession();
sess.beginTransaction();

Customer c1=new Customer();    
c1.setName("John");    
c1.setEmail("john@gmail.com");    
    
Address address1=new Address();    
address1.setAddressLine1("#101 Sunrise Woods");    
address1.setCity("Mumbai");    
address1.setState("Maharastra");    
address1.setCountry("India");    
address1.setPincode(577869);    
    
c1.setAddress(address1);    
address1.setCustomer(c1);    


Customer c2=new Customer();    
c2.setName("Deeps");    
c2.setEmail("Loosu@gmail.com");  

Address address2=new Address();    
address2.setAddressLine1("#102 SeaWoods Mall");    
address2.setCity("Dharavi");    
address2.setState("Maharastra");    
address2.setCountry("India");    
address2.setPincode(500028);    

c2.setAddress(address2);    
address2.setCustomer(c2);    


Customer c3=new Customer();    
c3.setName("ArusiMoota");    
c3.setEmail("Loosu@gmail.com");  

Address address3=new Address();    
address3.setAddressLine1("#103 Phoenix Mall");    
address3.setCity("Turbhe Naka");    
address3.setState("Maharastra");    
address3.setCountry("India");    
address3.setPincode(508766);    

c3.setAddress(address3);    
address3.setCustomer(c3);    





    
sess.persist(c1);   
sess.persist(c2);  
sess.persist(c3);  
sess.getTransaction().commit(); 
  
out.println("Table Created & Record successfully Inserted"+"<br>");
out.println("<br>"+"*********** Display Data ************"+"<br>");
TypedQuery<Customer> query=sess.createQuery("from Customer",Customer.class);    
List<Customer> list=query.getResultList();   
    
Iterator<Customer> itr=list.iterator();    
while(itr.hasNext()){    
 Customer cust=itr.next();    
 out.println("<br>"+cust.getCustomerId()+" "+cust.getName()+" "+cust.getEmail());    
 Address address=cust.getAddress();    
 out.println(address.getAddressLine1()+" "+address.getCity()+" "+    
    address.getState()+" "+address.getCountry()+" "+address.getPincode());    
}    
sess.close();    
out.println("<br>"+"success");   
%>
</body>
</html>