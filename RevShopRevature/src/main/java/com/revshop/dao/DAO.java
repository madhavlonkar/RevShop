package com.revshop.dao;

import java.util.List;

import com.revshop.Entity.Entity;

public interface DAO {
	
	public boolean insert(Entity entity);
	public boolean update(Entity entity);
	public boolean delete(int id);
	public Entity retrieveById(int id);
	public List<Entity> retrieveAll();

}
