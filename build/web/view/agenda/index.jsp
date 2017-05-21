<%-- 
    Document   : index
    Created on : 13/05/2017, 17:12:51
    Author     : rafael
--%>

<%@page import="java.util.List"%>
<%@page import="model.Contact"%>
<%@page import="DAO.ContactDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Agenda</title>
    </head>
    <body>
        <table>
            <tr>
                <th>Nome</th>
                <th>E-mail</th>
                <th>Telefone</th>
            </tr>
            <%
                ContactDAO dao = new ContactDAO();
                List<Contact> contacts = dao.index();
                
                for(Contact c: contacts){
                    out.print("<tr><td>" + c.getName()+ "</td>");
                    out.print("<td>" + c.getEmail() + "</td>");
                    out.print("<td>" + c.getPhone()+ "</td></tr>");
                } 
            %>
            </p>
        </table>
    </body>
</html>
