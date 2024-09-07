package com.TODO;

import java.util.List;

public interface ToDoDao {

	void save(ToDoBo bo);
	List<ToDoBo> getAll();
	void delete(int id);
}
