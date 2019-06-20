package util;

public class Funcionario {
	
	
	public static final int TIPO_DESENVOLVEDOR = 1;
	public static final int TIPO_GERENTE = 2;
	public static final int TIPO_DIRETOR =3;
	
	private String nome;
	private String login;
	private String senha;
	private int tipo;
	
	
	public Funcionario(String nome, String login, String senha, int tipo) {
		super();
		this.nome = nome;
		this.login = login;
		this.senha = senha;
		this.tipo = tipo;
	}
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
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
	public int getTipo() {
		return tipo;
	}
	public void setTipo(int tipo) {
		this.tipo = tipo;
	}

}
