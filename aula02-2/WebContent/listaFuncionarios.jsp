<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page import="java.util.List"%>
<%@ page import="aula02.Funcionario"%>
<%@ page import="java.text.DateFormat"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.text.NumberFormat"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>Funcionarios Cadastrados</title>
</head>
<body>
	<h1>Funcionários Cadstrados</h1>

	<table border="1" cellpadding="3" cellspacing="0">
		<tr>
			<th>Número</th>
			<th>Nome</th>
			<th>Nascimento</th>
			<th>Salário</th>
			<th>Sexo</th>
			<th>Temporário</th>
		</tr>
<% List<Funcionario> lista = (List<Funcionario>) request.getAttribute("lista"); 
 
	DateFormat df = new SimpleDateFormat("dd/MM/yyyy");
	NumberFormat nf = NumberFormat.getCurrencyInstance();
	int num = 1;
	
	for(Funcionario f:lista){
%>

<tr>
	<td><%= num++ %></td>
	<td><%= f.getNome() %></td>
	<td><%= df.format(f.getNascimento()) %></td>
	<td><%= nf.format(f.getSalario()) %></td>
	<td><%= f.getSexo() %></td>
	<td><%= (f.isTemporario())?"Sim":"Não" %></td>
</tr>
<% } %>
	</table>
	
	<p><a href="index.jsp">Formulário de Cadastro</a></p>
</body>
</html>