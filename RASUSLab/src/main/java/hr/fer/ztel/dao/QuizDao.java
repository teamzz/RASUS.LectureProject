package hr.fer.ztel.dao;

import hr.fer.ztel.domain.Quiz;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
@Transactional
@Qualifier("QuizDao")
public class QuizDao {

	@Autowired
	private SessionFactory sessionFactory;

	public void add(Quiz entity) {
		sessionFactory.getCurrentSession().save(entity);

	}

	public void update(Quiz entity) {
		sessionFactory.getCurrentSession().saveOrUpdate(entity);

	}

	public void remove(Quiz entity) {
		sessionFactory.getCurrentSession().delete(entity);

	}

	public Quiz find(Long key) {
		return (Quiz) sessionFactory.getCurrentSession().get(Quiz.class, key);
	}

	@SuppressWarnings("unchecked")
	public List<Quiz> list() {
		return sessionFactory.getCurrentSession().createCriteria(Quiz.class)
				.list();
	}

}
