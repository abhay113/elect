package elect;

import org.hibernate.*;

import entity.Admin;

public class App {

	
	public static void main(String[] args) {
		
	Session s1 = Connect.getFactory().openSession();

	Transaction tx = s1.beginTransaction();

	Admin c = new Admin((long) 1,"admin", "admin");
	
	
	s1.save(c);
	tx.commit();

}

}