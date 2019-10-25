package uce.edu.ec.app.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
	public String guardar(@ModelAttribute Usuario usuario,@RequestParam("perfil") String perfil) {
		System.out.println("Usuario: "+ usuario);
		System.out.println("Perfil: " + perfil);
		
		String tmpPass = usuario.getPwd();
		String encriptado = encoder.encode(tmpPass);
		usuario.setPwd(encriptado);
		usuario.setActivo(1);
		serviceUsuarios.guardar(usuario);
		
		Perfil perfilTmp = new Perfil();
		perfilTmp.setCuenta(usuario.getCuenta());
		perfilTmp.setPerfil(perfil);
		servicePerfiles.guardar(perfilTmp);
		
		return "redirect:/usuarios/index";
	}
	
	@GetMapping("/demo-bcrypt")
	public String pruebaBCrypt() {
		String password="mari123";
		String encriptado=encoder.encode(password);
		System.out.println("Password encriptado: " + encriptado);
		return "usuarios/demo";
	}
	
	@ModelAttribute("usuarios")
	public List<Usuario> getBienes() {
		return serviceUsuarios.buscarTodos();
	}
	
}
