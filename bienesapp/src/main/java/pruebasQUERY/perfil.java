package pruebasQUERY;

import org.springframework.context.support.ClassPathXmlApplicationContext;

import uce.edu.ec.app.model.Perfil;

import uce.edu.ec.app.repository.PerfilesRepository;



public class perfil {

	public static void main(String[] args) {

		ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext("root-context.xml");

		
		
		
		PerfilesRepository repo = context.getBean("perfilesRepository", PerfilesRepository.class);

		Perfil perfil = repo.findByCuenta("dscumbajin");
		System.out.println(perfil.toString());
		
		context.close();

	}

}
