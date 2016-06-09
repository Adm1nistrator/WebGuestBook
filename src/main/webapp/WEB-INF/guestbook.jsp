<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<%--<jsp:useBean id="GuestBook" class="GuestBook" scope="request"/>
<jsp:useBean id="Record" class="Record" scope="request"/>--%>
<%--
  Created by IntelliJ IDEA.
  User: Adm1n
  Date: 08.06.2016
  Time: 23:12
  To change this template use File | Settings | File Templates.
--%>

<!DOCTYPE html>

<html lang="en">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Гостевая книга</title>

    <!--Import Google Icon Font-->
    <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <!--Import materialize.css-->
    <link type="text/css" rel="stylesheet" href=".././css/materialize.min.css" media="screen,projection"/>

    <!--Let browser know website is optimized for mobile-->
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>

    <!--Import jQuery before materialize.js-->
    <script type="text/javascript" src=".././js/jquery-2.2.0.min.js"></script>
    <script type="text/javascript" src=".././js/materialize.min.js"></script>
    <script type="text/javascript" src=".././js/jquery.maskedinput.js"></script>
</head>
<%--<body bgcolor="#FFFFCC">--%>

<Body>

<div class="container">
    <h2>Гостевая книга</h2>

    <form class="form-inline" method="POST" action="/guestbook">

        <div class="row">
            <div class="input-field col s6">
                <%--<label for="first_name">Оставьте свой комментарий</label>
                <input type="text" name="textfield" class="form-control" id="first_name" placeholder="Введите текст">
--%>
                <div class="input-field col s12">
                    <textarea id="textarea1" name="textfield" class="materialize-textarea" length="120"></textarea>
                    <label for="textarea1">Оставьте свой комментарий</label>
                </div>
            </div>
            <button class="btn waves-effect waves-light" type="submit" name="action">Отправить
                <i class="material-icons right">send</i>
            </button>
        </div>


    </form>

    <hr>
    <ul>
        <%
            List listMessage = (List) request.getAttribute("ListRecords");

            for (int i = listMessage.size() - 1; i >= 0; i--) {
                out.println("<li>" + listMessage.get(i) + "</li>");

            }
        %>
    </ul>
    <hr>

</div>
</body>


<%--Using JSTL forEach and out to loop a list and display items in table--%>
<table>
    <tbody>
    <tr><th>ID</th><th>Name</th><th>Date</th></tr>
    <c:forEach items="${requestScope.ListRecords}" var="record">
        <tr><td><c:out value="${record.id}"></c:out></td>
            <td><c:out value="${record.msg}"></c:out></td>
            <td><c:out value="${record.postTime}"></c:out></td></tr>
    </c:forEach>
    </tbody>
</table>




</html>