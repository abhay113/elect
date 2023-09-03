package servlets;

import org.hibernate.Session;
import org.hibernate.query.Query;
import entity.User; // Replace with your actual User entity class package
import elect.Connect; // Replace with your Hibernate utility class package

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/userLogin")
public class UserLoginServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String username = request.getParameter("uname");
		String password = request.getParameter("upass");

		try {
			Session session = Connect.getFactory().openSession();
			session.beginTransaction();

			String hql = "FROM User WHERE username = :username AND password = :password";
			Query<User> query = session.createQuery(hql, User.class);
			query.setParameter("username", username);
			query.setParameter("password", password);

			User user = query.uniqueResult();

			if (user != null) {
				String meterNumber = user.getMeterNumber();
				HttpSession httpSession = request.getSession();
				httpSession.setAttribute("meterNumber", meterNumber);

				response.sendRedirect("user/uhome.jsp");
			} else {
				request.setAttribute("loginError", "Invalid credentials");
				request.getRequestDispatcher("/elect/index.jsp").forward(request, response);
			}

			session.getTransaction().commit();
			session.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}
}
