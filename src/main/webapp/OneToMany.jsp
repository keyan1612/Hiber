<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ page import="org.hibernate.*,
    javax.persistence.TypedQuery,
    com.lti.hiber.Question,
    com.lti.hiber.Answer,
    org.hibernate.boot.registry.StandardServiceRegistryBuilder,
    org.hibernate.boot.registry.StandardServiceRegistry,
    org.hibernate.boot.Metadata,
    org.hibernate.boot.MetadataSources,
    org.hibernate.cfg.Configuration,java.util.*" %>

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
 Answer ans1=new Answer();
 ans1.setAnswername("HTML is used for web Desigining");
 ans1.setPostedBy("Moni");

 Answer ans2=new Answer();
 ans2.setAnswername("Java Script is a Scripting language");
 ans2.setPostedBy("Rocky");
 
 Answer ans3=new Answer();
 ans3.setAnswername("JS is client");
 ans3.setPostedBy("Deeps");
 
 Answer ans4=new Answer();
 ans4.setAnswername("Js is a Client Side Scripting");
 ans4.setPostedBy("Mahesh");
 
 Answer ans5=new Answer();
 ans4.setAnswername("Js is client/server Scripting laungage");
 ans5.setPostedBy("Pranesh");
 
 ArrayList<Answer> list1=new ArrayList<Answer>();
 list1.add(ans1);
 list1.add(ans2);
 
 ArrayList<Answer> list2=new ArrayList<Answer>();
 list2.add(ans3);
 list2.add(ans4);
 list2.add(ans5);

 Question question1=new Question();
 question1.setQname("What is HTML?");
 question1.setAnswers(list1);
 
 Question question2=new Question();
 question2.setQname("What is Java Script?");
 question2.setAnswers(list2);
 
sess.persist(question1);
sess.persist(question2);
sess.getTransaction().commit();

 //sess.close();
 out.println("Table Created & Record Successfully Inserted");
 
 out.println("<br>"+"******************* Display Data *********************"+"<br>");
 TypedQuery<Question> query=sess.createQuery("from Question",Question.class);
 List<Question> list= query.getResultList();
 
 Iterator<Question> itr=list.iterator();
 while(itr.hasNext())
 {
	 Question q=itr.next();
	 out.println("<br>"+"Question Name: "+q.getQname());
	 
	 List<Answer> list3=q.getAnswers();
	 Iterator<Answer> itr2=list3.iterator();
	 while(itr2.hasNext())
	 {
		 Answer a=itr2.next();
		 out.println("<br>"+a.getAnswername()+":"+a.getPostedBy());

 }
	 out.println("<br>");
 }
 sess.close();
 out.println("success");
 factory.close();
 
 %>
</body>
</html>
 