package hr.fer.ztel.dao;

import hr.fer.ztel.domain.CorrectAnswer;
import hr.fer.ztel.domain.IncorrectAnswer;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
@Transactional
public class IncorrectAnswerDao {

	@Autowired
	private SessionFactory sessionFactory;

	public void add(IncorrectAnswer entity) {
		sessionFactory.getCurrentSession().save(entity);
	}

	public void update(IncorrectAnswer entity) {
		sessionFactory.getCurrentSession().saveOrUpdate(entity);

	}

	public void remove(IncorrectAnswer entity) {
		sessionFactory.getCurrentSession().delete(entity);

	}

	public IncorrectAnswer find(Long key) {
		return (IncorrectAnswer) sessionFactory.getCurrentSession().get(
				IncorrectAnswer.class, key);
	}

	@SuppressWarnings("unchecked")
	public List<IncorrectAnswer> list() {

		return sessionFactory.getCurrentSession()
				.createCriteria(IncorrectAnswer.class).list();
	}

}
