package com.revshop.dao;

import java.sql.SQLException;
import java.util.List;

import com.revshop.Entity.Entity;

public interface DAO {
	//Could Also Have Done DAO<T> -Generic So it would help in making it more generic
	//cart implement DAO<CartEntity> so i would be specific for that
	
	public boolean insert(Entity entity) throws SQLException;
	public boolean update(Entity entity) throws SQLException;
	public boolean delete(int id) throws SQLException;
	public Entity retrieveById(int id) throws SQLException;
	public List<Entity> retrieveAll() throws SQLException;

}
