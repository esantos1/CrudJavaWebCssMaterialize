package br.com.turma.dao;

import br.com.turma.bean.Aluno;
import br.com.turma.connection.ConnectionFactory;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.Locale;

public class AlunoDao {
    public void cadastrar(Aluno aluno){
        Connection con = null;
        PreparedStatement ps = null;
        try {
            // 1º) pegar conexao com o banco de dados
            con = ConnectionFactory.getConnection();
            
            // 2º) definir o comando que será executado no banco de dados
            String sql = "INSERT INTO aluno(nome, prim, seg, ter, qua, media, status_final) values(?,?,?,?,?,?,?)";
            
            // 3º) preparar a linha de instrução (Statament)
            ps = con.prepareStatement(sql);
            ps.setString(1, aluno.getNome());
            ps.setDouble(2, aluno.getPrim());
            ps.setDouble(3, aluno.getSeg());
            ps.setDouble(4, aluno.getTer());
            ps.setDouble(5, aluno.getQua());
            ps.setDouble(6, aluno.getMedia());
            ps.setString(7, aluno.getStatus());
            
            // 4º) executar no banco de dados
            ps.execute();
        } catch (SQLException ex) {
            System.err.println("Não foi possível cadastrar o aluno");
            ex.printStackTrace();
        }
        finally{
            ConnectionFactory.closeConnection(con, ps);
        }
    }
    
    public ArrayList<Aluno> mostrarTodos(){
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        ArrayList<Aluno> alunos = new ArrayList<>();
        
        try{
            con = ConnectionFactory.getConnection();
            
            ps = con.prepareStatement("SELECT * FROM aluno");
            rs = ps.executeQuery();
            
            while(rs.next()){
                
                
                Aluno a = new Aluno();
                a.setCodigo(rs.getInt("codigo"));
                a.setNome(rs.getString("nome"));
                a.setPrim(rs.getDouble("prim"));
                a.setSeg(rs.getDouble("seg"));
                a.setTer(rs.getDouble("ter"));
                a.setQua(rs.getDouble("qua"));
                a.setMedia(rs.getDouble("media"));
                a.setStatus(rs.getString("status_final"));
                alunos.add(a);
            }
        } catch(SQLException e){
            e.printStackTrace();
        } finally{
            ConnectionFactory.closeConnection(con, ps, rs);
        }
        
        return alunos;
    }
    
    public Aluno mostraPorCodigo(int codigo){
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        Aluno aluno = null;
        
        try {
            con = ConnectionFactory.getConnection();
            ps = con.prepareStatement("SELECT * FROM aluno WHERE codigo = ?");
            ps.setInt(1, codigo);
            rs = ps.executeQuery();
            
            if(rs.next()){
                aluno = new Aluno();
                aluno.setCodigo(rs.getInt("codigo"));
                aluno.setNome(rs.getString("nome"));
                aluno.setPrim(rs.getDouble("prim"));
                aluno.setSeg(rs.getDouble("seg"));
                aluno.setTer(rs.getDouble("ter"));
                aluno.setQua(rs.getDouble("qua"));
                aluno.setMedia(rs.getDouble("media"));
                aluno.setStatus(rs.getString("status_final"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally{
            ConnectionFactory.closeConnection(con, ps, rs);
        }
        return aluno;
    }
    
    public void excluirPorCodigo(int codigo){
        Connection con = null;
        PreparedStatement ps = null;
        
        try{
            con = ConnectionFactory.getConnection();
            ps = con.prepareStatement("DELETE FROM aluno WHERE codigo = ?");
            ps.setInt(1, codigo);
            
            ps.execute();
            ps.close();
        } catch(SQLException e){
            e.printStackTrace();
        } finally{
            ConnectionFactory.closeConnection(con, ps);
        }
    }
    
    public void alterarPorCodigo(Aluno aluno){
        Connection con = null;
        PreparedStatement ps = null;
        
        try{
            con = ConnectionFactory.getConnection();
            
            ps = con.prepareStatement("UPDATE aluno SET nome = ?, prim = ?, seg = ?, ter = ?, qua = ?, media = ?, status_final = ? WHERE codigo = ?");
            ps.setString(1, aluno.getNome());
            ps.setDouble(2, aluno.getPrim());
            ps.setDouble(3, aluno.getSeg());
            ps.setDouble(4, aluno.getTer());
            ps.setDouble(5, aluno.getQua());
            ps.setDouble(6, aluno.getMedia());
            ps.setString(7, aluno.getStatus());
            ps.setInt(8, aluno.getCodigo());
            
            ps.execute();
            ps.close();
        } catch(SQLException e){
            System.err.println("Erro ao alterar o aluno!");
            e.printStackTrace();
        } finally{
            ConnectionFactory.closeConnection(con, ps);
        }
    }
}