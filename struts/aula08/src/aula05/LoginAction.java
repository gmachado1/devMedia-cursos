package aula05;

import java.util.Date;

import com.opensymphony.xwork2.ActionSupport;

import util.ControleLogin;
import util.DateUtils;
import util.Funcionario;

public class LoginAction extends ActionSupport {

	private String login;
	private String senha;
	private Funcionario funcionario;
	private String mensagemErro;
	
	@Override
	public String execute() throws Exception {
		String toReturn = ERROR;
		funcionario= ControleLogin.recuperarPorLogin(login);
		if (funcionario==null) {
			mensagemErro = "Login inválido!";
			return INPUT;
		}
		if (!funcionario.getSenha().equals(senha)) {
			mensagemErro = "Senha inválido!";
			return INPUT;
		}
		
		
		switch (funcionario.getTipo()) {
		case Funcionario.TIPO_DESENVOLVEDOR: {
			toReturn = "desenvolvedor";
			break;
		}
		case Funcionario.TIPO_GERENTE: {
			toReturn = "gerente";
			break;
		}
		case Funcionario.TIPO_DIRETOR: {
			toReturn = "diretor";
			break;
		}
		}

		return toReturn;
	}

	public String getLogin() {
		return login;
	}

	public void setLogin(String login) {
		this.login = login;
	}

	public String getSenha() {
		return senha;
	}

	public void setSenha(String senha) {
		this.senha = senha;
	}

	public Funcionario getFuncionario() {
		return funcionario;
	}

	public void setFuncionario(Funcionario funcionario) {
		this.funcionario = funcionario;
	}

	public String getMensagemErro() {
		return mensagemErro;
	}

	public void setMensagemErro(String mensagemErro) {
		this.mensagemErro = mensagemErro;
	}

}
