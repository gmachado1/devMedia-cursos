package aula06;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import com.opensymphony.xwork2.ActionSupport;

public class TagsAction extends ActionSupport{
	
	private String valorFixo = "Texto (caracteres HTML automaticamente convertidos: &\'<>)!";
	
	private List<String> lista = new ArrayList<String>();
	
	private Map<Integer,String> map = new TreeMap<Integer,String>();
	
	private Integer valorInt = 100;
	
	private Float valorFloat = 1.25f;
	
	private Boolean valorBoolean = true;
	
	private Date valorDate = new Date();
	
	private Character[] valorArray = new Character[] {'W','e','b','W','o','r','k'};
	
	public TagsAction() {
		//popula lista
		lista.add("Primeiro item");
		lista.add("Segundo item");
		lista.add("Terceiro item");
		lista.add("Quarto item");
		lista.add("Quinto item");
		
		//popula MAP
		map.put(1,"Item com id 01");
		map.put(2,"Item com id 02");
		map.put(3,"Item com id 03");
		map.put(4,"Item com id 04");
	}

	public String getValorFixo() {
		return valorFixo;
	}

	public void setValorFixo(String valorFixo) {
		this.valorFixo = valorFixo;
	}

	public List<String> getLista() {
		return lista;
	}

	public void setLista(List<String> lista) {
		this.lista = lista;
	}

	public Map<Integer, String> getMap() {
		return map;
	}

	public void setMap(Map<Integer, String> map) {
		this.map = map;
	}

	public Integer getValorInt() {
		return valorInt;
	}

	public void setValorInt(Integer valorInt) {
		this.valorInt = valorInt;
	}

	public Float getValorFloat() {
		return valorFloat;
	}

	public void setValorFloat(Float valorFloat) {
		this.valorFloat = valorFloat;
	}

	public Boolean getValorBoolean() {
		return valorBoolean;
	}

	public void setValorBoolean(Boolean valorBoolean) {
		this.valorBoolean = valorBoolean;
	}

	public Date getValorDate() {
		return valorDate;
	}

	public void setValorDate(Date valorDate) {
		this.valorDate = valorDate;
	}

	public Character[] getValorArray() {
		return valorArray;
	}

	public void setValorArray(Character[] valorArray) {
		this.valorArray = valorArray;
	}
	
	
}
