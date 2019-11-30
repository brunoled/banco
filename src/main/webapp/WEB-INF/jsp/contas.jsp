<!DOCTYPE html>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<html lang="pt-br">
<head>

    <link rel="stylesheet" type="text/css"
          href="webjars/bootstrap/4.3.1/css/bootstrap.min.css" />
<%--    <c:url value="/css/main.css" var="jstlCss" />--%>
    <link href="${jstlCss}" rel="stylesheet" />

</head>
<body>
<div class="container">
    <header>
        <h1>Banco Aplicação</h1>
    </header>
    <div class="starter-template">
        <h1>Lista de contas</h1>
        <table
                class="table table-striped table-hover table-condensed table-bordered">
            <tr>
                <th>Id</th>
                <th>Name</th>
            </tr>
            <c:forEach var="conta" items="${contas}">
                <tr>
                    <td>${conta.id}</td>
                    <td>${conta.titular}</td>
                </tr>
            </c:forEach>
        </table>
    </div>

</div>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script type="text/javascript"
        src="webjars/bootstrap/4.3.1/js/bootstrap.min.js"></script>

</body>

</html>