package hr.fer.ztel.controllers;

import hr.fer.ztel.dao.CategoryDao;
import hr.fer.ztel.dao.CorrectAnswerDao;
import hr.fer.ztel.dao.ProfessorDao;
import hr.fer.ztel.dao.QuestionDao;
import hr.fer.ztel.dao.QuizDao;
import hr.fer.ztel.dao.StatisticPictureDao;
import hr.fer.ztel.domain.Category;
import hr.fer.ztel.domain.CorrectAnswer;
import hr.fer.ztel.domain.IncorrectAnswer;
import hr.fer.ztel.domain.Professor;
import hr.fer.ztel.domain.Question;
import hr.fer.ztel.domain.QuestionInQuizInformation;
import hr.fer.ztel.domain.Quiz;
import hr.fer.ztel.domain.StatisticPicture;
import hr.fer.ztel.service.Statistic;

import java.io.IOException;
import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Locale;
import java.util.Map.Entry;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.ImageIcon;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

/**
 * Handles requests for the application home page.
 */
@Controller
@SessionAttributes({ "serverTime", "picture" })
public class HomeController {

	private static final Logger logger = LoggerFactory
			.getLogger(HomeController.class);
	@Autowired
	private QuestionDao a;

	@Autowired
	private QuizDao b;

	@Autowired
	private CategoryDao cd;

	@Autowired
	private CorrectAnswerDao cad;

	@Autowired
	private ProfessorDao p;

	@Autowired
	private Statistic stat;
	@Autowired
	private StatisticPictureDao statdao;

	/**
	 * Simply selects the home view to render by returning its name.
	 * 
	 * @throws IOException
	 */
	@RequestMapping(value = "/abcd", method = RequestMethod.GET)
	public String home(Locale locale, ModelMap model,
			HttpServletResponse response) throws IOException {
		logger.info("Welcome home! The client locale is {}.", locale);
		Question qu = a.find(new Long(63));
		Quiz qvuiz = b.find(new Long(23));

		StatisticPicture picture = statdao.find(qvuiz, qu);
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG,
				DateFormat.LONG, locale);
		System.out.println(model.get("serverTime"));
		String formattedDate = dateFormat.format(date);
		// System.out.println("cajaaaa");
		model.addAttribute("serverTime", formattedDate
				+ "Ja sam index a ti nisi");
		model.addAttribute("picture", picture);
		System.out.println(model.get("serverTime"));

		// response.setContentType("image/jpeg");
		// response.getOutputStream().write(picture.getPicture());
		// System.out.println(a);
		// System.out.println(b);
		// model.addAttribute("broj", new Integer(0));
		//
		// System.out.println(p.find(new Long("26")).getQuestions());
		// System.out.println(p.find(new Long("27")).getQuestions());
		//
		// for (Question q : a.list()) {
		// System.out.println(q);
		//
		// }
		//
		// for (Professor prof : p.list()) {
		// System.out.println(prof.getQuestions());
		// }
		//
		// for (Quiz qu : b.list()) {
		// System.out.println(qu);
		// System.out.println(qu.getCreator() + " "
		// + qu.getCreator().getName());
		// }
		//
		// System.out.println(cad.list().size());
		// for (CorrectAnswer cc : cad.list()) {
		// System.out.println(cc);
		// }
		//
		// System.out.println(cd.list().size());
		//
		// Quiz a1 = new Quiz();
		// a1.setCreator(p.find(new Long(24)));
		// a1.setCategory(cd.find(new Long(32)));
		// a1.setQuizName("lalal");
		//
		// for (Question question : p.find(new Long(27)).getQuestions()) {
		// System.out.println(question);
		// }
		//
		// for (Question question : a.list()) {
		// System.out.println(question);
		// }
		//

		// for (Quiz quiz : b.list()) {
		// stat.calculateStatisticForQuiz(quiz.getIdQuiz(), 600, 600);
		// }

		// for (Quiz quiz : b.list()) {
		//
		// System.out.println(quiz.getQuizName());
		// for (Entry<Integer, QuestionInQuizInformation> questioninfo : quiz
		// .getQuestions().entrySet()) {
		// System.out.println("Pitanja u kvizu------------------------");
		// System.err.println("Redni broj pitanja "
		// + questioninfo.getKey()
		// + " tekst pitanja= "
		// + questioninfo.getValue().getQuestion()
		// .getTextQuestion() + " aktivno="
		// + questioninfo.getValue().getActivated());
		// }
		//
		// }

		// Quiz a = b.find(new Long(23));
		// System.out.println(a.getQuestionsInformation().get(new Integer(1))
		// .getFinished());

		// a.getQuestionsInformation().remove(new Integer(1));
		// System.out.println(a.getQuestionsInformation().size());
		// a.setCode("222");
		// b.update(a);
		return "Index";
	}

	@RequestMapping("/getStatistic/{idQuestion}/{idQuiz}")
	public @ResponseBody
	byte[] getPhoto(@PathVariable("idQuestion") final Long idQuestion,
			@PathVariable("idQuiz") final Long idQuiz) throws IOException {

		byte[] imageBytes = stat.createPieChartForQuestionInQuiz(idQuiz,
				idQuestion, 600, 400).getPicture();

		return imageBytes;
	}
}
