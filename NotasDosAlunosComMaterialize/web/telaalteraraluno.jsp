<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <title>Cadastro de Alunos</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
    </head>
    <body>
        <div class="row">
            <form class="col s12 m6 push-m3" method="post" action="entrada?acao=alterar">
                <div class="row">
                    <h3 class="light center">Alterar Aluno</h3>
                </div>
                <div class="row">
                    <div class="input-field col s2">
                        <input id="txtcodigo" type="text" name="txtcodigo" value="${aluno.codigo}" readonly>
                        <label for="txtcodigo">Código</label>
                    </div>
                    <div class="input-field col s10">
                        <input id="txtnome" type="text" name="txtnome" value="${aluno.nome}">
                        <label for="txtnome">Nome</label>
                    </div>
                </div>
                <div class="row">
                    <div class="input-field col s3">
                        <input id="txtprim" type="text" name="txtprim" value="${aluno.prim}">
                        <label for="txtprim">1º Bim</label>
                    </div>
                    <div class="input-field col s3">
                        <input id="txtseg" type="text" name="txtseg" value="${aluno.seg}">
                        <label for="txtseg">2º Bim</label>
                    </div>
                    <div class="input-field col s3">
                        <input id="txtter" type="text" name="txtter" value="${aluno.ter}">
                        <label for="txtter">3º Bim</label>
                    </div>
                    <div class="input-field col s3">
                        <input id="txtqua" type="text" name="txtqua" value="${aluno.qua}">
                        <label for="txtqua">4º Bim</label>
                    </div>
                </div>
                <div class="row">
                    <div class="col s12 right">
                        <input type="hidden" name="txtacao" value="alterar">
                        <div class="col s3 right">
                            <button class="btn waves-effect waves-light right" type="submit" name="action">Alterar</button>
                        </div>
                        <div class="col s3 right">
                            <a class="waves-effect waves-light btn left" onclick="window.history.back();"><i class="material-icons left">arrow_back</i>Voltar</a>
                        </div>                        
                    </div>
                </div>
            </form>
        </div>

        <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
    </body>
