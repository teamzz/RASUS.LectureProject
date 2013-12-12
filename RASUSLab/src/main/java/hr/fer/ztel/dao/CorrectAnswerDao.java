package hr.fer.ztel.dao;

import hr.fer.ztel.domain.CorrectAnswer;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;


@Repository
@Transactional
public class CorrectAnswerDao {

	@Autowired
	private SessionFactory sessionFactory;

	public void add(CorrectAnswer entity) {
		sessionFactory.getCurrentSession().save(entity);
	}

	public void update(CorrectAnswer entity) {
		sessionFactory.getCurrentSession().saveOrUpdate(entity);

	}

	public void remove(CorrectAnswer entity) {
		sessionFactory.getCurrentSession().delete(entity);

	}

	public CorrectAnswer find(Long key) {
		return (CorrectAnswer) sessionFactory.getCurrentSession().get(
				CorrectAnswer.class, key);
	}

	@SuppressWarnings("unchecked")
	public List<CorrectAnswer> list() {

		return sessionFactory.getCurrentSession()
				.createCriteria(CorrectAnswer.class).list();
	}
}
