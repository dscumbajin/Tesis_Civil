package uce.edu.ec.app.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import uce.edu.ec.app.model.Bien;

@Repository
public interface BienesRepository extends JpaRepository<Bien, Integer> {
	
	public Bien findByAlta(String alta);
	
	//valor repetido por alta, anterior, serie
	public boolean existsByAltaAndAnteriorAndSerie(String alta, String anterior, String serie);
	
	

}
