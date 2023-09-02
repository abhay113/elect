package servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.hibernate.Session;
import org.hibernate.Transaction;

import elect.Connect;
import entity.Customer; // Replace with your actual entity class package

@WebServlet("/AddCustomerServlet")
public class AddCustomerServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String meterNumber = request.getParameter("meter");
		String name = request.getParameter("name");
		String address = request.getParameter("address");
		String city = request.getParameter("city");
		String phoneNumber = request.getParameter("phone");
		String email = request.getParameter("email");
		Customer customer = new Customer();
		customer.setMeterNumber(meterNumber);
		customer.setName(name);
		customer.setAddress(address);
		customer.setCity(city);
		customer.setPhoneNumber(phoneNumber);
		customer.setEmail(email);

		try {
			Session session = Connect.getFactory().openSession();
			Transaction transaction = session.beginTransaction();
			session.save(customer);
			transaction.commit();
			session.close();
			request.getRequestDispatcher("admin/meter.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
			response.sendRedirect("error.jsp"); 
		}
	}
}
