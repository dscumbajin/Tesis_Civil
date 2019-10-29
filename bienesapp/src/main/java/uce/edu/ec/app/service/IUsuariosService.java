package uce.edu.ec.app.service;

import java.util.List;

import uce.edu.ec.app.model.Usuario;

public interface IUsuariosService {

	void guardar(Usuario usuario);

	List<Usuario> buscarTodos();

	Usuario buscarPorId(int idUsuario);

	Usuario buscarPorCuenta(String cuenta);

	boolean existePorCunetaEmail(String cuenta, String email);

	void eliminar(int idUsuario);
}
