package br.com.turma.controller;

import br.com.turma.bean.Aluno;
import br.com.turma.dao.AlunoDao;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "EntradaServlet", urlPatterns = {"/entrada"})
public class EntradaServlet extends HttpServlet {

    //a título de comparação, o método doGet() equivale ao $_GET["var"] do PHP
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String acao = request.getParameter("acao");

        if (acao.equals("mostrar")) {
            AlunoDao dao = new AlunoDao();
            ArrayList<Aluno> alunos = dao.mostrarTodos();

            request.setAttribute("alunos", alunos);

            RequestDispatcher rd = request.getRequestDispatcher("/telamostraralunos.jsp");
            rd.forward(request, response);
        } else if (acao.equals("incluir")) {
            RequestDispatcher rd = request.getRequestDispatcher("/telacadastraraluno.jsp");
            rd.forward(request, response);
        } else if (acao.equals("excluir")) {
            int codigo = Integer.parseInt(request.getParameter("codigo"));

            AlunoDao dao = new AlunoDao();
            dao.excluirPorCodigo(codigo);

            response.sendRedirect("http://localhost:8180/NotasDosAlunosComMaterialize/entrada?acao=mostrar");
        } else if (acao.equals("alterar")) {
            int codigo = Integer.parseInt(request.getParameter("codigo"));

            AlunoDao dao = new AlunoDao();
            Aluno aluno = dao.mostraPorCodigo(codigo);

            request.setAttribute("aluno", aluno);
            RequestDispatcher rd = request.getRequestDispatcher("/telaalteraraluno.jsp");
            rd.forward(request, response);
        }
    }

    //a título de comparação, o método doPost() equivale ao $_POST["var"] do PHP
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String acao = request.getParameter("txtacao");

        String nome = request.getParameter("txtnome");
        double prim = Double.parseDouble(request.getParameter("txtprim"));
        double seg = Double.parseDouble(request.getParameter("txtseg"));
        double ter = Double.parseDouble(request.getParameter("txtter"));
        double qua = Double.parseDouble(request.getParameter("txtqua"));

        Aluno aluno = new Aluno(nome, prim, seg, ter, qua);
        AlunoDao dao = new AlunoDao();

        if (acao.equals("incluir")) {
            dao.cadastrar(aluno);
            response.sendRedirect("http://localhost:8180/NotasDosAlunosComMaterialize/entrada?acao=mostrar");
        }

       if(acao.equals("alterar")){
           aluno.setCodigo(Integer.parseInt(request.getParameter("txtcodigo")));
           dao.alterarPorCodigo(aluno);
           response.sendRedirect("http://localhost:8180/NotasDosAlunosComMaterialize/entrada?acao=mostrar");
       }
    }
}
