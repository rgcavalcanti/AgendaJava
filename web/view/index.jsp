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
                <th>Opções</th>
            </tr>
            <%
                ContactDAO dao = new ContactDAO();
                List<Contact> contacts = dao.index();
                
                for(Contact c: contacts){
                    out.print(
                     "<tr>"
                    +  "<td>" + c.getName()+ "</td>"
                    +  "<td>"
                    +    "<a href='/Agenda/show?id=" + c.getId() + "'>ver</a>"
                    +  "</td>"
                    +  "<td>"
                    +    "<form method='GET' action='ControllerAgenda'>"
                    +      "<input type='hidden' name='action' value='delete'>"
                    +      "<input type='hidden' name='id' value='" + c.getId() + "'>"
                    +      "<input type='submit' value='apagar'>"
                    +    "</form>"
                    +  "</td>"
                    +"</tr>"
                    );
                } 
            %>
            </p>
        </table>
        <a href="./">adicionar contato</a>
    </body>
</html>
