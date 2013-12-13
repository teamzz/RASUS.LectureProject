package hr.fer.ztel.service;

import hr.fer.ztel.dao.UserAnswerDao;

import hr.fer.ztel.domain.UserAnswer;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserAnswerService {

	@Autowired
	private UserAnswerDao answerDao;

	public List<UserAnswer> getUserAnswersForQuiz(Long idQuiz) {
		List<UserAnswer> answ = new ArrayList<UserAnswer>();
		for (UserAnswer userAnswer : answerDao.list()) {
			if (userAnswer.getQuiz().getIdQuiz() == idQuiz) {
				answ.add(userAnswer);
			}
		}

		return answ;

	}

	public List<UserAnswer> getUserAnswersForQuestionInQuiz(Long idQuiz,
			Long idQuestion) {
		List<UserAnswer> answ = new ArrayList<UserAnswer>();
		for (UserAnswer userAnswer : answerDao.list()) {
			if (userAnswer.getQuiz().getIdQuiz() == idQuiz
					&& userAnswer.getQuestion().getIdQuestion() == idQuestion) {
				answ.add(userAnswer);
			}
		}

		return answ;
	}
}
