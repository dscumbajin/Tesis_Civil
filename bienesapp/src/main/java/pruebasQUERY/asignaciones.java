package pruebasQUERY;

import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;

import uce.edu.ec.app.model.Bienes_Estaciones;
import uce.edu.ec.app.repository.BienesEstacionesRepository;


public class asignaciones {

	public static void main(String[] args) {

		ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext("root-context.xml");

		BienesEstacionesRepository repo = context.getBean("bienesEstacionesRepository",BienesEstacionesRepository.class);

		PageRequest pageRequest = PageRequest.of(0,10);
		Page<Bienes_Estaciones> lista = repo.findByIdEstacion(45, pageRequest);
		for(Bienes_Estaciones b: lista) {
			System.out.println(b.toString());
		}
		
	//	Bien bien = repo.findByAlta("0011");

		//System.out.println(repo.existsById(bien.getId()));

	//	System.out.println(bien.toString());

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
