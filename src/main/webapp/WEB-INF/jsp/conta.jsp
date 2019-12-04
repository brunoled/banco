<!DOCTYPE html>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<html lang="pt-br">
<head>
    <meta charset="utf-8">
    <link rel="stylesheet" type="text/css"
          href="webjars/bootstrap/4.3.1/css/bootstrap.min.css" />
    <%--    <c:url value="/css/main.css" var="jstlCss" />--%>
    <link href="${jstlCss}" rel="stylesheet" />

</head>
<body>
<div class="container">
    <header>
        <h1 style="text-align: center">Banco Aplicação</h1>
    </header>
    <div class="card">
        <div class="card-header">
            Agência: ${conta.agencia} - Conta: ${conta.numero}
        </div>
        <div class="card-body">
            <h5 class="card-title">Bem vindo, ${conta.titular} </h5>
            <p class="card-text">Seu saldo é de: R$ ${conta.saldo}</p>
            <a href="/conta/depositar" class="btn btn-primary">Depositar</a>
            <a href="/conta/sacar" class="btn btn-primary">Sacar</a>
            <a href="/conta/transferir" class="btn btn-primary">Transferir</a>
            <a href="/logout" class="btn btn-danger">Logout</a>
        </div>
    </div>
    <br>
    <br>

    <hr>

    <h1 style="text-align: center">Extrato da conta</h1>
    <table
            class="table table-striped table-hover table-condensed table-bordered">
        <tr>
            <th>Descrição</th>
            <th>Tipo de Movimentação</th>
            <th>Valor</th>
            <th>Data</th>
        </tr>
        <c:forEach var="movimentacao" items="${movimentacao}">
            <tr>
                <td>${movimentacao.descricao}</td>
                <td>${movimentacao.tipoMovimentacao}</td>
                <td>R$ ${movimentacao.valor}</td>
                <td>
                    <fmt:formatDate value="${movimentacao.data.time}" type="date" var="data" pattern="dd/MM/yyyy" />
                    ${data}
                </td>
            </tr>
        </c:forEach>
    </table>


</div>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script type="text/javascript"
        src="webjars/bootstrap/4.3.1/js/bootstrap.min.js"></script>

</body>

</html>
