package pruebasQUERY;

import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;

import uce.edu.ec.app.model.Bien;
import uce.edu.ec.app.repository.BienesRepository;

public class bienes {

	public static void main(String[] args) {

		ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext("root-context.xml");

		BienesRepository repo = context.getBean("bienesRepository", BienesRepository.class);

		
		PageRequest pageRequest = PageRequest.of(0,10);
		Page<Bien> lista = repo.findByAlta("9173645", pageRequest);
		
		for(Bien b: lista) {
			System.out.println(b.toString());
		}
		context.close();

	}

}
