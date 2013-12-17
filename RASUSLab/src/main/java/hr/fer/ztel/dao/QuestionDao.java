package hr.fer.ztel.dao;

import hr.fer.ztel.domain.Question;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
@Transactional
public class QuestionDao {

	@Autowired
	private SessionFactory sessionFactory;

	public void add(Question entity) {
		sessionFactory.getCurrentSession().save(entity);
	}

	public void update(Question entity) {
		sessionFactory.getCurrentSession().saveOrUpdate(entity);

	}

	public void remove(Question entity) {
		sessionFactory.getCurrentSession().delete(entity);

	}

	public Question find(Long key) {

		return (Question) sessionFactory.getCurrentSession().get(
				Question.class, key);
	}

	@SuppressWarnings("unchecked")
	public List<Question> list() {

		return sessionFactory.getCurrentSession()
				.createCriteria(Question.class).list();

	}

}
