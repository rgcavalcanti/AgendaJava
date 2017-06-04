<%@page import="java.util.List"%>
<%@page import="model.Contact"%>
<%@page import="DAO.ContactDAO"%>
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
            <h1 class="title">Contatos</h1>
            <table>
                <tr>
                    <th>Nome</th>
                    <th>Opções</th>
                </tr>
                <%
                    ContactDAO dao = new ContactDAO();
                    List<Contact> contacts = dao.index();

                    for (Contact c : contacts) {
                        out.print(
                                "<tr>"
                                + "<td>" + c.getName() + "</td>"
                                + "<td>"
                                + "<a class='button' href='./show?id=" + c.getId() + "'>ver</a>"
                                + "<a class='button' href='./edit?id=" + c.getId() + "'>editar</a>"
                                + "<form class='form-button' method='GET' action='ControllerAgenda'>"
                                + "<input type='hidden' name='action' value='delete'>"
                                + "<input type='hidden' name='id' value='" + c.getId() + "'>"
                                + "<button class='button' type='submit'>Apagar</button>"
                                + "</form>"
                                + "</td>"
                                + "</tr>"
                        );
                    }
                %>
            </table>
            <div class="buttonsContainer">

                <a class="button" href="./">adicionar contato</a>
            </div>
        </div>
    </body>
</html>
