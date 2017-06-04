<%@page import="DAO.ContactDAO"%>
<%@page import="model.Contact"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Agenda</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="./css/app.css" rel="stylesheet" type="text/css"/>
        <script src="./js/app.js" type="text/javascript"></script>
    </head>
    <body>
        <%
            Contact contact = new Contact();
            ContactDAO dao = new ContactDAO();
            contact = (Contact) dao.show(Integer.parseInt(request.getParameter("id")));
        %>
        <div class="block">
            <h1 class="title"><%= contact.getName()%></h1>
            <p>Email: <%= contact.getEmail()%></p>
            <p>Telefone: <%= contact.getPhone()%></p>
            <div class="buttonsContainer">
                <a class="button" href="./index">ver todos</a>
                <a class="button" href="./edit?id=<%= contact.getId()%>">editar</a>
                <form class="form-button" action="ControllerAgenda" method="GET">
                    <input type="hidden" name="id" value="<%= contact.getId()%>">
                    <input id="submitButton" type="submit">
                </form>
                <button class="button" onclick="makeSubmit()">Apagar</button>
            </div>
        </div>
    </body>
</html>
