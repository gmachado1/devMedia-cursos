package aula08;

import java.util.Calendar;
import java.util.Date;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.Interceptor;

public class CumprimentoInterceptor implements Interceptor {

	@Override
	public void destroy() {
	}

	@Override
	public void init() {

	}

	@Override
	public String intercept(ActionInvocation invocation) throws Exception {
		// o que vai ser executado antes
		int hora = Calendar.getInstance().get(Calendar.HOUR_OF_DAY);
		String cumprimento = (hora < 6?" Boa manhã! ":(hora > 18)?"Boa noite!":(hora < 12)?"Bom dia":"Boa tarde");
		invocation.getInvocationContext().getSession().put("cumprimento", cumprimento);
		
		
		String result = invocation.invoke();

		return result;
	}

}
