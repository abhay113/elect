package servlets;

import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import org.hibernate.*;
import elect.Connect;

@WebServlet("/Delete")
public class Delete extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String meterNumber = request.getParameter("meter");

        try {
            SessionFactory sessionFactory = Connect.getFactory();
            Session session = sessionFactory.openSession();
            Transaction transaction = session.beginTransaction();

            // Use HQL to delete the customer by meterNumber
            String customerHql = "DELETE FROM Customer WHERE meterNumber = :meterNumber";
            Query customerQuery = session.createQuery(customerHql);
            customerQuery.setParameter("meterNumber", meterNumber);

            int customerRowsAffected = customerQuery.executeUpdate();

            // Use HQL to delete the user by meterNumber
            String userHql = "DELETE FROM User WHERE meterNumber = :meterNumber";
            Query userQuery = session.createQuery(userHql);
            userQuery.setParameter("meterNumber", meterNumber);

            int userRowsAffected = userQuery.executeUpdate();

            transaction.commit();
            session.close();

            if (customerRowsAffected > 0 || userRowsAffected > 0) {
                // At least one record was deleted from either table
                response.sendRedirect("admin/viewcustomer.jsp?success=true");
            } else {
                // No data found for the provided meterNumber in either table
                response.sendRedirect("admin/viewcustomer.jsp?success=false");
            }
        } catch (HibernateException e) {
            e.printStackTrace();
            // Handle any Hibernate-related exceptions
            response.sendRedirect("admin/viewcustomer.jsp?success=false");
        } catch (Exception e) {
            e.printStackTrace();
            // Handle other exceptions (e.g., database connection issues)
            response.sendRedirect("admin/viewcustomer.jsp?success=false");
        }
    }
}
