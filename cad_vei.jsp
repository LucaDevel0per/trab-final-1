<%-- 
    Document   : cad_vei.jsp
    Created on : 14 de nov. de 2023, 22:33:03
    Author     : Rodrigo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="controle.cliente"%>
<%@page import="java.text.*" import="java.lang.*"%>
<%@page import="java.sql.*"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Controle de Clientes</title>        
    </head>
    <body>
        <h1>Clientes</h1>       
        <%
            // Recebendo dados
            cliente cli = new cliente();  //instância
            cli.setcodigo(Integer.parseInt(request.getParameter("codigo")));
            cli.setModelo(request.getParameter("modelo"));
            cli.setPlaca(request.getParameter("placa"));
            cli.setAno(Double.parseDouble(request.getParameter("ano")));
            cli.setCor (request.getParameter ("cor"));
            cli.setFabricante (request.getParameter ("fabricante"));
            cli.setDiaria (Float.parseFloat(request.getParameter("diaria")));
            
            
            //GRAVAR!
            try{
                Class.forName("com.mysql.jdbc.Driver"); //registra            
                Connection conexao = DriverManager.getConnection("jdbc:mysql://localhost:8080/trabalhom2", "root", ""); // abre Conn
                Statement stmt = conexao.createStatement(); //cria uma instrução
                ///          "Insert into clientes (nome, idade, renda) values('Aana', 28, 35345.75)"
                String sql = "Insert into clientes (codigo, modelo, placa, ano, cor, fabricante, diaria) values"
                + "(" + cli.getModelo() + ", " + cli.getPlaca() + ", " + cli.getAno() + ", " + cli.getCor() + ", " + cli.getFabricante() + ", " + cli.getDiaria() + ")"; //defin instr. SQL
                stmt.executeUpdate(sql); // exec. Query.
                conexao.close(); //fecha                
            }
            catch(Exception ex){
                ex.printStackTrace();
                out.println("Erro: " + ex.toString());
            }
            
            
            //Saída
            out.println("<b> Registro - Clientes </b>");
            out.println("<br> codigo " + cli.getId());
            out.println("<br> Modelo: " + cli.getModelo());
            out.println("<br> Placa " + cli.getPlaca());
            out.println("<br> Ano " + cli.getAno());
            out.println("<br> Cor " + cli.getCor());
            out.println("<br> Fabricante " + cli.getFabricante());
            out.println("<br> Diaria " + cli.getDiaria());

        %>
        
    </body>
</html>