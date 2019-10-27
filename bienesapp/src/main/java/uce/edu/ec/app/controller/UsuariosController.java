package uce.edu.ec.app.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
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

	@GetMapping("/index")
	public String index(Model model) {
		return "usuarios/listUsuarios";
	}

	@PostMapping("/save")
	public String guardar(@ModelAttribute Usuario usuario, Model model, @RequestParam("perfil") String perfil,
			BindingResult result, RedirectAttributes attributes, @RequestParam("cuenta") String cuenta) {

		if (result.hasErrors()) {
			System.out.println("Existen errores");
			return "usuarios/formUsuario";
		}

		if (serviceUsuarios.existePorCuneta(cuenta)) {
			model.addAttribute("alerta", "Ya existe un registro con cuneta: " + cuenta);
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

			return "redirect:/usuarios/index";

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
		return "redirect:/usuarios/index";
	}

	@GetMapping("/demo-bcrypt")
	public String pruebaBCrypt() {
		String password = "mari123";
		String encriptado = encoder.encode(password);
		System.out.println("Password encriptado: " + encriptado);
		return "usuarios/demo";
	}

	@ModelAttribute("usuarios")
	public List<Usuario> getBienes() {
		return serviceUsuarios.buscarTodos();
	}

	@RequestMapping(value = "/cancel")
	public String mostrarAcerca() {
		return "redirect:/usuarios/index";
	}

}
