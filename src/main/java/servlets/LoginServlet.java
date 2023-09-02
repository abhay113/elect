package servlets;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import java.io.IOException;
import java.util.List;

import elect.Connect;
import entity.Admin;

@WebServlet("/Login")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("aname");
        String password = request.getParameter("apass");

        try {
            SessionFactory sessionFactory = Connect.getFactory();
            Session session = sessionFactory.openSession();

            // Perform a query to check if the credentials match an entry in the Admin table
            List<Admin> admins = session.createQuery("FROM Admin WHERE username = :username AND password = :password", Admin.class)
                    .setParameter("username", username)
                    .setParameter("password", password)
                    .list();

            session.close();

            if (!admins.isEmpty()) {
            	System.out.println("suceeess");
                response.sendRedirect("admin/ahome.jsp"); 
            } else {
              
                response.sendRedirect("error.jsp"); 
            }
        } catch (Exception e) {
            e.printStackTrace();
            // Handle any exceptions (e.g., database errors)
            response.sendRedirect("error.jsp"); // You can create an error page for handling exceptions
        }
    }
}