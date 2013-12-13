package hr.fer.ztel.service;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.imageio.ImageIO;

import org.jfree.chart.ChartFactory;
import org.jfree.chart.ChartRenderingInfo;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.entity.StandardEntityCollection;
import org.jfree.chart.plot.PiePlot;
import org.jfree.data.general.DefaultPieDataset;
import org.jfree.data.general.PieDataset;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import hr.fer.ztel.dao.QuestionDao;
import hr.fer.ztel.dao.QuizDao;
import hr.fer.ztel.dao.StatisticPictureDao;
import hr.fer.ztel.domain.Question;
import hr.fer.ztel.domain.Quiz;
import hr.fer.ztel.domain.StatisticPicture;
import hr.fer.ztel.domain.UserAnswer;

@Service("statistic")
public class Statistic {

	@Autowired
	private UserAnswerService userAnswService;
	@Autowired
	private QuestionDao questionDao;
	@Autowired
	private QuizDao quizDao;
	@Autowired
	private StatisticPictureDao statPictureDao;

	public Statistic() {

	}

	public void getBarChart() {

	}

	public void calculateStatisticForQuiz(Long idQuiz, int width, int height) {

		for (Question question : quizDao.find(idQuiz).getQuestions()) {
			createPieChart(idQuiz, question.getIdQuestion(), width, height);
		}

	}

	public StatisticPicture createPieChart(Long idQuiz, Long idQuestion,
			int width, int height) {

		Question question = questionDao.find(idQuestion);
		Quiz quiz = quizDao.find(idQuiz);
		StatisticPicture statPic = statPictureDao.find(quiz, question);

		if (statPic == null) {

			statPic = drawChart(idQuiz, idQuestion, width, height);

		}
		return statPic;
	}

	private StatisticPicture drawChart(Long idQuiz, Long idQuestion, int width,
			int height) {

		JFreeChart chart = ChartFactory.createPieChart(
				"Statistika za pitanje: "
						+ questionDao.find(idQuestion).getTextQuestion(),
				createDataset(idQuiz, idQuestion), true, true, true);
		PiePlot plot = (PiePlot) chart.getPlot();

		final ChartRenderingInfo info = new ChartRenderingInfo(
				new StandardEntityCollection());
		StatisticPicture tempStatPic = null;
		try {

			ByteArrayOutputStream bas = new ByteArrayOutputStream();
			ImageIO.write(chart.createBufferedImage(width, height), "png", bas);
			bas.flush();
			byte[] tempByteArray = bas.toByteArray();
			tempStatPic = new StatisticPicture();
			tempStatPic.setPicture(tempByteArray);
			tempStatPic.setQuestion(questionDao.find(idQuestion));
			tempStatPic.setQuiz(quizDao.find(idQuiz));
			statPictureDao.add(tempStatPic);
			// final File file1 = new File("piechart.png");
			// System.out.println(file1.getAbsolutePath());
			// ChartUtilities.saveChartAsPNG(file1, chart, 600, 400, info);

			bas.close();
		} catch (IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}

		return tempStatPic;

	}

	private PieDataset createDataset(Long idQuiz, Long idQuestion) {

		DefaultPieDataset data = new DefaultPieDataset();
		List<UserAnswer> answersForQuestion = userAnswService
				.getUserAnswersForQuestionInQuiz(idQuiz, idQuestion);

		Map<String, Integer> numberOfAnswers = new HashMap<String, Integer>();

		for (UserAnswer userAnswer : answersForQuestion) {
			if (numberOfAnswers.containsKey(userAnswer.getUserAnswer())) {
				int tempc = numberOfAnswers.get(userAnswer.getUserAnswer());
				tempc++;
				numberOfAnswers.put(userAnswer.getUserAnswer(), tempc);

			} else {
				numberOfAnswers.put(userAnswer.getUserAnswer(), 1);
			}
		}

		for (Entry<String, Integer> answerCounter : numberOfAnswers.entrySet()) {
			data.setValue(answerCounter.getKey(), answerCounter.getValue());

			// System.out.println("Odgovor je " + answerCounter.getKey()
			// + "....a broj odgvora je " + answerCounter.getValue());

		}

		return data;

	}
}
