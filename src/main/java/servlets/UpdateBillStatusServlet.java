package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import entity.Bill;
import elect.Connect;

@WebServlet("/paybill")
public class UpdateBillStatusServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String meterNumber = request.getParameter("meterNumber");

        try {
         
            Session session = Connect.getFactory().openSession();
            Transaction transaction = session.beginTransaction();

            String hql = "FROM Bill WHERE meterNumber = :meter";
            Query<Bill> query = session.createQuery(hql, Bill.class);
            query.setParameter("meter", meterNumber);

            Bill bill = query.uniqueResult();

            if (bill != null) {
                bill.setStatus("Paid");
                session.update(bill);
                transaction.commit();
            }

            session.close();

            response.sendRedirect("user/uhome.jsp");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
