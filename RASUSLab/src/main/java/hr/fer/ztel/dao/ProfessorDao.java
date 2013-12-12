package hr.fer.ztel.dao;

import hr.fer.ztel.domain.Category;
import hr.fer.ztel.domain.Professor;

import java.util.List;

import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
@Transactional
@Qualifier("ProfessorDao")
public class ProfessorDao {

	@Autowired
	private SessionFactory sessionFactory;

	public void add(Professor entity) {
		sessionFactory.getCurrentSession().save(entity);

	}

	public void update(Professor entity) {
		sessionFactory.getCurrentSession().saveOrUpdate(entity);

	}

	public void remove(Professor entity) {
		sessionFactory.getCurrentSession().delete(entity);

	}

	public Professor find(Long key) {

		return (Professor) sessionFactory.getCurrentSession().get(
				Professor.class, key);

	}

	@SuppressWarnings("unchecked")
	public List<Professor> list() {
		return sessionFactory.getCurrentSession()
				.createCriteria(Professor.class).list();
		// return
		// sessionFactory.getCurrentSession().createQuery("from Professor")
		// .list();
	}

	public Professor getProfessorByUsername(String username) {

		return (Professor) sessionFactory.getCurrentSession()
				.createCriteria(Professor.class)
				.add(Restrictions.eq("username", username)).list().get(0);
	}
}
