<%-- 
    Document   : show
    Created on : 13/05/2017, 17:15:41
    Author     : rafael
--%>

<%@page import="DAO.ContactDAO"%>
<%@page import="model.Contact"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            Contact contact = new Contact();
            ContactDAO dao = new ContactDAO();
            contact = (Contact)dao.show(Integer.parseInt(request.getParameter("id")));
        %>
        <h1><%= contact.getName() %></h1>
        <p>Email: <%= contact.getEmail() %></p>
        <p>Telefone: <%= contact.getPhone()%></p>
        <form action="ControllerAgenda?id=<%= contact.getId() %>" method="delete">
            <input type="submit" value="apagar">
        </form>
    </body>
</html>
