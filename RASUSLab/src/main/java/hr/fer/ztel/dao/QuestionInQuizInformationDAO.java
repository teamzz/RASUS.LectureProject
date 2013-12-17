package hr.fer.ztel.dao;

import hr.fer.ztel.domain.QuestionInQuizInformation;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
@Transactional
public class QuestionInQuizInformationDAO {
	@Autowired
	private SessionFactory sessionFactory;

	public void add(QuestionInQuizInformation entity) {
		sessionFactory.getCurrentSession().save(entity);
	}

	public void update(QuestionInQuizInformation entity) {
		sessionFactory.getCurrentSession().saveOrUpdate(entity);

	}

	public void remove(QuestionInQuizInformation entity) {
		sessionFactory.getCurrentSession().delete(entity);

	}

	public QuestionInQuizInformation find(Long key) {
		return (QuestionInQuizInformation) sessionFactory.getCurrentSession()
				.get(QuestionInQuizInformation.class, key);
	}

	public QuestionInQuizInformation find(Long idQuestion, Long idQuiz) {

		for (QuestionInQuizInformation quinf : list()) {
			if ((quinf.getQuestion().getIdQuestion() == idQuestion)
					&& (quinf.getQuiz().getIdQuiz() == idQuiz)) {
				return quinf;
			}
		}

		return null;
	}

	@SuppressWarnings("unchecked")
	public List<QuestionInQuizInformation> list() {

		return sessionFactory.getCurrentSession()
				.createCriteria(QuestionInQuizInformation.class).list();
	}
}
