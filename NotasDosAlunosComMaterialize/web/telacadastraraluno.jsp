<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">;
    <title>Cadastro de Alunos</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
</head>

<body>

    <div class="row">
        <form class="col s12 m6 push-m3" method="post" action="entrada?acao=incluir">
            <div class="row">
                <h3 class="light center">Cadastrar Aluno</h3>
            </div>
            <div class="row">
                <div class="input-field col s12">
                    <input id="txtnome" type="text" name="txtnome" autofocus>
                    <label for="txtnome">Nome</label>
                </div>
            </div>
            <!-- <div class="row">
                <div class="input-field col s3">
                    <input id="txtprim" type="text" name="txtprim">
                    <label for="txtprim">1º Bim</label>
                </div>
                <div class="input-field col s3">
                    <input id="txtseg" type="text" name="txtseg">
                    <label for="txtseg">2º Bim</label>
                </div>
                <div class="input-field col s3">
                    <input id="txtter" type="text" name="txtter">
                    <label for="txtter">3º Bim</label>
                </div>
                <div class="input-field col s3 container">
                    <input id="txtqua" type="text" name="txtqua">
                    <label for="txtqua">4º Bim</label>
                </div>
            </div> -->
            <div class="row">
                <div class="input-field col s3">
                    <input type="number" name="txtprim" id="txtprim" class="center numNota" value="0" min="0" max="10" step="0.5" >
                    <label for="txtprim">1º Bim</label>
                </div>
                <div class="input-field col s3">
                    <input type="number" name="txtseg" id="txtseg" class="center numNota" value="0" min="0" max="10" step="0.5" >
                    <label for="txtseg">2º Bim</label>
                </div>
                <div class="input-field col s3">
                    <input type="number" name="txtter" id="txtter" class="center numNota" value="0" min="0" max="10" step="0.5" >
                    <label for="txtter">3º Bim</label>
                </div>
                <div class="input-field col s3">
                    <input type="number" name="txtqua" id="txtqua" class="center numNota" value="0" min="0" max="10" step="0.5" >
                    <label for="txtqua">4º Bim</label>
                </div>
            </div>
            <div class="row">
                <div class="col s12 right">
                    <input type="hidden" name="txtacao" value="incluir">
                    <div class="col s12 m3 right">
                        <button class="btn waves-effect waves-light right" type="submit" name="action">Enviar</button>
                    </div>
                    <div class="col s12 m3 right">
                        <a class="waves-effect waves-light btn left" onclick="window.history.back();"><i
                                class="material-icons left">arrow_back</i>Voltar</a>
                    </div>
                </div>
            </div>
        </form>
    </div>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
    <script src="js/format.js"></script>
</body>

</html>