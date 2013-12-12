package hr.fer.ztel.domain;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

public class QuestionHolder {
	private Question question;
	private List<CorrectAnswer> correctAnswers = new ArrayList<CorrectAnswer>();
	private List<IncorrectAnswer> incorrectAnswers = new ArrayList<IncorrectAnswer>();
	
	
	public Question getQuestion() {
		return question;
	}
	public void setQuestion(Question question) {
		this.question = question;
	}
	public List<CorrectAnswer> getCorrectAnswers() {
		return correctAnswers;
	}
	public void addCorrectAnswer(CorrectAnswer correctAnswer){
		correctAnswers.add(correctAnswer);
	}
	public void addIncorrectAnswer(IncorrectAnswer incorrectAnswer){
		incorrectAnswers.add(incorrectAnswer);
	}
	public void setCorrectAnswers(List<CorrectAnswer> correctAnswers) {
		this.correctAnswers = correctAnswers;
	}
	public List<IncorrectAnswer> getIncorrectAnswers() {
		return incorrectAnswers;
	}
	public void setIncorrectAnswers(List<IncorrectAnswer> incorrectAnswers) {
		this.incorrectAnswers = incorrectAnswers;
	}
}
