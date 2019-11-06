package uce.edu.ec.app.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import org.springframework.stereotype.Repository;

import uce.edu.ec.app.model.Bienes_Estaciones;

@Repository
public interface BienesEstacionesRepository extends JpaRepository<Bienes_Estaciones, Integer> {

	Bienes_Estaciones findByBien_Id(int idBien);

	List<Bienes_Estaciones> findByEstacion_Id(int id);

	boolean existsByBien_IdAndEstacion_Id(int idBien, int idEstacion);

}
