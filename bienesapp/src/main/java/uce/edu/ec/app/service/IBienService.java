package uce.edu.ec.app.service;

import java.util.List;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import uce.edu.ec.app.model.Bien;

public interface IBienService {

	void insertar(Bien bien);

	List<Bien> buscarTodas();

	Bien buscarPorId(int idBien);

	Bien buscarPorAlta(String alta);

	boolean existePorId(int id);

	void eliminar(int idBien);

	Page<Bien> buscarTodas(Pageable page);
	
	boolean exiteRegistro(String alta);

}
