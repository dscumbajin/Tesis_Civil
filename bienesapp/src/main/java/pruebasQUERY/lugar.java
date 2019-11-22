package pruebasQUERY;

import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;

import uce.edu.ec.app.model.Estacion;
import uce.edu.ec.app.repository.EstacionesRepository;

public class lugar {

	public static void main(String[] args) {

		ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext("root-context.xml");

		EstacionesRepository repo = context.getBean("estacionesRepository", EstacionesRepository.class);

		//boolean r=repo.existsByUbicacionAndLugar("Laboratorios Civil", "Sala A");
		//System.out.println(r);
		PageRequest pageRequest = PageRequest.of(0,10);
		Page<Estacion> lista = repo.findByLugar("Sala a",pageRequest );
		for(Estacion b : lista) {
			System.out.println(b.toString());
		}
		context.close();

	}

}
