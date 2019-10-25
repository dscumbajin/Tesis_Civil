package uce.edu.ec.app.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import uce.edu.ec.app.model.Bien;
import uce.edu.ec.app.model.Bienes_Estaciones;
import uce.edu.ec.app.model.Estacion;
import uce.edu.ec.app.service.IBienService;
import uce.edu.ec.app.service.IBienes_Estaciones;
import uce.edu.ec.app.service.IEstacionService;

@Controller
@RequestMapping(value = "/asignaciones")
public class BienesEstacionesController {

	@Autowired
	private IBienes_Estaciones servicioBienesEstaciones;

	@Autowired
	private IBienService servicioBienes;

	@Autowired
	private IEstacionService servicioEstaciones;

	@GetMapping(value = "/index")
	public String mostrarIndex(Model model) {
		List<Bienes_Estaciones> listaAsignaciones = servicioBienesEstaciones.buscarTodos();
		model.addAttribute("asignaciones", listaAsignaciones);
		return "asignaciones/listAsignaciones";
	}

	@GetMapping(value = "/indexPaginate")
	public String mostrarIndexPaginado(Model model, Pageable page) {
		Page<Bienes_Estaciones> listaAsignaciones = servicioBienesEstaciones.buscarTodos(page);
		model.addAttribute("asignaciones", listaAsignaciones);
		return "asignaciones/listAsignaciones";
	}

	@GetMapping(value = "/create")
	public String crear(@ModelAttribute Bienes_Estaciones bienes_Estaciones, Model model) {
		return "asignaciones/formAsignaciones";
	}

	// Manejo de Errores
	@PostMapping(value = "/save")
	public String guardar(@ModelAttribute Bienes_Estaciones bienes_Estaciones, BindingResult result,
			RedirectAttributes attributes) {
		if (result.hasErrors()) {
			System.out.println("Existen errores");
			return "asignaciones/formAsignaciones";
		}
		servicioBienesEstaciones.insertar(bienes_Estaciones);
		attributes.addFlashAttribute("mensaje", "El registro fue guardado");
		// redireccionamos a un nuevo formmulario
		return "redirect:/asignaciones/indexPaginate";
	}

	// editar por ID
	@GetMapping(value = "edit/{id}")
	public String Editar(@PathVariable("id") int id, Model model) {
		Bienes_Estaciones bienes_Estaciones = servicioBienesEstaciones.buscarPorId(id);
		model.addAttribute("bienes_Estaciones", bienes_Estaciones);
		return "asignaciones/formAsignaciones";
	}

	// Eliminar por id
	@GetMapping(value = "delete/{id}")
	public String eliminar(@PathVariable("id") int id, RedirectAttributes attributes) {
		servicioBienesEstaciones.eliminar(id);
		attributes.addFlashAttribute("mensaje", "Registro eliminado");
		return "redirect:/asignaciones/indexPaginate";
	}

	@ModelAttribute("bienes")
	public List<Bien> getBienes() {
		return servicioBienes.buscarTodas();
	}

	@ModelAttribute("estaciones")
	public List<Estacion> getEstaciones() {
		return servicioEstaciones.busacarTodas();
	}

}
