package pruebasQUERY;

import org.springframework.context.support.ClassPathXmlApplicationContext;

import uce.edu.ec.app.repository.EstacionesRepository;

public class lugar {

	public static void main(String[] args) {

		ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext("root-context.xml");

		EstacionesRepository repo = context.getBean("estacionesRepository", EstacionesRepository.class);

		boolean r=repo.existsByUbicacionAndLugar("Laboratorios Civil", "Sala A");
		System.out.println(r);
		
		context.close();

	}

}
