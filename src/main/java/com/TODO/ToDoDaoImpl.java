package com.TODO;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ToDoDaoImpl implements ToDoDao {
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	@Transactional
	public void save(ToDoBo bo) {
		sessionFactory.getCurrentSession().save(bo);
	}

	@Transactional
	@Override
	public List<ToDoBo> getAll() {
		return sessionFactory.getCurrentSession().createQuery("from ToDoBo", ToDoBo.class).list();
	}

	@Transactional
	@Override
	public void delete(int id) {
		ToDoBo todo = sessionFactory.getCurrentSession().get(ToDoBo.class, id);
		if (todo != null) {
			sessionFactory.getCurrentSession().delete(todo);
		}
	}
}
