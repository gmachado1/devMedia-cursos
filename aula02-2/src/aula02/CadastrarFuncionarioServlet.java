package aula02;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class CadastrarFuncionarioServlet
 */
@WebServlet("/CadastrarFuncionario")
public class CadastrarFuncionarioServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CadastrarFuncionarioServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doService(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doService(request,response);
	}

	private void doService(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {


		String nome = request.getParameter("nome");
		String sNascimento = request.getParameter("nascimento");
		String sSalario = request.getParameter("salario");
		String sSexo = request.getParameter("sexo");
		String sTemporario = request.getParameter("temporario");
		Funcionario funcionario = null;
		if (nome==null||nome.length()==0) { mostraErro(request,response,"Preencha o nome!");}
		else if(sSalario==null||sSalario.length()==0) {mostraErro(request,response,"Preencha salário.");}
		else {
			
			DateFormat df = new SimpleDateFormat("dd/MM/yyyy");
	
			try {
				Date nascimento = df.parse(sNascimento);
				Double salario = Double.parseDouble(sSalario);
				Character sexo = sSexo.charAt(0);
				Boolean temporario = Boolean.parseBoolean(sTemporario);
				funcionario = new Funcionario(nome, nascimento, salario, sexo, temporario);
			} catch (Exception e) {
				mostraErro(request,response,"Erro no preenchimento de dados."+e.getMessage());
				throw new ServletException(e);
			}
		}
		if (funcionario!=null) {
			List<Funcionario>lista = Dados.listarFucnionarios();
			Dados.cadastrarFuncionario(funcionario);
			
			request.setAttribute("lista", lista);
			
			RequestDispatcher dispacher = request.getRequestDispatcher("listaFuncionarios.jsp");
			dispacher.forward(request, response);
			
		}
	}

	private void mostraErro(HttpServletRequest request, HttpServletResponse response, String message) 	throws ServletException, IOException {
		request.setAttribute("erro", message);
		RequestDispatcher dispacher = request.getRequestDispatcher("index.jsp");
		dispacher.forward(request, response);
		
	}
	

}
