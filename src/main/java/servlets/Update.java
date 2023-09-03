package servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import entity.Customer;
import elect.Connect;

@WebServlet("/update")
public class Update extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String meterNumber = request.getParameter("meter");
		String name = request.getParameter("name");
		String address = request.getParameter("address");
		String city = request.getParameter("city");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");

		try {
			Session session = Connect.getFactory().openSession();
			Transaction transaction = session.beginTransaction();

			String hql = "UPDATE Customer SET name = :name, address = :address, city = :city, email = :email, phoneNumber = :phone WHERE meterNumber = :meter";
			Query<Customer> query = session.createQuery(hql);

			query.setParameter("name", name);
			query.setParameter("address", address);
			query.setParameter("city", city);
			query.setParameter("email", email);
			query.setParameter("phone", phone);
			query.setParameter("meter", meterNumber);

			int rowsAffected = query.executeUpdate();

			if (rowsAffected > 0) {
				transaction.commit();
				response.sendRedirect("user/uhome.jsp");
			} else {
				response.sendRedirect("error.jsp");
			}
			session.close();
		} catch (HibernateException e) {
			e.printStackTrace();
			response.sendRedirect("error.jsp");
		}
	}
}
