<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Cálculo da idade - Formulário</title>
</head>
<body>
	<p>${instrucoes?capitalize}</p>
	<@s.form namespace="/aula07" action="calcularIdade" method="post">
		<@s.textfield label="Nome" name="nome" />
		<@s.textfield label="Data de Nascimento" name="dataNascimento" />
		<@s.submit value="Calcular Idade"/> 
	</@s.form>
</body>
</html>