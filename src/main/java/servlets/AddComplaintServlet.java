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
import entity.Complaint;
import elect.Connect;

@WebServlet("/complaint")
public class AddComplaintServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String username = request.getParameter("name");
		String description = request.getParameter("desc");

		Complaint complaint = new Complaint(username, description);

		try {
			SessionFactory sessionFactory = Connect.getFactory();
			Session session = sessionFactory.openSession();
			Transaction transaction = session.beginTransaction();

			session.save(complaint);

			transaction.commit();
			session.close();

			response.sendRedirect("user/uhome.jsp");
		} catch (Exception e) {
			e.printStackTrace();
			response.sendRedirect("error.jsp");
		}
	}
}
