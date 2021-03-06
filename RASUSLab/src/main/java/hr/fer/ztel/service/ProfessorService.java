package hr.fer.ztel.service;

import java.util.ArrayList;
import java.util.List;

import hr.fer.ztel.dao.CategoryDao;
import hr.fer.ztel.dao.ProfessorDao;
import hr.fer.ztel.domain.Category;
import hr.fer.ztel.domain.Professor;
import hr.fer.ztel.domain.Question;
import hr.fer.ztel.domain.Quiz;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ProfessorService {

	@Autowired
	private ProfessorDao profDao;
	@Autowired
	private CategoryDao catDao;

	public List<Quiz> getQuizMadeByProfessorInCategory(String username,
			Long categoryId) {

		Professor prof = profDao.getProfessorByUsername(username);
		Category category = catDao.find(categoryId);

		List<Quiz> quizes = new ArrayList<Quiz>();
		for (Quiz tempQuiz : prof.getQuizes()) {
			if (tempQuiz.getCategory().equals(category))
				quizes.add(tempQuiz);
		}
		return quizes;

	}

	public List<Question> getQuestionMadeByProfessorInCategory(String username,
			Long categoryId) {

		List<Question> allQuestions = profDao.getProfessorByUsername(username)
				.getQuestions();
		List<Question> categoryQuestion = new ArrayList<Question>();
		for (Question question : allQuestions) {
			if (question.getCategory().getIdCategory() == categoryId)
				categoryQuestion.add(question);

		}

		return categoryQuestion;
	}
}
