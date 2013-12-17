package hr.fer.ztel.controllers;

import java.security.Principal;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

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

import org.codehaus.jackson.annotate.JsonIgnoreProperties;
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

	// add quiz
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	
	@RequestMapping(value = "/AddQuiz/{idCategory}", method = RequestMethod.GET)
	public String home(@PathVariable("idCategory") Long categoryId, Model model, Principal principal) {
		
		model.addAttribute("quizholder", new QuizHolder());
		model.addAttribute("question", new Question());
		model.addAttribute("idProfessor", professorDao.getProfessorByUsername(principal.getName()).getIdProfessor());
		model.addAttribute("questions", professorService.getQuestionMadeByProfessorInCategory(principal.getName(), categoryId));
		return "AddQuiz";
	}

	
	@RequestMapping(value="/AddQuiz/jax/{idCategory}", method = RequestMethod.GET)
	  public @ResponseBody Question getQ(HttpServletResponse res) {
		/*
		   * Cat cat = new cat;
		   * cat.setcatname
		   * cat.setidcat;
		   * ret cat
		   */
		Question q = new Question();
		q.setIdQuestion(0);
	      return q;
	  }
	  
	
	  @RequestMapping(value = "/AddQuiz/jax/addquestion", method = RequestMethod.POST)
		public @ResponseBody void addQ(@RequestBody final Question question, @ModelAttribute("quizholder") QuizHolder qh)
		{
		  System.out.println("u restu za dodavanje pitanja sam");
			System.out.println(question.getIdQuestion());
			qh.addQuestion(question.getIdQuestion());
			System.out.println(qh.getQuestionsIdList().size());
			
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

	@RequestMapping(value = "/SolveSimpleQuiz/{codeQuiz}", method = RequestMethod.GET)
	public String solveQuiz(@PathVariable ("codeQuiz") String codeQuiz, Model model) {
		UserAnswerHolder uah = new UserAnswerHolder();
		
		Quiz playQuiz = qs.getQuizByCode(codeQuiz);
		if (playQuiz!=null){
		System.out.println("playQuiz id: " + playQuiz.getIdQuiz());
		uah.setIdQuiz(playQuiz.getIdQuiz());
		model.addAttribute("quizCode", codeQuiz);
		model.addAttribute("questions", quizDao.find(playQuiz.getIdQuiz()).getQuestions());
		model.addAttribute("ansOfQuestions", uah);
		return "SolveSimpleQuiz";
		}
		else return null;
	}

	/**
	 * Simply selects the home view to render by returning its name.
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
	
	@RequestMapping(value = "/ManageQuiz/{idQuiz}", method = RequestMethod.GET)
	public String manageQuiz(@PathVariable ("idQuiz") Long idQuiz, Model model) {
		
		Quiz manageQuiz = quizDao.find(idQuiz);
		if (manageQuiz!=null){
		System.out.println("playQuiz id: " + manageQuiz.getIdQuiz());
		
		model.addAttribute("idQuiz", idQuiz);
		if (manageQuiz.getNextNotactivatedQuestion() != null)
		{
		model.addAttribute("questionInQuiz", manageQuiz.getNextNotactivatedQuestion());
		model.addAttribute("ansOfQuestion", manageQuiz.getNextNotactivatedQuestion().getQuestion().getAnswers());
		return "ManageQuiz";
		}
		else
		{
			manageQuiz.setActivated(true);
			quizDao.update(manageQuiz);
			return "EndQuizInfo";
		}
		}
		else return null;
	}
	
}
