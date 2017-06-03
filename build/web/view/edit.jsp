<%-- 
    Document   : edit
    Created on : 03/06/2017, 14:35:34
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
        <h1>Editar</h1>
        <form action="ControllerAgenda" method="post">
            <input type="hidden" name="action" value="edit">
            <input type="hidden" name="id" value="<%= contact.getId() %>">
            <input type="text" name="name" value="<%= contact.getName() %>"><br>
            <input type="text" name="email" value="<%= contact.getEmail()%>"><br>
            <input type="text" name="phone" value="<%= contact.getPhone()%>"><br>
            <input type="submit" value="Salvar alterações">
        </form>
    </body>
</html>
