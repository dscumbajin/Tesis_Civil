package uce.edu.ec.app.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import uce.edu.ec.app.model.Usuario;

@Repository
public interface UsuariosRepository extends JpaRepository<Usuario, Integer> {

}
