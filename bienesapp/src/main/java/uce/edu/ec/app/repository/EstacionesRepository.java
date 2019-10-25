package uce.edu.ec.app.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import uce.edu.ec.app.model.Estacion;

@Repository
public interface EstacionesRepository extends JpaRepository<Estacion, Integer> {
	
	public 	boolean findByLugar(String lugar); 
	public boolean existsByUbicacionAndLugar(String ubicacion ,String lugar);

}
