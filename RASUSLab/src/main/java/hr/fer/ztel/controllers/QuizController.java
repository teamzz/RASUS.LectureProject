package hr.fer.ztel.controllers;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletResponse;

import hr.fer.ztel.dao.CategoryDao;
import hr.fer.ztel.dao.ProfessorDao;
import hr.fer.ztel.dao.QuestionDao;
import hr.fer.ztel.dao.QuizDao;
import hr.fer.ztel.dao.UserAnswerDao;
import hr.fer.ztel.domain.Category;
import hr.fer.ztel.domain.Professor;
import hr.fer.ztel.domain.Question;
import hr.fer.ztel.domain.Quiz;
import hr.fer.ztel.domain.QuizHolder;
import hr.fer.ztel.domain.UserAnswer;
import hr.fer.ztel.domain.UserAnswerHolder;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class QuizController {

	private static final Logger logger = LoggerFactory
			.getLogger(HomeController.class);

	@Autowired
	private QuizDao quizDao;

	@Autowired
	private CategoryDao categoryDao;

	@Autowired
	private QuestionDao questionDao;

	@Autowired
	private ProfessorDao professorDao;

	@Autowired
	private UserAnswerDao userAnsDao;

	// add quiz
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/AddQuiz", method = RequestMethod.GET)
	public String home(Model model) {
		
		
		model.addAttribute("quizholder", new QuizHolder());
		model.addAttribute("categories", categoryDao.list());
		model.addAttribute("questions", questionDao.list());
		return "AddQuiz";
	}

	/**
	 * Saves the edited person and display all persons again
	 * 
	 * @return
	 */
	@RequestMapping(value = "/AddQuiz/formsubmit", method = RequestMethod.POST)
	public String saveEdit(@ModelAttribute("quizholder") QuizHolder quizHolder,
			Model model) {
		logger.debug("Received request to add quiz");

		Quiz quiz = quizHolder.getQuiz();
		quiz.setCode("cmhjHkhKB456fv");
		System.out.println("id category je " + quizHolder.getIdCategory());
		System.out.println("id professor je " + quizHolder.getIdProfessor());
		quiz.setCategory(categoryDao.find(quizHolder.getIdCategory()));
		quiz.setCreator(professorDao.find(quizHolder.getIdProfessor()));

		List<Question> questionsList = new ArrayList<Question>();
		for (long questionId : quizHolder.getQuestionsIdList()) {
			/*
			 * System.out.println("question id je " + questionId);
			 * System.out.println("question text je " +
			 * questionDao.find(questionId).getTextQuestion());
			 */
			questionsList.add(questionDao.find(questionId));
		}
		for (Question q : questionsList) {
			System.out.println(q);
		}
		System.out.println("\n");

		for (Question q : questionDao.list()) {
			System.out.println(q);
		}
		quiz.setQuestions(questionsList);
		quizDao.add(quiz);

		model.addAttribute("quizes", quizDao.list());
		return "Quizes";
	}

	// manage quiz
	// add quiz
	/**
	 * Simply selects the home view to render by returning its name.
	 */

	@RequestMapping(value = "/Quizes", method = RequestMethod.GET)
	public String homeQuizes(Model model) {
		
		model.addAttribute("quizes", quizDao.list());
		return "Quizes";
	}

	/**
	 * Simply selects the home view to render by returning its name.
	 */

	@RequestMapping(value = "/SolveSimpleQuiz/{idQuiz}", method = RequestMethod.GET)
	public String solveQuiz(@PathVariable ("idQuiz") Long idQuiz, Model model) {
		UserAnswerHolder uah = new UserAnswerHolder();
		uah.setIdQuiz(idQuiz);
		model.addAttribute("questions", quizDao.find(idQuiz).getQuestions());
		model.addAttribute("ansOfQuestions", uah);
		return "SolveSimpleQuiz";
	}

	/**
	 * Simply selects the home view to render by returning its name.
	 */

	@RequestMapping(value = "/SolveSimpleQuiz/formsubmit", method = RequestMethod.POST)
	public String submitQuiz(
			@ModelAttribute("ansOfQuestions") UserAnswerHolder ansToQuestions,
			Model model) {

		int numOfQuestions = ansToQuestions.getQuestionsId().size();
		int numOfAnswers = ansToQuestions.getUserAnswers().size();
		System.out.println("kviz id" + ansToQuestions.getIdQuiz());
		System.out.println(numOfQuestions + " " + numOfAnswers);
		for (int i = 0; i < numOfQuestions; i++) {
			String answer = ansToQuestions.getUserAnswers().get(i);
			UserAnswer ua = new UserAnswer();
			ua.setUserAnswer(answer);
			ua.setQuestion(questionDao.find(Long.parseLong(ansToQuestions
					.getQuestionsId().get(i))));
			ua.setQuiz(quizDao.find(ansToQuestions.getIdQuiz()));
			userAnsDao.add(ua);
			System.out.println(ua);
		}
		model.addAttribute("quizes", quizDao.list());
		return "Quizes";

	}
}
