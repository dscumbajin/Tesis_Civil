package uce.edu.ec.app.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import uce.edu.ec.app.model.Bienes_Estaciones;

@Repository
public interface BienesEstacionesRepository extends JpaRepository<Bienes_Estaciones, Integer> {

	Bienes_Estaciones findByBien_Id(int idBien);

	List<Bienes_Estaciones> findByEstacion_Id(int id);
	
	@Query(value = "SELECT * FROM BIENES_ESTACIONES WHERE ID_ESTACION = ?1", nativeQuery = true)
	Page<Bienes_Estaciones> findByIdEstacion(@Param ("ID_ESTACION") int id_estacion, Pageable page);
	
	boolean existsByBien_IdAndEstacion_Id(int idBien, int idEstacion);

}
