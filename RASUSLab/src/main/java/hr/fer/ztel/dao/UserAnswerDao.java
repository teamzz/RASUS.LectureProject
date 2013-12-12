package hr.fer.ztel.dao;

import hr.fer.ztel.domain.UserAnswer;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
@Repository
@Transactional
public class UserAnswerDao {
	
	
		
		@Autowired
		private SessionFactory sessionFactory;

		public void add(UserAnswer entity) {
			sessionFactory.getCurrentSession().save(entity);
		}

		public void update(UserAnswer entity) {
			sessionFactory.getCurrentSession().saveOrUpdate(entity);

		}

		public void remove(UserAnswer entity) {
			sessionFactory.getCurrentSession().delete(entity);

		}

		public UserAnswer find(Long key) {
			return (UserAnswer) sessionFactory.getCurrentSession().get(
					UserAnswer.class, key);
		}

		@SuppressWarnings("unchecked")
		public List<UserAnswer> list() {

			return sessionFactory.getCurrentSession()
				.createCriteria(UserAnswer.class).list();
		}


}
