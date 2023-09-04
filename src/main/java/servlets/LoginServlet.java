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
        boolean loginSuccess = false;

        try {
            SessionFactory sessionFactory = Connect.getFactory();
            Session session = sessionFactory.openSession();

            List<Admin> admins = session
                    .createQuery("FROM Admin WHERE username = :username AND password = :password", Admin.class)
                    .setParameter("username", username).setParameter("password", password).list();

            session.close();

            if (!admins.isEmpty()) {
           
                loginSuccess = true;
            } else {
         
                loginSuccess = false;
            }
        } catch (Exception e) {
            e.printStackTrace();
            loginSuccess = false;
        }


        if (loginSuccess) {
            response.sendRedirect("admin/ahome.jsp?loginSuccess=true");
        } else {
            response.sendRedirect("index.jsp?loginSuccess=false");
        }
    }
}
