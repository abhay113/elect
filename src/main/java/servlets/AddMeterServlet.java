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
import entity.Meter; 

@WebServlet("/AddMeterServlet")
public class AddMeterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Retrieve form data
        String meterNumber = request.getParameter("meter");
        String location = request.getParameter("location");
        String type = request.getParameter("type");
        String phaseCode = request.getParameter("phasecode");
        String billType = request.getParameter("billtype");
        String days = request.getParameter("days");

        // Create a new Meter object and set its properties
        Meter meter = new Meter();
        meter.setMeterNumber(meterNumber);
        meter.setLocation(location);
        meter.setType(type);
        meter.setPhaseCode(phaseCode);
        meter.setBillType(billType);
        meter.setDays(days);

      
        try {
            Session session = Connect.getFactory().openSession();
            Transaction transaction = session.beginTransaction();

            session.save(meter);

            transaction.commit();
            session.close();
            
            response.sendRedirect("admin/ahome.jsp?success=true");
        } catch (Exception e) {
            e.printStackTrace();
         
            response.sendRedirect("error.jsp");
        }
    }
}
