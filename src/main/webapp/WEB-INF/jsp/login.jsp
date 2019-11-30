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
    <div class="jumbotron bg-light border border-secondary">
        <div class="row justify-content-center">
            <div class="card border-primary">
                <h5 class="card-title" style="text-align: center">Login</h5>
                <div class="card-body">
                    <c:if test="${param.error ne null}">
                        <div style="color: red; text-align: center">Credenciais inválidas.</div>
                    </c:if>
                    <form action="/login" method="post">
                        <div class="form-group">
                            <label for="email">
                                E-mail:
                            </label>
                            <input type="email" class="form-control" id="email" name="email">
                        </div>
                        <div class="form-group">
                            <label for="senha">
                                Senha:
                            </label>
                            <input type="password" class="form-control" id="senha" name="senha">
                        </div>
                        <div class="row justify-content-center">
                            <button type="submit" class="btn btn-success">Logar</button>
                        </div>
                        <br>
                        <hr>
                        <div class="row justify-content-center">
                            <p>Ainda não tem uma conta? <a href="/criar-conta">Clique aqui</a></p>
                        </div>

                        <input type="hidden" name="${_csrf.parameterName}"
                               value="${_csrf.token}" />
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script type="text/javascript"
        src="webjars/bootstrap/4.3.1/js/bootstrap.min.js"></script>

</body>

</html>