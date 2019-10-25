package uce.edu.ec.app.repository;


import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import org.springframework.stereotype.Repository;

import uce.edu.ec.app.model.Bienes_Estaciones;
@Repository
public interface BienesEstacionesRepository extends JpaRepository<Bienes_Estaciones, Integer> {
	
	public Bienes_Estaciones findByBien_Id(int idBien);
	
	public List<Bienes_Estaciones> findByEstacion_Id(int id);
	

}
