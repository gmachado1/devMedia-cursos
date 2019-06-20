<%@ taglib prefix="s" uri="/struts-tags" %>
<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Exemplos de tags do Struts 2</title>
</head>
<body>
	<s:form action="">
		<s:label label="Um label" name="testeLabel" value="%{valorFixo}" />
		<s:textfield label="Um text Field" name="testeTextfield" value="%{valorFixo}" size="50"/>
		<s:textfield label="Um text Field obrigatório" name="testeTextfieldObr" value="%{valorFixo}" size="30" required="true" />
		<s:file label="Um campo file" name="testeFile" size="30"/>
		<s:password label="Um password" name="testePassword" size="30"/>
		<s:checkbox label="Um checkBox" name="testeCheckBox" fieldValue="valor" />
		<s:checkboxlist label="várias checkbox" name="testeCheckboxList" list="%{map}" listKey="key" listValue="value" />
		<s:radio label="Radio Buttons" name="testeRadio" value="1" list="%{map}" listKey="key" listValue="value" />
		<s:select label="Um Select (lista)" name="testeSelect01" list="%{lista}" size="'8'" /> 
		<s:select label="Um Select (dropdown)"  name="testeSelect02" list="%{lista}" emptyOption="true"/>
		<s:textarea rows="10" cols="30" label="Uma Text Area" name="testeTextArea" value="%{valorFixo}" />
		<s:hidden name="testeHidden" value="%{valorFixo" />
		<s:submit value="Enviar!" />
	</s:form>
	Componente personalizado abaixo: 
	<s:component template="data.ftl" theme="meutema" >
		<s:param name="name" value="'dataNascimento'" />
		<s:param name="label" value="'Data de Nascimento '"/>
	</s:component>
	<br>
	Valor de uma propriedade que se pega no controller abaixo:
	<ul>
		<li><s:property value="valorInt"/></li>
		<li><s:property value="valorFloat"/></li> 
		<li><s:property value="valorBoolean"/></li> 
		<li><s:property value="valorDate"/></li> 
		<li><s:property value="valorArray"/></li> 
		<li><s:property value="valorArray[0]"/></li>
		<li><s:property value="valorArray[1]"/></li>
		<li><s:property value="valorArray[2]"/></li>
		<li><s:property value="valorArray[3]"/></li>
		<li><s:property value="valorArray[4]"/></li>
		<li><s:property value="valorArray[5]"/></li>
		<li><s:property value="valorArray[6]"/></li>
		<li><s:property value="valorArray[7]"/></li>
	</ul>
	
	<s:set name="varTeste" value="'Gustavo Lima e vc chererê chê chê'" />
	<s:property value="#varTeste"/>	
	<br>
	<s:url id="urlLogin" namespace="/aula05" action="login">
		<s:param name="login">gustavo</s:param>
		<s:param name="senha">lima</s:param>
		<s:param name="i" value="valorInt"/>
	</s:url>
	<p>
		<s:a href="%{urlLogin}"><s:property value="urlLogin" /></s:a> 
	</p>
	<br>
	usando TagAction classe java
	<br>
	<s:action name="sub" id="sub">
		<s:param name="valor" value="100"/>
	</s:action>
	<p>O dobro de 100 é : <s:property value="%{#sub.valor}"/></p>
	<br>
	<s:bean name="org.apache.struts2.util.Counter" id="count">
		<s:param name="first" value="1"/>
		<s:param name="last" value="107" />
		<s:select name="lista" list="%{#count}" theme="simple" />
	</s:bean>
	<br>
	<p> Include: &quot;<s:include value="paginaInclude.html" />&quot;</p>
	<br>
	fazendo else 
	<br><s:if test="valorInt > 0"> valorInt é positivo</s:if>
	<s:elseif test="valorInt < 0">valorInt é negativo</s:elseif>
	<s:else> valorInt é zero</s:else>
	
	<p>Itens em lista:<br />
		<s:iterator value="%{lista}">
		. <s:property /><br/>
		</s:iterator>
	</p>
</body>
</html>