package hr.fer.ztel.controllers;

import java.io.IOException;
import java.security.Principal;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hr.fer.ztel.dao.CategoryDao;
import hr.fer.ztel.dao.ProfessorDao;
import hr.fer.ztel.dao.QuestionDao;
import hr.fer.ztel.dao.QuizDao;
import hr.fer.ztel.dao.StatisticPictureDao;
import hr.fer.ztel.domain.Category;
import hr.fer.ztel.domain.Question;
import hr.fer.ztel.domain.QuestionHolder;
import hr.fer.ztel.domain.CorrectAnswer;
import hr.fer.ztel.domain.IncorrectAnswer;
import hr.fer.ztel.domain.Professor;
import hr.fer.ztel.domain.Quiz;
import hr.fer.ztel.domain.QuizHolder;
import hr.fer.ztel.service.Statistic;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

/**
 * Handles requests for the application home page.
 */
@Controller
@SessionAttributes({ "categories", "category", "workingCategory" })
public class QuestionController {

	private static final Logger logger = LoggerFactory
			.getLogger(HomeController.class);

	@Autowired
	private QuestionDao questionDao;
	@Autowired
	private CategoryDao categoryDao;
	@Autowired
	private ProfessorDao professorDao;
	@Autowired
	private QuizDao quizDao;
	@Autowired
	private Statistic statServis;

	/**
	 * Simply selects the home view to render by returning its name.
	 */

	@RequestMapping(value = "/NewQuestion", method = RequestMethod.GET)
	public String home(Model model, HttpServletRequest request) {
		model.addAttribute("question", new Question());
		String requestString = request.getQueryString();
		String category = requestString.replaceAll("\\D+", "");
		Long cat = Long.parseLong(category);

		model.addAttribute("category", categoryDao.find(cat));

		return "NewQuestion";
	}

	@RequestMapping(value = "/formsubmit", method = RequestMethod.POST)
	public String home(Model model, @ModelAttribute("question") Question q,
			HttpServletRequest request) {
		QuestionHolder holder = new QuestionHolder();
		holder.setQuestion(q);

		for (int i = 0; i < q.getNumberOfCorrectAnswers(); i++) {
			holder.addCorrectAnswer(new CorrectAnswer());
		}
		for (int i = 0; i < q.getNumberOfIncorrectAnswers(); i++) {
			holder.addIncorrectAnswer(new IncorrectAnswer());
		}
		model.addAttribute("questionHolder", holder);
		model.addAttribute("categories", categoryDao.list());

		return "AddQuestion";
	}

	@RequestMapping(value = "/questionAdded", method = RequestMethod.POST)
	public String added(
			@ModelAttribute("questionHolder") QuestionHolder holder,
			HttpServletRequest request, Model model, Principal principal)
			throws IOException {

		for (CorrectAnswer ca : holder.getCorrectAnswers()) {
			ca.setAnswerToQuestion(holder.getQuestion());
			// System.out.println("Correct answer: " + ca.getTextAnswer());
		}
		for (IncorrectAnswer ica : holder.getIncorrectAnswers()) {
			ica.setAnswerToQuestion(holder.getQuestion());
			// System.out.println("Incorrect answer: " + ica.getTextAnswer());
		}

		holder.getQuestion().setCorrectAnswers(holder.getCorrectAnswers());
		holder.getQuestion().setIncorrectAnswers(holder.getIncorrectAnswers());

		// System.out.println(holder.getQuestion().getCategory().getCategoryName()
		// + " " + holder.getQuestion().getCategory().getIdCategory());

		// Set category name, found by id given by AddQuestion.jsp
		// holder.getQuestion().getCategory().setCategoryName(categoryDao.find(holder.getQuestion().getCategory().getIdCategory()).getCategoryName());
		System.out.println("TEST: "
				+ holder.getQuestion().getCategory().getIdCategory());
		// Read username from session.
		Professor prof = professorDao.getProfessorByUsername(principal
				.getName());
		/*
		 * prof = new Professor(); prof.setDepartment("zpm");
		 * prof.setName("ivo"); prof.setPassword("noPass");
		 * prof.setSurname("ivic"); prof.setUsername("iivicC");
		 */

		holder.getQuestion().setCreator(prof);

		System.out.println("creator:" + holder.getQuestion().getCreator());
		System.out.println("qu: " + holder.getQuestion());
		System.out.println("cor: " + holder.getQuestion().getCorrectAnswers());
		System.out
				.println("inc: " + holder.getQuestion().getIncorrectAnswers());

		// holder.getQuestion().setCategory(cat);
		// System.out.println("cat " +
		// holder.getQuestion().getCategory().getCategoryName());

		questionDao.add(holder.getQuestion());

		return "closer";
	}

	@RequestMapping(value = "/Questions/jax/", method = RequestMethod.GET)
	public @ResponseBody
	Question getQ(HttpServletResponse res) {
		/*
		 * Cat cat = new cat; cat.setcatname cat.setidcat; ret cat
		 */
		Question q = new Question();
		q.setIdQuestion(0);
		return q;
	}

	@RequestMapping(value = "/Questions/jax/deletequestion", method = RequestMethod.POST)
	public @ResponseBody
	Question addQ(@RequestBody final Question question) {
		System.out.println("u restu za brisanje pitanja sam");
		System.out.println(question.getIdQuestion());
		Quiz q = quizDao.find(Long.parseLong(question.getTextQuestion()));
		q.deleteQuestion(question.getIdQuestion());
		quizDao.update(q);
		System.out.println("pitanje obrisano");
		return question;
	}

	@RequestMapping(value = "/Question/stats/{idQuiz}/{idQuestion}", method = RequestMethod.GET)
	public String getQuestionStats(@PathVariable("idQuestion") Long idQuestion,
			@PathVariable("idQuiz") Long idQuiz, Model model) {

		model.addAttribute("idQuestion", idQuestion);
		model.addAttribute("idQuiz", idQuiz);
		return "SingleStatistic";
	}

	@RequestMapping(value = "/Questions/overview", method = RequestMethod.GET)
	public String questionsOverview(Model model, Principal pr, HttpServletRequest request) {
		String requestString = request.getQueryString();
		String category = requestString.replaceAll("\\D+", "");
		Long cat = Long.parseLong(category);
		model.addAttribute("workingCategory",category);
		List<Question> questions = professorDao.getProfessorByUsername(
				(pr.getName())).getNotusedQuestion(cat);
		if (!questions.isEmpty())
			model.addAttribute("questions", questions);
		System.out.println("cat: " + cat + " questions: " + questions);
		return "QuestionsOverview";
	}

	@RequestMapping(value = "/Questions/overview/delete", method = RequestMethod.GET)
	public String questionDeleted(Model model, Principal pr,
			HttpServletRequest request, @ModelAttribute("workingCategory") String cat) {
		String requestString = request.getQueryString();
		String questionId = requestString.replaceAll("\\D+", "");
		
		Long que = Long.parseLong(questionId);
		
		Question deletingQuestion = questionDao.find(que);
		questionDao.remove(deletingQuestion);
		List<Question> questions = professorDao.getProfessorByUsername(
				(pr.getName())).getNotusedQuestion(Long.parseLong(cat));
		if (!questions.isEmpty())
			model.addAttribute("questions", questions);
		return "QuestionsOverview";
	}

}
