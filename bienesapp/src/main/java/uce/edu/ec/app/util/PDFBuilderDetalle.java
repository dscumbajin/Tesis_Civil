package uce.edu.ec.app.util;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;

import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Chunk;
import com.itextpdf.text.Document;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.Font.FontFamily;
import com.itextpdf.text.FontFactory;
import com.itextpdf.text.Image;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;

import uce.edu.ec.app.model.Bienes_Estaciones;

@Component
public class PDFBuilderDetalle extends AbstractITextPdfView {

	SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss");

	@SuppressWarnings("unchecked")
	@Override
	protected void buildPdfDocument(Map<String, Object> model, Document doc, PdfWriter writer,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		// get data model which is passed by the Spring container
		List<Bienes_Estaciones> bienes_Estaciones = (List<Bienes_Estaciones>) model.get("bienes_Estaciones");

		// Design ParaGraph

		Font blue = new Font(FontFamily.HELVETICA, 14, Font.BOLD, BaseColor.BLUE);
		Chunk blueText = new Chunk(
				"DETALLE                                                   " + "Hora: " + dateFormat.format(new Date()),
				blue);
		Paragraph p = new Paragraph(blueText);
		p.setAlignment(Element.ALIGN_CENTER);
		doc.add(p);
		// Added image in PDF
		try {
			Image img = Image.getInstance("C:\\Users\\cumba\\Downloads\\logoUce.jpg");
			img.scalePercent(100f);
			img.scaleAbsolute(120f, 60f);
			doc.add(img);
		} catch (Exception e) {

		}

		PdfPTable table = new PdfPTable(13);
		table.setWidthPercentage(100.0f);
		table.setWidths(new float[] { 1.0f, 1.0f, 1.0f, 2.0f, 1.3f, 1.3f, 1.3f, 1.3f, 1.3f, 1.3f, 1.3f, 1.3f, 1.3f });
		table.setSpacingBefore(10);
		table.getDefaultCell().setHorizontalAlignment(Element.ALIGN_CENTER);
		// define font for table header row
		Font font = FontFactory.getFont(FontFactory.HELVETICA_BOLD);
		font.setColor(BaseColor.WHITE);

		// define table header cell
		PdfPCell cell = new PdfPCell(new Paragraph("Created By Basant"));
		/*
		 * previous code blue pattern cell.setBackgroundColor(BaseColor.BLUE);
		 * cell.setPadding(6);
		 */

		cell.setHorizontalAlignment(Element.ALIGN_CENTER);
		cell.setPadding(10.0f);
		cell.setBackgroundColor(new BaseColor(30, 144, 255));
		// write table header
		cell.setPhrase(new Phrase("Persona Usa", font));
		table.addCell(cell);
		cell.setPhrase(new Phrase("Alta Nueva", font));
		table.addCell(cell);
		cell.setPhrase(new Phrase("Alta Anterior", font));
		table.addCell(cell);
		cell.setPhrase(new Phrase("Descripcion", font));
		table.addCell(cell);
		cell.setPhrase(new Phrase("Marca", font));
		table.addCell(cell);
		cell.setPhrase(new Phrase("Modelo", font));
		table.addCell(cell);
		cell.setPhrase(new Phrase("Serie", font));
		table.addCell(cell);
		cell.setPhrase(new Phrase("Guarda Almacen", font));
		table.addCell(cell);
		cell.setPhrase(new Phrase("Causionado", font));
		table.addCell(cell);
		cell.setPhrase(new Phrase("Ubicaci�n", font));
		table.addCell(cell);
		cell.setPhrase(new Phrase("Lugar", font));
		table.addCell(cell);
		cell.setPhrase(new Phrase("Registro", font));
		table.addCell(cell);
		cell.setPhrase(new Phrase("Cambio", font));
		table.addCell(cell);

		// write table row data
		for (Bienes_Estaciones bien_Estacion : bienes_Estaciones) {
			table.addCell(bien_Estacion.getBien().getDetalle().getAsignado());
			table.addCell(bien_Estacion.getBien().getAlta());
			table.addCell(bien_Estacion.getBien().getAnterior());
			table.addCell(bien_Estacion.getBien().getDescripcion());
			table.addCell(bien_Estacion.getBien().getDetalle().getMarca());
			table.addCell(bien_Estacion.getBien().getDetalle().getModelo());
			table.addCell(bien_Estacion.getBien().getSerie());
			table.addCell(bien_Estacion.getBien().getDetalle().getGuarda_almacen());
			table.addCell(bien_Estacion.getBien().getDetalle().getCausionado());
			table.addCell(bien_Estacion.getEstacion().getLugar());
			table.addCell(bien_Estacion.getEstacion().getUbicacion());
			table.addCell(String.valueOf(bien_Estacion.getRegistro()));
			table.addCell(String.valueOf(bien_Estacion.getCambio()));

		}

		doc.add(table);

	}
}