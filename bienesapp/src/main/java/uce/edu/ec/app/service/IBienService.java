package uce.edu.ec.app.service;

import java.util.List;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import uce.edu.ec.app.model.Bien;

public interface IBienService {

	// Insertar
	void insertar(Bien bien);

	// Listar todos
	List<Bien> buscarTodas();

	// Buscar por id
	Bien buscarPorId(int idBien);

	// buecar por alta
	Bien buscarPorAlta(String alta);

	// existe por id
	boolean existePorId(int id);

	// Eliminar
	void eliminar(int idBien);

	// Para paginar
	Page<Bien> buscarTodas(Pageable page);
	
	Page<Bien> search(String alta, Pageable page);

	// Para controlar repetidos
	boolean exiteRegistroPorAltaAnteriorSerie(String alta, String anterior, String serie);

	// Para buscar todos los bienes que no estan asignados
	List<Bien> sinAsignacion();

}
