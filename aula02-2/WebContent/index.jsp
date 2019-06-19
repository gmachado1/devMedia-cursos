<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>Cadastro de Funcionários</title>
</head>
<body>
	<h1>Cadastro de Funcionários</h1>
	<%
		String erro = (String) request.getAttribute("erro");
		if (erro != null && erro.length() > 0) {
	%>
	<p align="center" style="color:red" ><%=erro %></p>

	<%
		}
	%>
	<form name="frmCadastro" method="pos" action="CadastrarFuncionario">
		<p>
			Nome :<input type="text" name="nome" size="30" />
		</p>
		<p>
			Nascimento :<input type="text" name="nascimento" size="15" />dd/mm/aaaa
		</p>
		<p>
			Salário : R$<input type="text" name="salario" size="15" />
		</p>
		<p>
			Sexo : <input type="radio" value="M" name="sexo" />Masculino<input
				type="radio" name="sexo" value="F" />Feminino
		</p>
		<p>
			Temporário : <input type="checkbox" value="true" name="temporario" />
		</p>
		<p>
			<input type="submit" value="Cadastrar"></input>
		</p>

	</form>

</body>
</html>