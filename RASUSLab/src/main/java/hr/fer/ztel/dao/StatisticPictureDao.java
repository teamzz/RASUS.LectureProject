package hr.fer.ztel.dao;

import hr.fer.ztel.domain.Question;
import hr.fer.ztel.domain.Quiz;
import hr.fer.ztel.domain.StatisticPicture;
import hr.fer.ztel.domain.UserAnswer;
import hr.fer.ztel.service.Statistic;

import java.util.List;

import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
@Transactional
public class StatisticPictureDao {

	@Autowired
	private SessionFactory sessionFactory;

	public void add(StatisticPicture entity) {
		sessionFactory.getCurrentSession().save(entity);
	}

	public void update(StatisticPicture entity) {
		sessionFactory.getCurrentSession().saveOrUpdate(entity);

	}

	public void remove(StatisticPicture entity) {
		sessionFactory.getCurrentSession().delete(entity);

	}

	public StatisticPicture find(Quiz quiz, Question question) {

		return (StatisticPicture) sessionFactory.getCurrentSession()
				.createCriteria(StatisticPicture.class)
				.add(Restrictions.eq("quiz", quiz))
				.add(Restrictions.eq("question", question)).uniqueResult();
	}

	@SuppressWarnings("unchecked")
	public List<StatisticPicture> list() {

		return sessionFactory.getCurrentSession()
				.createCriteria(StatisticPicture.class).list();
	}

}
