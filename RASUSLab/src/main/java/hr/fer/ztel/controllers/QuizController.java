package hr.fer.ztel.controllers;

import java.io.IOException;
import java.security.Principal;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import hr.fer.ztel.dao.CategoryDao;
import hr.fer.ztel.dao.ProfessorDao;
import hr.fer.ztel.dao.QuestionDao;
import hr.fer.ztel.dao.QuizDao;
import hr.fer.ztel.dao.UserAnswerDao;
import hr.fer.ztel.domain.Category;
import hr.fer.ztel.domain.Professor;
import hr.fer.ztel.domain.Question;
import hr.fer.ztel.domain.QuestionInQuizInformation;
import hr.fer.ztel.domain.Quiz;
import hr.fer.ztel.domain.QuizHolder;
import hr.fer.ztel.domain.UserAnswer;
import hr.fer.ztel.domain.UserAnswerHolder;
import hr.fer.ztel.service.ProfessorService;
import hr.fer.ztel.service.QuizService;
import hr.fer.ztel.service.Statistic;

import org.codehaus.jackson.annotate.JsonIgnoreProperties;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

@Controller
@SessionAttributes("quizholder")
@JsonIgnoreProperties(ignoreUnknown = true)
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

	@Autowired
	private ProfessorService professorService;

	@Autowired
	private QuizService qs;

	@Autowired
	private Statistic statService;


	/**
	 * Prima zahtjev za stvaranje novog kviza u odabranoj kategoriji
	 * @param categoryId - id kategorije u kojoj se kviz stvara
	 * @param model
	 * @param principal
	 * @return
	 */
	@RequestMapping(value = "/AddQuiz/{idCategory}", method = RequestMethod.GET)
	public String addQuiz(@PathVariable("idCategory") Long categoryId,
			Model model, Principal principal) {

		model.addAttribute("quizholder", new QuizHolder());
		model.addAttribute("question", new Question());
		model.addAttribute("category", categoryDao.find(categoryId));
		model.addAttribute("idProfessor",
				professorDao.getProfessorByUsername(principal.getName())
						.getIdProfessor());
		model.addAttribute(
				"questions",
				professorService.getQuestionMadeByProfessorInCategory(
						principal.getName(), categoryId));
		return "AddQuiz";
	}

	/**
	 * 
	 * @param res
	 * @return
	 */
	@RequestMapping(value = "/AddQuiz/jax/{idCategory}", method = RequestMethod.GET)
	public @ResponseBody
	Question getQ(HttpServletResponse res) {
		/*
		 * Cat cat = new cat; cat.setcatname cat.setidcat; ret cat
		 */
		Question q = new Question();
		q.setIdQuestion(0);
		return q;
	}

	/**
	 * AJAX kontroler koji prima podatke o pitanju koje je potrebno dodati kvizu
	 * @param question
	 * @param qh
	 */
	@RequestMapping(value = "/AddQuiz/jax/addquestion", method = RequestMethod.POST)
	public @ResponseBody
	void addQ(@RequestBody final Question question,
			@ModelAttribute("quizholder") QuizHolder qh) {
		System.out.println(question.getIdQuestion());
		qh.addQuestion(question.getIdQuestion());
		System.out.println(qh.getQuestionsIdList().size());

	}

	/**
	 * Kontroler koji iz session atributa "quizholder" 
	 * i prethodno dodanih pitanja u session atribut
	 * stvara novi kviz
	 * @param quizHolder - session atribut
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/AddQuiz/formsubmit", method = RequestMethod.POST)
	public String saveEdit(@ModelAttribute("quizholder") QuizHolder quizHolder,
			Model model) {
		if (quizHolder == null) {
			return "entry";
		}
		logger.debug("Received request to add quiz");
		System.out.println("add quiz kontroler");
		Quiz quiz = quizHolder.getQuiz();
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
			System.out.println("dodajem pitanje kviza " + questionId);

			QuestionInQuizInformation qqinfo = new QuestionInQuizInformation();
			qqinfo.setQuestion(questionDao.find(questionId));
			qqinfo.setActivated(false);
			qqinfo.setFinished(false);
			qqinfo.setQuiz(quiz);
			quiz.addQuestionInQuizInformation(qqinfo);
		}
		for (Question q : questionsList) {
			System.out.println(q);
		}
		System.out.println("dodajem kviz\n");

		for (Question q : questionDao.list()) {
			System.out.println(q);
		}

		quizDao.add(quiz);

		model.addAttribute("quizes", quizDao.list());
		return "closer";
	}

	/**
	 * Kontroler za rješavanje kviza - na temelju koda kviza
	 * vraća stranicu sa trenutno aktivnim pitanjem
	 * @param codeQuiz - kod kviza koji se rješava
	 * @param model
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "/SolveQuiz/{codeQuiz}", method = RequestMethod.GET)
	public String solveQ(@PathVariable("codeQuiz") String codeQuiz,
			Model model, HttpServletResponse response) {
		UserAnswerHolder uah = new UserAnswerHolder();

		Quiz playQuiz = qs.getQuizByCode(codeQuiz);
		if (playQuiz != null) {
			if (playQuiz.isActivated())
			{
				model.addAttribute("quiz", playQuiz);
				return "EndQuizInfo";
			}
			System.out.println("playQuiz id: " + playQuiz.getIdQuiz());
			uah.setIdQuiz(playQuiz.getIdQuiz());
			model.addAttribute("quizCode", codeQuiz);
			model.addAttribute("idQuiz", playQuiz.getIdQuiz());
			if (playQuiz.getActivatedQuestion() != null) {
				System.out.println("question id "
						+ playQuiz.getNextNotactivatedQuestion().getQuestion()
								.getIdQuestion());
				// response.addCookie(new Cookie("id_question",
				// String.valueOf(playQuiz.getNextNotactivatedQuestion().getQuestion().getIdQuestion())));
				model.addAttribute("questionInQuiz",
						playQuiz.getActivatedQuestion());
				model.addAttribute("idQuestionCook", playQuiz
						.getActivatedQuestion().getQuestion().getIdQuestion());
				return "SolveQuiz";
			} else {
				System.out.println("null vracam");
				return "SolveQuiz";
			}
		} else
			return "entry";

	}

	/**
	 * Kontroler za rješavanje cjelokupnog kviza odjednom
	 * korisniku se vraća stranica sa prikazanim svim pitanjima
	 * (trenutno se ne koristi u projektu)
	 * @param codeQuiz
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/SolveSimpleQuiz/{codeQuiz}", method = RequestMethod.GET)
	public String solveQuiz(@PathVariable("codeQuiz") String codeQuiz,
			Model model) {
		UserAnswerHolder uah = new UserAnswerHolder();

		Quiz playQuiz = qs.getQuizByCode(codeQuiz);
		if (playQuiz != null) {
			System.out.println("playQuiz id: " + playQuiz.getIdQuiz());
			uah.setIdQuiz(playQuiz.getIdQuiz());
			model.addAttribute("quizCode", codeQuiz);
			model.addAttribute("questions", quizDao.find(playQuiz.getIdQuiz())
					.getQuestions());
			model.addAttribute("ansOfQuestions", uah);
			return "SolveSimpleQuiz";
		} else
			return null;
	}

	/**
	 * Kontroler koji prima odgovore na sva pitanja jednog kviza
	 * (trenutno se ne koristi u projektu)
	 * @param ansToQuestions
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/SolveSimpleQuiz/formsubmit", method = RequestMethod.POST)
	public String submitQuiz(
			@ModelAttribute("ansOfQuestions") UserAnswerHolder ansToQuestions,
			Model model) {

		int numOfQuestions = ansToQuestions.getQuestionsId().size();

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
		return "entry";

	}

	/**
	 * Kontroler za upravljanje kvizom
	 * Vraća stranicu za upravljanje prvim neaktiviranim pitanjem
	 * @param idQuiz - ID kviza kojim korisnik upravlja
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/ManageQuiz/{idQuiz}", method = RequestMethod.GET)
	public String manageQuiz(@PathVariable("idQuiz") Long idQuiz, Model model) {

		Quiz manageQuiz = quizDao.find(idQuiz);
		if (manageQuiz != null) {
			System.out.println("playQuiz id: " + manageQuiz.getIdQuiz());
			model.addAttribute("quizCode", manageQuiz.getCode());
			model.addAttribute("idQuiz", idQuiz);
			if (manageQuiz.getNextNotactivatedQuestion() != null) {
				model.addAttribute("questionInQuiz",
						manageQuiz.getNextNotactivatedQuestion());
				model.addAttribute("ansOfQuestion", manageQuiz
						.getNextNotactivatedQuestion().getQuestion()
						.getAnswers());
				return "ManageQuiz";
			} else {
				model.addAttribute("quiz", manageQuiz);
				manageQuiz.setActivated(true);
				quizDao.update(manageQuiz);
				return "EndQuizInfo";
			}
		} else
			return null;
	}

	/**
	 * Kontroler koji vraća statistiku za pojedino pitanje određenog kviza
	 * @param idQuestion - ID pitanja
	 * @param idQuiz - ID kviza
	 * @return slika statistike u byte array-u (byte[])
	 * @throws IOException
	 */
	@RequestMapping("/getStatistic/{idQuestion}/{idQuiz}")
	public @ResponseBody
	byte[] getPhoto(@PathVariable("idQuestion") final Long idQuestion,
			@PathVariable("idQuiz") final Long idQuiz) throws IOException {

		byte[] imageBytes = statService.createPieChartForQuestionInQuiz(idQuiz,
				idQuestion, 600, 600).getPicture();

		return imageBytes;
	}

	/**
	 * Kontroler koji prima zahtjev za stvaranje novog kviza na temelju postojećeg
	 * @param quizId
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/ReactivateQuiz/{idQuiz}", method = RequestMethod.GET)
	public String reactivateQuiz(@PathVariable("idQuiz") Long quizId,
			Model model) {
		model.addAttribute("quiz", quizDao.find(quizId));
		
		return "ReactivateQuiz";
	}
	
	/**
	 * Kontroler koji prima informacije o novom kvizu napravljenom na temelju postojećeg
	 * @param quiz
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/ReactivateQuiz/formsubmit", method = RequestMethod.POST)
	public String saveReactivQuiz(@ModelAttribute("quiz") Quiz quiz,
			Model model) {
		if (quiz == null) {
			return "entry";
		}
		System.out.println("Reaktivacija kviza");
		Quiz getQuiz = quizDao.find(quiz.getIdQuiz());
		Quiz qnew = getQuiz.clone(quiz.getCode());
		quizDao.add(qnew);

		return "closer";
	}
	
}
