<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
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
        <h1>Banco Aplicação - Criar Conta</h1>
    </header>

    <c:if test="${param.error ne null}">
        <div class="alert alert-danger" role="alert">
           E-mail já existente no banco de dados!
        </div>
    </c:if>

    <form:form method="POST" action="criar-conta" modelAttribute='contaForm' class="form-signin">

        <div class="form-group">
            <label for="titular">
                Titular da conta:
            </label>
            <form:input path="titular" class="form-control"></form:input>
        </div>
        <div class="form-group">
            <label for="agencia">
                Agência:
            </label>
            <form:input type="text" path="agencia" class="form-control"></form:input>
        </div>
        <div class="form-group">
            <label for="numero">
                Conta:
            </label>
            <form:input path="numero" class="form-control"></form:input>
        </div>
        <div class="form-group">
            <label for="email">
                Email:
            </label>
            <form:input type="email" path="email" class="form-control"></form:input>
            <c:if test="${fields.hasErrors('email')}">
                <div class="alert alert-danger" role="alert">
                    E-mail já existente no banco de dados!
                </div>
            </c:if>
        </div>
        <div class="form-group">
            <label for="endereco">
                Endereço:
            </label>
            <form:input type="text" path="endereco" class="form-control"></form:input>
        </div>
        <div class="form-group">
            <label for="senha">
                Senha:
            </label>
            <form:password path="senha" class="form-control"></form:password>
        </div>
        <button type="submit" class="btn btn-primary">Cadastrar</button>
    </form:form>
</div>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script type="text/javascript"
        src="webjars/bootstrap/4.3.1/js/bootstrap.min.js"></script>

</body>

</html>