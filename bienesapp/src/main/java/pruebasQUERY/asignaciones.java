package pruebasQUERY;

import org.springframework.context.support.ClassPathXmlApplicationContext;

import uce.edu.ec.app.model.Bien;
import uce.edu.ec.app.repository.BienesRepository;

public class asignaciones {

	public static void main(String[] args) {

		ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext("root-context.xml");

		BienesRepository repo = context.getBean("bienesRepository", BienesRepository.class);

		Bien bien = repo.findByAlta("0011");

		System.out.println(repo.existsById(bien.getId()));

		System.out.println(bien.toString());

		/*
		 * BienesEstacionesRepository repo =
		 * context.getBean("bienesEstacionesRepository",
		 * BienesEstacionesRepository.class);
		 * 
		 * List<Bienes_Estaciones> a = repo.findByEstacion_Id(1);
		 * 
		 * System.out.println( "Numero de registros: " +a.size());
		 * 
		 * for (Bienes_Estaciones b : a) { System.out.println("Id: "+b.getId());
		 * repo.findById(b.getId());
		 * 
		 * repo.deleteById(b.getId()); System.out.println("Se elimino"); }
		 */

		context.close();

	}

}
