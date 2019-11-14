package pruebasQUERY;

import java.text.ParseException;
import java.util.List;

import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;

import uce.edu.ec.app.model.Bienes_Estaciones;
import uce.edu.ec.app.repository.BienesEstacionesRepository;

public class asignaciones {

	public static void main(String[] args) throws ParseException {

		ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext("root-context.xml");

		BienesEstacionesRepository repo = context.getBean("bienesEstacionesRepository",
				BienesEstacionesRepository.class);

	//	SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");

		PageRequest pageRequest = PageRequest.of(0, 10);
		//Page<Bienes_Estaciones> lista = repo.findByEstacion_IdAndCambioBetween(44, dateFormat.parse("04-11-2019"),dateFormat.parse("10-11-2019"), pageRequest);

		//Page<Bienes_Estaciones> lista = repo.findByBien_Alta("9173645", pageRequest);
		
		Page<Bienes_Estaciones> lista = repo.findByEstacion_IdAndBien_Alta(41, "7113099", pageRequest);
		for (Bienes_Estaciones b : lista) {
			System.out.println(b.getBien());
		}

		List<Bienes_Estaciones> todo = lista.getContent();

		System.out.println("------------------------------------------------------------------------");
		for (Bienes_Estaciones a : todo) {
			System.out.println(a.toString());
		}

		/*
		 * 
		 * // Bien bien = repo.findByAlta("0011");
		 * 
		 * //System.out.println(repo.existsById(bien.getId()));
		 * 
		 * // System.out.println(bien.toString());
		 * 
		 * /* BienesEstacionesRepository repo =
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
