package hr.fer.ztel.service;

import hr.fer.ztel.dao.QuizDao;
import hr.fer.ztel.domain.Quiz;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class QuizService {

	@Autowired
	private QuizDao quizDao;

	public Quiz getQuizByCode(String code) {

		for (Quiz tempQuiz : quizDao.list()) {
			if (tempQuiz.getCode().equals(code))
				return tempQuiz;
		}
		return null;
	}

}
