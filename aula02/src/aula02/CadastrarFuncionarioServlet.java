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
		
			
			DateFormat df = new SimpleDateFormat("dd/MM/yyyy");
	
			try {
				Date nascimento = df.parse(sNascimento);
				Double salario = Double.parseDouble(sSalario);
				Character sexo = sSexo.charAt(0);
				Boolean temporario = Boolean.parseBoolean(sTemporario);
				funcionario = new Funcionario(nome, nascimento, salario, sexo, temporario);
			} catch (Exception e) {
				throw new ServletException(e);
			}
		if (funcionario!=null) {
			List<Funcionario>lista = Dados.listarFucnionarios();
			Dados.cadastrarFuncionario(funcionario);
			
			response.setContentType("text/html");
			PrintWriter out = response.getWriter();
			out.write("<html><head><title>Funcionarios Cadastrados</title></head><body>");
			out.write("<h1>Funcionarios cadastrados</h1><ol>");
			

			for (Funcionario f:lista) 
				out.write("<li><p>"+f.getNome()+"</p></li>");
			out.write("</ol>");
			out.write("<p><hr/></p><p><a href='index.html'>Formulario de cadastro</a></p></body></html>");
			out.close();
		}
	}
	

}
