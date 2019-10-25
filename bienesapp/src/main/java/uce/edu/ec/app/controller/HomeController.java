package uce.edu.ec.app.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import uce.edu.ec.app.model.Banner;
import uce.edu.ec.app.model.Bienes_Estaciones;
import uce.edu.ec.app.model.Estacion;
import uce.edu.ec.app.model.Noticia;
import uce.edu.ec.app.service.IBannersService;
import uce.edu.ec.app.service.IBienes_Estaciones;
import uce.edu.ec.app.service.IEstacionService;
import uce.edu.ec.app.service.INoticiasService;
import uce.edu.ec.app.util.Utileria;

@Controller
public class HomeController {

	@Autowired
	private IBannersService serviceBanners; // Ejercicio : Solucion

	@Autowired
	private IEstacionService serviceEstaciones;

	@Autowired
	private INoticiasService serviceNoticias;

	@Autowired
	private IBienes_Estaciones serviceAsignaciones;

	private SimpleDateFormat dataFormat = new SimpleDateFormat("dd-MM-yyyy");

	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String goHome() {
		return "home";
	}

	// Buscar por fecha
	@RequestMapping(value = "/search", method = RequestMethod.POST)
	public String buscar(@RequestParam("fecha") String fecha, Model model) {
		System.out.println("Buscando todos los bienes para la fecha" + fecha);
		model.addAttribute("fechaBusqueda", fecha);
		return "home";
	}

	// regresa la lista de Estaciones a la pantalla home
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String mostrarPrincipal(Model model) {
		model.addAttribute("fechaBusqueda", dataFormat.format(new Date()));
		return "home";
	}

	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public String mostrarDetalle(Model model, @RequestParam("idEstacion") int idEstacion) {

		List<Bienes_Estaciones> bienes_Estaciones = serviceAsignaciones.buscarIdPorIdEstacion(idEstacion);
		int numEquipos = bienes_Estaciones.size();
		model.addAttribute("numEquipo", numEquipos);
		model.addAttribute("bienes_Estaciones", bienes_Estaciones);
		model.addAttribute("estacion", serviceEstaciones.buscarPorId(idEstacion));
		return "detalle";// Buscar en la base de datos la conformacion de los numero de equipos con los
		// bienes asignados
	}

	@ModelAttribute("banners")
	public List<Banner> getBanners() {
		return serviceBanners.buscarActivos();
	}

	@ModelAttribute("estaciones")
	public List<Estacion> getEstaciones() {
		return serviceEstaciones.busacarTodas();
	}

	@ModelAttribute("noticias")
	public List<Noticia> getNoticias() {
		return serviceNoticias.buscarUltimas();
	}

	@ModelAttribute("fechas")
	public List<String> getFechas() {
		return Utileria.getNextDays(4);
	}

	@RequestMapping(value = "/about")
	public String mostrarAcerca() {
		return "acerca";
	}

	@RequestMapping(value = "/formLogin", method = RequestMethod.GET)
	public String mostrarLogin() {
		return "formLogin";
	}
}
