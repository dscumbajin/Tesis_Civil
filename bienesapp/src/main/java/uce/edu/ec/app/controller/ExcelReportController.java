package uce.edu.ec.app.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import uce.edu.ec.app.model.Bien;
import uce.edu.ec.app.service.IBienService;
import uce.edu.ec.app.util.ExcelReportView;

@Controller
@RequestMapping(value = "/bienes")
public class ExcelReportController {

	@Autowired
	IBienService servicioBienes;

	@GetMapping(value = "/downloadExcel")
	public ModelAndView getReport(HttpServletRequest request, HttpServletResponse response) {
		String reportType = request.getParameter("type");
		List<Bien> bienes = servicioBienes.buscarTodas();
		if (reportType != null && reportType.equals("excel")) {
			return new ModelAndView(new ExcelReportView(), "bienes", bienes);

		} // else if "pdf" code for pdf
		return new ModelAndView("listBienes","bienes", bienes);
	}

}
