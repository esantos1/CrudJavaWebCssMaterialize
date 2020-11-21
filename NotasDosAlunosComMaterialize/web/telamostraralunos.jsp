<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">;
    <title>Mostrando todos os alunos</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
</head>

<body>
    <div class="fixed-action-btn">
        <a href="entrada?acao=incluir"
            class="waves-effect waves-light btn-floating btn-large tooltipped" data-position="left"
            data-tooltip="Cadastrar Aluno">
            <i class="material-icons large">add</i>
        </a>
    </div>
    <div class="row">
        <div class="col s12">
            <h3 class="light center">Lista de Alunos</h3>
            <table class="highlight centered responsive-table container">
                <thead>
                    <tr>
                        <th>Código</th>
                        <th>Nome</th>
                        <th>1º Bimestre</th>
                        <th>2º Bimestre</th>
                        <th>3º Bimestre</th>
                        <th>4º Bimestre</th>
                        <th>Média</th>
                        <th>Status</th>
                        <th colspan="2"></th>
                    </tr>
                </thead>

                <tbody>
                    <c:forEach var="aluno" items="${alunos}">
                        <tr>
                            <td>${aluno.codigo}</td>
                            <td>${aluno.nome}</td>
                            <td>${aluno.prim}</td>
                            <td>${aluno.seg}</td>
                            <td>${aluno.ter}</td>
                            <td>${aluno.qua}</td>
                            <td>${aluno.media}</td>
                            <td>${aluno.status}</td>
                            <td><a class="btn-floating waves-effect waves-light green"
                                    href="entrada?acao=alterar&codigo=${aluno.codigo}"><i
                                        class="material-icons">edit</i></a></td>
                            <td><a class="btn-floating waves-effect waves-light red modal-trigger" href="#modal${aluno.codigo}"><i
                                        class="material-icons">delete</i></a></td>

                            <div id="modal${aluno.codigo}" class="modal">
                                <div class="modal-content">
                                    <h4>Opa!</h4>
                                    <p>Tem certeza que deseja excluir esse(a) aluno(a)?</p>
                                </div>
                                <div class="modal-footer">
                                    <a href="entrada?acao=excluir&codigo=${aluno.codigo}" name="btnDeletar"
                                        class="btn-flat waves-effect waves-light red white-text">Sim, quero deletar</a>
                                    <a class="modal-close waves-effect waves-green btn-flat">Cancelar</a>
                                    </form>
                                </div>
                            </div>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>

        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.js"
        integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
    <script>
        $(document).ready(function () {
            $('.modal').modal();
            $('.fixed-action-btn').floatingActionButton();
            $('.tooltipped').tooltip();
        });
    </script>
</body>

</html>