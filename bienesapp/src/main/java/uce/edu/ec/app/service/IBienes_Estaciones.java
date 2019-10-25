package uce.edu.ec.app.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import uce.edu.ec.app.model.Bienes_Estaciones;

public interface IBienes_Estaciones {

	void insertar(Bienes_Estaciones bienes_Estaciones);

	List<Bienes_Estaciones> buscarTodos();
	
	Page<Bienes_Estaciones> buscarTodos(Pageable page);

	Bienes_Estaciones buscarPorId(int id);

	void eliminar(int id);
	
	Bienes_Estaciones buscarIdPorIdBien(int id);
	
	List<Bienes_Estaciones> buscarIdPorIdEstacion(int idEstacion);
		
	boolean existe(int id);

	
}
