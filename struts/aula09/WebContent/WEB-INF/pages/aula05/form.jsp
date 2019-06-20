<%@ taglib prefix="s" uri="/struts-tags" %>
<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Login - Formulário</title>
</head>
<body>
<p style="color:red"><s:property value="mensagemErro" /></p>
	<s:form namespace="/aula05" action="login" method="post">
		<s:textfield label="Login" name="login" />
		<s:password label="Senha" name="senha"  />
		<s:submit value="Login"/> 
	</s:form>
</body>
</html>