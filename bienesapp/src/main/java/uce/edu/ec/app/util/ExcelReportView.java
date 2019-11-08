package uce.edu.ec.app.util;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.web.servlet.view.document.AbstractXlsView;

import uce.edu.ec.app.model.Bien;

public class ExcelReportView extends AbstractXlsView {

	@Override
	protected void buildExcelDocument(Map<String, Object> model, Workbook workbook, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		response.setHeader("Content-Disposition", "attachment; filename=\"bienes.xls\"");
		List<Bien> bienes = (List<Bien>) model.get("bienes");
		Sheet sheet = workbook.createSheet("Bienes List");
		Row headerRow = sheet.createRow(0);
		headerRow.createCell(0).setCellValue("ID");
		headerRow.createCell(1).setCellValue("Alta Nueva");
		headerRow.createCell(2).setCellValue("Alta Anterior");
		headerRow.createCell(3).setCellValue("Descripcion");
		headerRow.createCell(4).setCellValue("Serie");
		headerRow.createCell(5).setCellValue("Fecha de Ingreso");
		headerRow.createCell(6).setCellValue("Costo");
		headerRow.createCell(7).setCellValue("Vida Util");
		headerRow.createCell(8).setCellValue("Depreciacion");
		headerRow.createCell(9).setCellValue("Fecha fin de garantia");
		headerRow.createCell(10).setCellValue("Color");
		headerRow.createCell(11).setCellValue("Material");
		headerRow.createCell(12).setCellValue("Asignado");
		headerRow.createCell(13).setCellValue("Marca");
		headerRow.createCell(14).setCellValue("Modelo");
		headerRow.createCell(15).setCellValue("Estado");
		headerRow.createCell(16).setCellValue("Estatus");
		headerRow.createCell(17).setCellValue("Tipo");
		headerRow.createCell(18).setCellValue("Guarda Almacen");
		headerRow.createCell(19).setCellValue("Causionado");

		int row = 1;
		for (Bien bien : bienes) {
			Row dataRow = sheet.createRow(row++);
			dataRow.createCell(0).setCellValue(bien.getId());
			dataRow.createCell(1).setCellValue(bien.getAlta());
			dataRow.createCell(2).setCellValue(bien.getAnterior());
			dataRow.createCell(3).setCellValue(bien.getDescripcion());
			dataRow.createCell(4).setCellValue(bien.getSerie());
			dataRow.createCell(5).setCellValue(bien.getFecha_ingreso());
			dataRow.createCell(6).setCellValue(bien.getCosto());
			dataRow.createCell(7).setCellValue(bien.getVida_util());
			dataRow.createCell(8).setCellValue(bien.getDepreciacion());
			dataRow.createCell(9).setCellValue(bien.getGarantia());
			dataRow.createCell(10).setCellValue(bien.getColor());
			dataRow.createCell(11).setCellValue(bien.getMaterial());
			dataRow.createCell(12).setCellValue(bien.getDetalle().getAsignado());
			dataRow.createCell(13).setCellValue(bien.getDetalle().getMarca());
			dataRow.createCell(14).setCellValue(bien.getDetalle().getModelo());
			dataRow.createCell(15).setCellValue(bien.getDetalle().getEstado());
			dataRow.createCell(16).setCellValue(bien.getDetalle().getEstatus());
			dataRow.createCell(17).setCellValue(bien.getDetalle().getTipo());
			dataRow.createCell(18).setCellValue(bien.getDetalle().getGuarda_almacen());
			dataRow.createCell(19).setCellValue(bien.getDetalle().getCausionado());

		}

	}

}
