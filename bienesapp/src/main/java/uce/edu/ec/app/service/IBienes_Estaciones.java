package uce.edu.ec.app.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import uce.edu.ec.app.model.Bienes_Estaciones;

public interface IBienes_Estaciones {

	// Insertar
	void insertar(Bienes_Estaciones bienes_Estaciones);

	// Listar todos
	List<Bienes_Estaciones> buscarTodos();

	// Listar todos paginacion
	Page<Bienes_Estaciones> buscarTodos(Pageable page);
	
	Page<Bienes_Estaciones> buscarPorIdEstacion(int idEstacion, Pageable page);

	// Buscar por id
	Bienes_Estaciones buscarPorId(int id);

	// Eliminar por id
	void eliminar(int id);

	// Buscar por id del bien
	Bienes_Estaciones buscarIdPorIdBien(int id);

	// todos los bines buscados por id estacion
	List<Bienes_Estaciones> buscarIdPorIdEstacion(int idEstacion);

	// Existe un bien_estacion por id
	boolean existe(int id);

	// Controlar repetidos
	boolean existeRegistroPorIdBienIdEstacion(int idBien, int idEstacion);

}
