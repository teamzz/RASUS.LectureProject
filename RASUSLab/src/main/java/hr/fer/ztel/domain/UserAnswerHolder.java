package hr.fer.ztel.domain;

import java.util.ArrayList;

public class UserAnswerHolder {

	private ArrayList<String> userAnswers = new ArrayList<String>();
	public ArrayList<String> getUserAnswers() {
		return userAnswers;
	}



	public void setUserAnswers(ArrayList<String> userAnswers) {
		this.userAnswers = userAnswers;
	}



	public ArrayList<String> getQuestionsId() {
		return questionsId;
	}



	public void setQuestionsId(ArrayList<String> questionsId) {
		this.questionsId = questionsId;
	}


	private ArrayList<String> questionsId = new ArrayList<String>();
	private long idQuiz;
	
	public UserAnswerHolder()
	{}



	public long getIdQuiz() {
		return idQuiz;
	}


	public void setIdQuiz(long idQuiz) {
		this.idQuiz = idQuiz;
	}
	
}
