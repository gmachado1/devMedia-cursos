package aula02;

import java.util.ArrayList;
import java.util.List;

public class Dados {

	private static List<Funcionario> funcionarios = new ArrayList<Funcionario>();
	
	public static void cadastrarFuncionario(Funcionario funcionario) {
		funcionarios.add(funcionario);
		
	}
	
	public static List<Funcionario>  listarFucnionarios() {
		return funcionarios;
	}
}