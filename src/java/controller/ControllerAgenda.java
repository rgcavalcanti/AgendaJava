package controller;

import DAO.ContactDAO;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Contact;

@WebServlet(name = "ControllerAgenda", urlPatterns = {"/ControllerAgenda"})
public class ControllerAgenda extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        request.setCharacterEncoding("UTF-8");
        
        ContactDAO dao = new ContactDAO();
        
        try {
            dao.delete(Integer.parseInt(request.getParameter("id")));
        } catch (NumberFormatException ex) {
            System.out.println(ex);
        } finally {
            RequestDispatcher rd = request.getRequestDispatcher("/index");
            rd.forward(request, response);
        }   

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        request.setCharacterEncoding("UTF-8");
        
        String action = "" + request.getParameter("action");
        int id;
        Contact contact = new Contact();
        
        
        contact.setName(request.getParameter("name"));
        contact.setEmail(request.getParameter("email"));
        contact.setPhone(request.getParameter("phone"));
        if(action.equals("edit")){
            contact.setId(Integer.parseInt(request.getParameter("id")));
            ContactDAO dao = new ContactDAO();
            id = contact.getId();
            dao.update(contact);            
        }
        else{
            ContactDAO dao = new ContactDAO();
            id = dao.create(contact);
        }

        RequestDispatcher rd = request.getRequestDispatcher("/show?id=" + id);
        rd.forward(request, response);
    }
}
