package hr.fer.ztel.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import hr.fer.ztel.domain.Category;

@Repository
@Transactional
@Qualifier("CategoryDao")
public class CategoryDao {

	@Autowired
	private SessionFactory sessionFactory;

	public void add(Category entity) {
		sessionFactory.getCurrentSession().save(entity);
	}

	public void update(Category entity) {
		sessionFactory.getCurrentSession().saveOrUpdate(entity);

	}

	public void remove(Category entity) {
		sessionFactory.getCurrentSession().delete(entity);

	}

	public Category find(Long key) {
		return (Category) sessionFactory.getCurrentSession().get(
				Category.class, key);

	}

	@SuppressWarnings("unchecked")
	public List<Category> list() {
		return sessionFactory.getCurrentSession()
				.createCriteria(Category.class).list();

	}

}
