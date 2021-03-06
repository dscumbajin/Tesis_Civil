package pruebasQUERY;

import org.springframework.context.support.ClassPathXmlApplicationContext;

import uce.edu.ec.app.model.Usuario;
import uce.edu.ec.app.repository.UsuariosRepository;

public class usuario {

	public static void main(String[] args) {

		ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext("root-context.xml");

		UsuariosRepository repo = context.getBean("usuariosRepository", UsuariosRepository.class);

		Usuario user = repo.findByCuenta("dscumbajin");
		System.out.println(user.toString());

		System.out.println(repo.existsByCuentaAndEmail("dscumbajin", "dscumbajin@uce.edu.ec"));
		
		context.close();

	}

}
