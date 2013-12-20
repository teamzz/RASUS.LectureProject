package hr.fer.ztel.controllers;

import java.security.Principal;
import java.util.List;

import hr.fer.ztel.dao.CategoryDao;
import hr.fer.ztel.dao.QuestionDao;
import hr.fer.ztel.dao.QuestionInQuizInformationDAO;
import hr.fer.ztel.dao.QuizDao;
import hr.fer.ztel.dao.UserAnswerDao;
import hr.fer.ztel.domain.AjaxQuestionSubmit;
import hr.fer.ztel.domain.AjaxQuizQuestionTransport;
import hr.fer.ztel.domain.Category;
import hr.fer.ztel.domain.Question;
import hr.fer.ztel.domain.QuestionInQuizInformation;
import hr.fer.ztel.domain.Quiz;
import hr.fer.ztel.domain.UserAnswer;
import hr.fer.ztel.service.ProfessorService;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class RestController {

	@Autowired
	CategoryDao categoryDao;
	@Autowired
	QuestionDao questionDao;
	@Autowired
	QuizDao quizDao;
	@Autowired
	QuestionInQuizInformationDAO qiqDao;
	@Autowired
	ProfessorService profSer;
	@Autowired
	UserAnswerDao userAnswerDao;

	public RestController() {
		System.out.println("init RestController");
	}

	@RequestMapping(value = "/Categories/jax", method = RequestMethod.GET)
	public @ResponseBody
	Category getCategory(HttpServletResponse res) {
//		System.out.println("u GET kontroleru sam");
		Category cat = new Category();
		cat.setIdCategory(4);
		return cat;
	}

	// this method response to POST request
	// http://localhost/spring-mvc-json/rest/cont/person
	// receives json data sent by client --> map it to Person object
	// return Person object as json
	@RequestMapping(value = "/Categories/jax/getCategory", method = RequestMethod.POST)
	public @ResponseBody
	List<Quiz> postCategory(@RequestBody final Category cat, Principal principal) {
//		System.out.println("u POST kontroleru sam,cat: "
//				+ cat.getCategoryName());
		// make List<Quiz> with all quiz under category cat.getIdCategory() and
		// made by professor!!!;
		Category c = categoryDao.find(cat.getIdCategory());
		List<Quiz> quizzes = profSer.getQuizMadeByProfessorInCategory(
				principal.getName(), cat.getIdCategory());
		Quiz a = new Quiz();
		Quiz b = new Quiz();
		a.setCategory(c);
		b.setCategory(c);
		a.setIdQuiz(6);
		b.setIdQuiz(7);
		a.setQuizName("quizA");
		b.setQuizName("quizB");
		quizzes.add(a);
		quizzes.add(b);

		return quizzes;
	}

	@RequestMapping(value = "/Quizes/jax", method = RequestMethod.GET)
	public @ResponseBody
	Quiz get(HttpServletResponse res) {
		/*
		 * Cat cat = new cat; cat.setcatname cat.setidcat; ret cat
		 */
		Quiz q = new Quiz();

		return q;
	}

	// this method response to POST request
	// http://localhost/spring-mvc-json/rest/cont/person
	// receives json data sent by client --> map it to Person object
	// return Person object as json
	@RequestMapping(value = "/Quizes/jax/changeactivequiz", method = RequestMethod.POST)
	public @ResponseBody
	Quiz changeActiveQuiz(@RequestBody final Quiz q) {
		if (!q.isActivated()) {
			Quiz qnew = quizDao.find(q.getIdQuiz());
			q.setCode(qnew.getCode());
			q.setActivated(true);
			return q;
		} else {
			Quiz qnew = quizDao.find(q.getIdQuiz());
			qnew.setActivated(true);
			quizDao.update(qnew);
			q.setCode(qnew.getCode());
			q.setActivated(false);
			return q;
		}

	}

	@RequestMapping(value = "/ManageQuiz/jax", method = RequestMethod.GET)
	public @ResponseBody
	AjaxQuizQuestionTransport getManageQuiz(HttpServletResponse res) {
		/*
		 * Cat cat = new cat; cat.setcatname cat.setidcat; ret cat
		 */
		AjaxQuizQuestionTransport q = new AjaxQuizQuestionTransport();

		return q;
	}

	@RequestMapping(value = "/ManageQuiz/jax/changeactivequestion", method = RequestMethod.POST)
	public @ResponseBody
	AjaxQuizQuestionTransport activateQ(
			@RequestBody final AjaxQuizQuestionTransport qQuiz) {
		System.out.println("aktiviram pitanje");
		QuestionInQuizInformation qif = qiqDao.find(qQuiz.getIdQuestion(),
				qQuiz.getIdQuiz());
		
		if (qif.getActivated()) {
			qif.setActivated(false);
			qif.setFinished(true);
			qQuiz.setActivated(false);

		} else {
			qif.setActivated(true);
			qQuiz.setActivated(true);
		}
		qiqDao.update(qif);
		return qQuiz;
		
	}
	
	@RequestMapping(value = "/SolveQuiz/jax", method = RequestMethod.GET)
	public @ResponseBody
	AjaxQuestionSubmit getSolveQuiz(HttpServletResponse res) {
		/*
		 * Cat cat = new cat; cat.setcatname cat.setidcat; ret cat
		 */
		AjaxQuestionSubmit q = new AjaxQuestionSubmit();

		return q;
	}
	
	@RequestMapping(value = "/SolveQuiz/jax/submitanswer", method = RequestMethod.POST)
	public @ResponseBody
	AjaxQuestionSubmit submitAnswer(
			@RequestBody final AjaxQuestionSubmit uah) {
		System.out.println("submitam odgovor");
		
		Quiz quiz = quizDao.find(uah.getIdQuiz());
		Question question = questionDao.find(uah.getIdQuestion());
		String answer = uah.getAnswer();
		UserAnswer uAnswer = new UserAnswer();
		uAnswer.setQuestion(question);
		uAnswer.setQuiz(quiz);
		uAnswer.setUserAnswer(answer);
		
		userAnswerDao.add(uAnswer);
		
		return uah;
		
	}
	
	
	
	@RequestMapping(value = "/Quiz/jax/deletequiz", method = RequestMethod.POST)
	public @ResponseBody
	Quiz deleteQuiz(
			@RequestBody final Quiz uah) {
		
		Quiz quiz = quizDao.find(uah.getIdQuiz());
		quizDao.remove(quiz);
		return uah;
		
	}

}
