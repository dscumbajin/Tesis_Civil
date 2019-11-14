package uce.edu.ec.app.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import uce.edu.ec.app.model.Perfil;
import uce.edu.ec.app.model.Usuario;
import uce.edu.ec.app.service.IPerfilesService;
import uce.edu.ec.app.service.IUsuariosService;

@Controller
@RequestMapping("/usuarios")
public class UsuariosController {

	@Autowired
	private BCryptPasswordEncoder encoder;

	@Autowired
	private IUsuariosService serviceUsuarios;

	@Autowired
	private IPerfilesService servicePerfiles;

	@GetMapping("/create")
	public String crear(@ModelAttribute Usuario usuario) {
		return "usuarios/formUsuario";
	}

	@GetMapping(value = "/indexPaginate")
	public String mostrarIndexPaginado(Model model, Pageable page) {
		Page<Usuario> usuarios = serviceUsuarios.buscarTodos(page);
		model.addAttribute("usuarios", usuarios);
		return "usuarios/listUsuarios";
	}

	@PostMapping("/save")
	public String guardar(@ModelAttribute Usuario usuario, Model model, @RequestParam("perfil") String perfil,
			BindingResult result, RedirectAttributes attributes, @RequestParam("cuenta") String cuenta,
			@RequestParam("email") String email) {

		if (result.hasErrors()) {
			System.out.println("Existen errores");
			return "usuarios/formUsuario";
		}

		if (serviceUsuarios.existePorCunetaEmail(cuenta, email)) {
			model.addAttribute("alerta", "Ya existe un registro con cuenta: " + cuenta + " y email: " + email);
			return "usuarios/formUsuario";

		} else {
			System.out.println("Usuario: " + usuario);
			System.out.println("Perfil: " + perfil);

			String tmpPass = usuario.getPwd();
			String encriptado = encoder.encode(tmpPass);
			usuario.setPwd(encriptado);
			serviceUsuarios.guardar(usuario);

			Perfil perfilTmp = new Perfil();
			perfilTmp.setCuenta(usuario.getCuenta());
			perfilTmp.setPerfil(perfil);
			servicePerfiles.guardar(perfilTmp);

			return "redirect:/usuarios/indexPaginate";

		}

	}

	// editar por ID
	@GetMapping(value = "edit/{id}")
	public String Editar(@PathVariable("id") int idUsuario, Model model) {
		Usuario usuario = serviceUsuarios.buscarPorId(idUsuario);
		model.addAttribute("usuario", usuario);
		return "usuarios/formUsuario";
	}

	// Eliminar por id
	@GetMapping(value = "delete/{id}")
	public String eliminar(@PathVariable("id") int idUsuario, RedirectAttributes attributes) {
		Usuario usuario = serviceUsuarios.buscarPorId(idUsuario);
		Perfil perfil = servicePerfiles.buscarPorCuneta(usuario.getCuenta());
		servicePerfiles.eliminar(perfil.getId());
		serviceUsuarios.eliminar(idUsuario);
		attributes.addFlashAttribute("mensaje", "Registro eliminado");
		return "redirect:/usuarios/indexPaginate";
	}

	@RequestMapping(value = "/cancel")
	public String mostrarAcerca() {
		return "redirect:/usuarios/indexPaginate";
	}

}
