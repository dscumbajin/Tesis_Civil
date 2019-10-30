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

	//Eliminar
	void eliminar(int idBien);

	//Para paginar
	Page<Bien> buscarTodas(Pageable page);
	
	//Para controlar repetidos
	boolean exiteRegistroPorAltaAnteriorSerie(String alta, String anterior, String serie );

}
