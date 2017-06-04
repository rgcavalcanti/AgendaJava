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
        <div class="block">
            <h1 class="title">Editar Contato</h1>
            <%
                Contact contact = new Contact();
                ContactDAO dao = new ContactDAO();
                contact = (Contact) dao.show(Integer.parseInt(request.getParameter("id")));
            %>
            <form action="ControllerAgenda" method="post">
                <input type="hidden" name="action" value="edit">
                <input type="hidden" name="id" value="<%= contact.getId()%>">
                <div class="field">
                    <input type="text" name="name" value="<%= contact.getName()%>"><br>
                </div>
                <div class="field">
                    <input type="text" name="email" value="<%= contact.getEmail()%>"><br>
                </div>
                <div class="field">
                    <input type="text" name="phone" value="<%= contact.getPhone()%>"><br>
                </div>
                <input id="submitButton" type="submit">
            </form>
            <button class="button" onclick="makeSubmit()">Salvar Alterações</button>
            <a class="button" href="./index">Cancelar</a>
        </div>
    </body>
</html>
