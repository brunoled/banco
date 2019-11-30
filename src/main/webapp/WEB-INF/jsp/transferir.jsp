<!DOCTYPE html>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<html lang="pt-br">
<head>
    <meta charset="utf-8">
    <link rel="stylesheet" type="text/css"
          href="/webjars/bootstrap/4.3.1/css/bootstrap.min.css" />
    <%--    <c:url value="/css/main.css" var="jstlCss" />--%>
    <link href="${jstlCss}" rel="stylesheet" />

</head>
<body>
<div class="container">
    <header>
        <h1>Banco Aplicação</h1>
    </header>
    <div class="card">
        <div class="card-header">
            Depósito
        </div>
        <div class="card-body">
            <h5 class="card-title">Bem vindo, ${conta.titular} </h5>
            <p class="card-text">Seu saldo é de: R$ ${conta.saldo}</p>
            <form:form method="POST" action="transferir" modelAttribute="movForm" class="form-signin">
                <div class="form-group">
                    <label for="valor">
                        Digite o valor a ser Transferido:
                    </label>
                    <form:input path="valor" class="form-control"></form:input>
                    <form:hidden path="idEnvio" value="${conta.id}"></form:hidden>
                </div>
                <div class="form-group">
                    <label for="valor">
                        Digite o id da conta que irá receber o valor:
                    </label>
                    <form:input path="idReceb" class="form-control"></form:input>
                </div>
                <button type="submit" class="btn btn-primary">Depositar</button>
            </form:form>
        </div>
    </div>

</div>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script type="text/javascript"
        src="/webjars/bootstrap/4.3.1/js/bootstrap.min.js"></script>

</body>

</html>

