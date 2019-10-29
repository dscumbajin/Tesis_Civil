package uce.edu.ec.app.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import uce.edu.ec.app.model.Usuario;
import uce.edu.ec.app.repository.UsuariosRepository;

@Service
public class UsuariosServiceJPA implements IUsuariosService {

	@Autowired
	private UsuariosRepository usuariosRepo;

	@Override
	public void guardar(Usuario usuario) {
		usuariosRepo.save(usuario);
	}

	@Override
	public List<Usuario> buscarTodos() {
		return usuariosRepo.findAll();
	}

	@Override
	public Usuario buscarPorCuenta(String cuenta) {
		return usuariosRepo.findByCuenta(cuenta);
	}

	@Override
	public Usuario buscarPorId(int idUsuario) {
		Optional<Usuario> optional = usuariosRepo.findById(idUsuario);
		if (optional.isPresent()) {
			return optional.get();
		}
		return null;
	}

	@Override
	public void eliminar(int idUsuario) {

		usuariosRepo.deleteById(idUsuario);
	}

	@Override
	public boolean existePorCunetaEmail(String cuenta, String email) {

		return usuariosRepo.existsByCuentaAndEmail(cuenta, email);
	}

}
