package elect;

import org.hibernate.*;

import entity.Complaint;

public class App {

	
	public static void main(String[] args) {
		
	Session s1 = Connect.getFactory().openSession();

	Transaction tx = s1.beginTransaction();

	Complaint c = new Complaint("test", "testt");
	
	
	s1.save(c);
	tx.commit();

}

}