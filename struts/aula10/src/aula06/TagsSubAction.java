package aula06;

import com.opensymphony.xwork2.ActionSupport;

public class TagsSubAction extends ActionSupport {
	private int valor;

	public int getValor() {
		return valor;
	}

	public void setValor(int valor) {
		this.valor = valor;
	}

	public String execute() throws Exception {
		valor *= 2;
		return SUCCESS;
	}

}
