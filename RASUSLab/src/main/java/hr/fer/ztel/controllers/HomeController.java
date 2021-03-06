package hr.fer.ztel.controllers;

import hr.fer.ztel.dao.CategoryDao;
import hr.fer.ztel.dao.CorrectAnswerDao;
import hr.fer.ztel.dao.ProfessorDao;
import hr.fer.ztel.dao.QuestionDao;
import hr.fer.ztel.dao.QuizDao;
import hr.fer.ztel.dao.StatisticPictureDao;
import hr.fer.ztel.service.Statistic;

import java.io.IOException;
import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;


import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

/**
 * Handles requests for the application home page.
 */
@Controller
@SessionAttributes({ "serverTime" })
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

		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG,
				DateFormat.LONG, locale);
		System.out.println(model.get("serverTime"));
		String formattedDate = dateFormat.format(date);

		model.addAttribute("serverTime", formattedDate
				+ "Ja sam index a ti nisi");

		System.out.println(model.get("serverTime"));

		// Quiz tem = b.find(new Long(38));
		// System.out.println("brisemo kviz" + tem);
		// b.remove(tem);

//		b.add(b.find(new Long(42)).clone("novikod"));
		return "Index";
	}
}
