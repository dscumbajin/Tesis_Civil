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

	@GetMapping("/createNewUser")
	public String crearNew(@ModelAttribute Usuario usuario) {
		return "usuarios/newUser";
	}

	@GetMapping(value = "/indexPaginate")
	public String mostrarIndexPaginado(Model model, Pageable page) {
		Page<Usuario> usuarios = serviceUsuarios.buscarTodos(page);
		model.addAttribute("usuarios", usuarios);
		return "usuarios/listUsuarios";
	}

	@PostMapping("/saveNewUser")
	public String guardarNewUser(@ModelAttribute Usuario usuario, Model model, @RequestParam("perfil") String perfil,
			BindingResult result, RedirectAttributes attributes, @RequestParam("cuenta") String cuenta,
			@RequestParam("email") String email) {

		if (result.hasErrors()) {
			System.out.println("Existen errores");
			return "usuarios/newUser";
		}

		if (serviceUsuarios.existePorCunetaEmail(cuenta, email)) {
			model.addAttribute("alerta", "Ya existe un registro con cuenta: " + cuenta + " y email: " + email);
			return "usuarios/newUser";

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
			attributes.addFlashAttribute("mensaje", "Usuario Creado");
			return "redirect:/formLogin";

		}

	}

	@PostMapping("/save")
	public String guardar(@ModelAttribute Usuario usuario, Model model, @RequestParam("perfil") String perfil,
			BindingResult result, RedirectAttributes attributes, @RequestParam("cuenta") String cuenta,
			@RequestParam("email") String email, @RequestParam("id") int id, @RequestParam("activo") String activo) {

		if (result.hasErrors()) {
			System.out.println("Existen errores");
			return "usuarios/formUsuario";
		}

		usuario = serviceUsuarios.buscarPorId(id);
		System.out.println("Cuenta por id: " + usuario.getCuenta());
		Perfil p = servicePerfiles.buscarPorCuneta(usuario.getCuenta());
		System.out.println(p.toString());

		System.out.println("Entro a la edicion");
		usuario.setActivo(Integer.parseInt(activo));
		usuario.setEmail(email);
		serviceUsuarios.guardar(usuario);
		p.setCuenta(usuario.getCuenta());
		p.setPerfil(perfil);
		servicePerfiles.guardar(p);
		return "redirect:/usuarios/indexPaginate";

	}

	// editar por ID
	@GetMapping(value = "edit/{id}")
	public String Editar(@PathVariable("id") int idUsuario, Model model) {
		Usuario usuario = serviceUsuarios.buscarPorId(idUsuario);
		model.addAttribute("usuario", usuario);
		return "usuarios/editUsuario";
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
	public String cancelar() {
		return "redirect:/usuarios/indexPaginate";
	}

	@RequestMapping(value = "/cancelNewUser")
	public String cancelarNewUser() {
		return "redirect:/formLogin";
	}

}
