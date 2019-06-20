package aula09;

import java.util.Date;

import com.opensymphony.xwork2.ActionSupport;

public class ValidarAction extends ActionSupport {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String nome;
	private String tipo;
	private Integer percentual;
	private Date dataNascimento;
	private Date agora = new Date(System.currentTimeMillis());
	private String email;
	private String paginaPessoal;

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getTipo() {
		return tipo;
	}

	public void setTipo(String tipo) {
		this.tipo = tipo;
	}

	public Integer getPercentual() {
		return percentual;
	}

	public void setPercentual(Integer percentual) {
		this.percentual = percentual;
	}

	public Date getDataNascimento() {
		return dataNascimento;
	}

	public void setDataNascimento(Date dataNascimento) {
		this.dataNascimento = dataNascimento;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPaginaPessoal() {
		return paginaPessoal;
	}

	public void setPaginaPessoal(String paginaPessoal) {
		this.paginaPessoal = paginaPessoal;
	}

	public Date getAgora() {
		return agora;
	}

	public void setAgora(Date agora) {
		this.agora = agora;
	}

}
