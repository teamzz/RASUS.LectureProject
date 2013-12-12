package hr.fer.ztel.controllers;

import java.io.IOException;
import java.util.HashSet;

import javax.servlet.http.HttpServletRequest;

import hr.fer.ztel.dao.CategoryDao;
import hr.fer.ztel.dao.ProfessorDao;
import hr.fer.ztel.dao.QuestionDao;
import hr.fer.ztel.domain.Question;
import hr.fer.ztel.domain.QuestionHolder;
import hr.fer.ztel.domain.CorrectAnswer;
import hr.fer.ztel.domain.IncorrectAnswer;
import hr.fer.ztel.domain.Professor;





import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class QuestionController {

	private static final Logger logger = LoggerFactory
			.getLogger(HomeController.class);

	@Autowired
	private QuestionDao questionDao;
	@Autowired
	private CategoryDao categoryDao;
	@Autowired
	private ProfessorDao professorDao;

	/**
	 * Simply selects the home view to render by returning its name.
	 */

	@RequestMapping(value = "/NewQuestion", method = RequestMethod.GET)
	public String home(Model model) {
		model.addAttribute("question", new Question());
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
		model.addAttribute("categories",categoryDao.list());
		return "AddQuestion";
	}

	@RequestMapping(value = "/questionAdded", method = RequestMethod.POST)
	public String added(
			@ModelAttribute("questionHolder") QuestionHolder holder,
			HttpServletRequest request,Model model) throws IOException {

		for (CorrectAnswer ca : holder.getCorrectAnswers()) {
			ca.setAnswerToQuestion(holder.getQuestion());
			//System.out.println("Correct answer: " + ca.getTextAnswer());
		}
		for (IncorrectAnswer ica : holder.getIncorrectAnswers()) {
			ica.setAnswerToQuestion(holder.getQuestion());
			//System.out.println("Incorrect answer: " + ica.getTextAnswer());
		}

		holder.getQuestion().setCorrectAnswers(holder.getCorrectAnswers());
		holder.getQuestion().setIncorrectAnswers(holder.getIncorrectAnswers());
		//System.out.println(holder.getQuestion().getCategory().getCategoryName() + " " + holder.getQuestion().getCategory().getIdCategory());
		
		//Set category name, found by id given by AddQuestion.jsp
		holder.getQuestion().getCategory().setCategoryName(categoryDao.find(holder.getQuestion().getCategory().getIdCategory()).getCategoryName());
		//Read username from session.		
		Professor prof = professorDao.getProfessorByUsername("iivic");
		/*
		 prof = new Professor();
		prof.setDepartment("zpm");
		prof.setName("ivo");
		prof.setPassword("noPass");
		prof.setSurname("ivic");
		prof.setUsername("iivicC");
		*/
		
		holder.getQuestion().setCreator(prof);
		
		System.out.println("creator:" + holder.getQuestion().getCreator());
		System.out.println("qu: " + holder.getQuestion());
		System.out.println("cor: " + holder.getQuestion().getCorrectAnswers());
		System.out.println("inc: " + holder.getQuestion().getIncorrectAnswers());
		
		//holder.getQuestion().setCategory(cat);
		//System.out.println("cat " + holder.getQuestion().getCategory().getCategoryName());

		questionDao.add(holder.getQuestion());

		return "QuestionsAdded";
	}

}
