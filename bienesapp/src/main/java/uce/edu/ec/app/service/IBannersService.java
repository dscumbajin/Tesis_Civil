package uce.edu.ec.app.service;

import java.util.List;

import uce.edu.ec.app.model.Banner;

public interface IBannersService {

	void insertar(Banner banner);

	List<Banner> buscarTodos();
	
	List<Banner> buscarActivos();
	
	Banner buscarPorId(int idBanner);
	
	void eliminar (int idBannner);

}
