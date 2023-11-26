<%-- 
    Document   : cons_vei_lista.jsp
    Created on : 18 de nov. de 2023, 14:23:58
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
        
        <style>
            table {
                border-collapse: collapse;
                width: 100%;
            }
            th, td{
                padding: 6px;
                text-align: left;
                border: 1px solid #DDD;
            }
            tr:hover {background-color: #D6EEEE }
        </style>
        
    </head>
    <body>
        <h1>Clientes</h1>
        <%
            // Recebendo dados
            
            String codigo = request.getParameter("codigo");                      
            
            //Consultar
            try{
                Class.forName("com.mysql.jdbc.Driver"); //registra            
                Connection conexao = DriverManager.getConnection("jdbc:mysql://localhost:8080/trabalhom2", "root", ""); // abre Conn
                Statement stmt = conexao.createStatement(); //cria uma instrução
                ///          SELECT * FROM clientes WHERE id = 3;
                //String sql = "SELECT * FROM clientes WHERE id = " + id; //defin instr. SQL
                String sql = "SELECT * FROM clientes " ; //defin instr. SQL
                ResultSet rs = stmt.executeQuery(sql); // exec. Query.
        %>
        <table style="width:100%"; border="1">
            <tr bgcolor="F5F5F5">
                <th> #</th>
                <th> codigo</th>
                <th> modelo</th>
                <th> placa</th>
                <th> cor</th>
                <th> ano</th>
                <th> fabricante</th>
                <th> diaria</th>
            </tr>
        
        
        <%    
                //Saída
                while (rs.next()){
        %>
            <tr>
                <td><%= rs.getRow() %></td>
                <td><%= rs.getString("codigo") %></td>
                <td><%= rs.getString("modelo") %></td>
                <td><%= rs.getString("placa") %></td>
                <td><%= rs.getString("cor") %></td>
                <td><%= rs.getString("ano") %></td>
                <td><%= rs.getString("fabricante") %></td>
                <td><%= rs.getString("diaria") %></td>
            </tr> 
                    
        <%
                }             
        %>   
        </table>
        <%
                conexao.close(); //fecha                
            }
            catch(Exception ex){
                ex.printStackTrace();
                out.println("Erro: " + ex.toString());
            }                 
        %>
    </body>
</html>

