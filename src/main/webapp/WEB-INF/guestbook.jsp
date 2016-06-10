<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

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

<Body>

<div class="container">
    <h2>Гостевая книга</h2>

    <form class="form-inline" method="POST" action="/guestbook">

        <div class="row">
            <div class="input-field col s6">

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

    <table>
        <tbody>
        <tr>
            <th>№</th>
            <th>Текст сообщения</th>
            <th>Добавленно</th>
        </tr>
        <%--Using JSTL forEach and out to loop a list and display items in table--%>
        <c:forEach items="${requestScope.ListRecords}" var="record">
            <tr>
                <td><c:out value="${record.id}"></c:out></td>
                <td><c:out value="${record.msg}"></c:out></td>
                <td><c:out value="${record.postTime}"></c:out></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>


</div>
</body>
</html>