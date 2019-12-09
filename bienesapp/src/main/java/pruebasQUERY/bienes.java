package pruebasQUERY;

import java.text.ParseException;

import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;

import uce.edu.ec.app.model.Bien;
import uce.edu.ec.app.repository.BienesRepository;

public class bienes {

	public static void main(String[] args) throws ParseException {

		ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext("root-context.xml");

		BienesRepository repo = context.getBean("bienesRepository", BienesRepository.class);

		// SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");

		PageRequest pageRequest = PageRequest.of(0, 10);
		Page<Bien> lista = repo.findByInput("MONITOR", pageRequest);
		// Page<Bien> lista = repo.findByPeriodo(dateFormat.parse("25-10-2019"),
		// dateFormat.parse("05-11-2019"), pageRequest);
		// List<Bien> lista
		// =repo.findByPeridoAll(dateFormat.parse("25-10-2019"),dateFormat.parse("05-11-2019"));

		for (Bien b : lista) {
			System.out.println(b.toString());
		}
		context.close();

	}

}
