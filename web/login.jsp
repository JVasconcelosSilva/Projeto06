<%-- 
    Document   : login
    Created on : 20/05/2019, 16:17:09
    Author     : Jefferson V.
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="WEB-INF/jspf/header.jspf"%>
<!DOCTYPE html>

<%
    String error = null;
    if (request.getParameter("formNewUser") != null) {
        long senha = request.getParameter("senha").hashCode();
        long senhad = request.getParameter("senhad").hashCode();
        String nome = request.getParameter("nome");
        int cpf = Integer.parseInt(request.getParameter("cpf"));
        String endereco = request.getParameter("endereco");
        int telefone = Integer.parseInt(request.getParameter("telefone"));
        String tipo = request.getParameter("tipo");
        String login = request.getParameter("login");
        String email = request.getParameter("email");

        if (senha == senhad) {
            try {
                Perfil.addPerfil(senha, nome, cpf, endereco, telefone, tipo, login, email);
            } catch (Exception e) {
                error = e.getMessage();
%>
<h1><%=error%></h1>
<%
    }
} else {
%>
<h1>Senhas diferentes</h1>
<%
        }
    }

%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Yunic</title>
    </head>
    <body>
        <h1>Yunic</h1>
        <% if (request.getParameter("cadastro") != null) { %>
        <div class="container">
            <div class="row">
                <div class="col-sm-8">
                    <form class="px-4 py-3" method="post">
                        <div class="form-group">
                            <h1>Cadastre-se</h1>
                            <div class="form-group">
                                <label for="exampleDropdownFormPassword1">*Nome completo</label>
                                <input type="text" class="form-control" name="nome" required>
                            </div>
                            <label for="exampleDropdownFormEmail1">*E-mail</label>
                            <input type="email" class="form-control" name="email" placeholder="email@email.com" required>
                        </div>
                        <div class="form-group">
                            <label for="exampleDropdownFormPassword1">Endereço</label>
                            <input type="text" class="form-control" name="endereco">
                        </div>
                        <div class="row">
                            <div class="col">
                                <label for="exampleDropdownFormPassword1">CPF</label>
                                <input type="number" class="form-control" name="cpf">
                            </div>
                            <div class="col">
                                <label for="exampleDropdownFormPassword1">Telefone</label>
                                <input type="number" class="form-control" name="telefone">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="exampleDropdownFormPassword1">*Nome de usuário</label>
                            <input type="text" class="form-control" id="exampleDropdownFormPassword1" name="login" required>
                        </div>
                        <div class="row">
                            <div class="col">
                                <label for="exampleDropdownFormPassword1">*Senha</label>
                                <input type="password" class="form-control" id="exampleDropdownFormPassword1" name="senha" required>
                            </div>
                            <div class="col">
                                <label for="exampleDropdownFormPassword1">*Digite a senha novamente</label>
                                <input type="password" class="form-control" id="exampleDropdownFormPassword1" name="senhad" required>
                            </div>
                        </div>
                        <br>
                        <div class="row">
                            <div class="col">    
                                <div class="form-check">
                                    <input class="form-check-input" type="radio" name="tipo" value="autor">
                                    <label class="form-check-label" for="exampleRadios1">
                                        Sou Autor
                                    </label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input" type="radio" name="tipo" value="comprador">
                                    <label class="form-check-label" for="exampleRadios2">
                                        Sou Comprador
                                    </label>
                                </div>
                            </div>
                            <div class="col">  
                                <label for="exampleDropdownFormEmail1">* Campos Obrigatórios</label>
                            </div>
                        </div>
                        <br>
                        <input type="submit" class="btn btn-primary" name="formNewUser" value="Cadastrar">
                    </form>
                    <hr>
                    <a class="dropdown-item" href="login.jsp">Já possuí cadastro? Logar</a>
                </div>
            </div>
        </div>
        <%} else {%>
        <div class="container">
            <div class="row">
                <div class="col-sm-4">
                    <form method="post">
                        <div class="form-group">
                            <h1>Login</h1>
                            <label for="exampleDropdownFormEmail1">Nome de usuário</label>
                            <input type="text" class="form-control" name="login" required>
                        </div>
                        <div class="form-group">
                            <label for="exampleDropdownFormPassword1">Senha</label>
                            <input type="password" class="form-control" name="pass" required>
                        </div>
                        <div class="form-group">

                            <div class="form-check">
                                <input type="checkbox" class="form-check-input">
                                <label class="form-check-label" for="dropdownCheck">
                                    Remember me
                                </label>
                            </div>
                        </div>
                        <input type="submit" name="formLogin" value="Entrar" class="btn btn-primary"/>
                    </form>
                    <hr>
                    <a class="dropdown-item" href="login.jsp?cadastro=1">Ainda não cadastrado? Cadastre-se aqui</a>
                </div>
            </div>
        </div>
        <%}%>


    </body>
</html>