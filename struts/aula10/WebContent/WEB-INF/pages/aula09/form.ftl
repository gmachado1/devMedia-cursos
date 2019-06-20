<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Validação - Formulário</title>
<style>
	span.errorMessage { color:red; }
	label.errorLabel { font-weight:bold;}

</style>
<@s.head />
</head>
<body>
	<@s.form namespace="/aula09" action="validar" method="post" validate="true" >
		<@s.textfield label="Nome" name="nome" size="40" required="true" />
		<@s.radio label="Tipo" name="tipo" list="%{{'A','B','C'}}" required="true" value="'${tipo?default('')}'" />
		<@s.textfield label="Percentual de comissão" name="percentual" size="10" required="true"  />
		<@s.textfield label="Data de Nascimento" name="dataNascimento" required="true"/>
		<@s.textfield label="Email" name="email" size="40" required="true" />
		<@s.textfield label="Página pessoal" name="paginaPessoal" size="100" />
		<@s.submit value="Cadastrar usuário"/> 
	</@s.form>
</body>
</html>