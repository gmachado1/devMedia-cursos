package aula04;

import java.util.Date;
import util.DateUtils;
import com.opensymphony.xwork2.ActionSupport;

public class CalcularIdadeAction extends ActionSupport {
	private String nome;
	private Date dataNascimento;
	private int idade;
	
	
	
	
	
	
	@Override
	public String execute() throws Exception {
		idade = DateUtils.calculateYearsDifference(dataNascimento,new Date());
		
		return SUCCESS;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public void setDataNascimento(Date dataNascimento) {
		this.dataNascimento = dataNascimento;
	}
	public String getNome() {
		return nome;
	}
	public int getIdade() {
		return idade;
	}
	

}
