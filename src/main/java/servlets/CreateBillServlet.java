package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.hibernate.Session;
import org.hibernate.Transaction;
import entity.Bill;
import elect.Connect;

@WebServlet("/createBill")
public class CreateBillServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String meterNumber = request.getParameter("meterNumber");
        String month = request.getParameter("month");
        double units = Double.parseDouble(request.getParameter("units"));
        double billAmount = Double.parseDouble(request.getParameter("billAmount"));
        String status = request.getParameter("status");

        try {
            Session session = Connect.getFactory().openSession();
            Transaction transaction = session.beginTransaction();

            Bill bill = new Bill();
            bill.setMeterNumber(meterNumber);
            bill.setMonth(month);
            bill.setUnits(units);
            bill.setBillAmount(billAmount);
            bill.setStatus(status);

            session.save(bill); 
            transaction.commit();
            session.close();
            response.sendRedirect("admin/generatebill.jsp?success=true");
        } catch (Exception e) {
            e.printStackTrace();

            response.sendRedirect("admin/generatebill.jsp?success=false");
        }
    }
}
