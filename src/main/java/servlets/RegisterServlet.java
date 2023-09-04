package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import entity.Customer;
import entity.User;
import elect.Connect;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String meterNumber = request.getParameter("meter");
		String fullName = request.getParameter("fullname");
		String username = request.getParameter("uname");
		String password = request.getParameter("upass");

		try {
			SessionFactory sessionFactory = Connect.getFactory();
			Session session = sessionFactory.openSession();
			Transaction transaction = session.beginTransaction();

			String hql = "FROM Customer WHERE meterNumber = :meter";
			Query<Customer> query = session.createQuery(hql, Customer.class);
			query.setParameter("meter", meterNumber);
			Customer customer = query.uniqueResult();

			if (customer != null) {
				User user = new User(meterNumber, fullName, username, password);
				session.save(user);
				transaction.commit();
				session.close();

				response.sendRedirect("register.jsp?success=true");
			} else {
				response.sendRedirect("register.jsp?success=false");
			}
		} catch (Exception e) {
			e.printStackTrace();
			response.sendRedirect("register.jsp?success=false");
		}
	}
}
