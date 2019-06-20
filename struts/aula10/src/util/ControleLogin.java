package util;

import java.util.HashMap;
import java.util.Map;

public class ControleLogin {

	private static Map<String, Funcionario> funcionarios = new HashMap<String, Funcionario>();

	static {
		Funcionario f = new Funcionario("Gustavo Lima", "gustavo", "lima", Funcionario.TIPO_GERENTE);
		funcionarios.put(f.getLogin(), f);
		
		f = new Funcionario("James Bond", "james", "bond", Funcionario.TIPO_DIRETOR);
		funcionarios.put(f.getLogin(), f);
		
		f = new Funcionario("Incrivel Hulk", "incrivel", "hulk", Funcionario.TIPO_DESENVOLVEDOR);
		funcionarios.put(f.getLogin(), f);
	}
	
	public static Funcionario recuperarPorLogin(String login) {
		return funcionarios.get(login);
	}
}
