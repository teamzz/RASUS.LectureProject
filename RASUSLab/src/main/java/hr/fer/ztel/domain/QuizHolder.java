package hr.fer.ztel.domain;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class QuizHolder implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 8740367013878285527L;
	private Quiz quiz;
	private long idCategory;
	private long idProfessor;
	private List<Long> questionsIdList = new ArrayList<Long>();

	public QuizHolder() {

	}

	public Quiz getQuiz() {
		return quiz;
	}

	public void setQuiz(Quiz quiz) {
		this.quiz = quiz;
	}

	public long getIdCategory() {
		return idCategory;
	}

	public void setIdCategory(long idCategory) {
		this.idCategory = idCategory;
	}

	public long getIdProfessor() {
		return idProfessor;
	}

	public void setIdProfessor(long idProfessor) {
		this.idProfessor = idProfessor;
	}

	
	
	public void addQuestion(Long questionId)
	{
		System.out.println("dodajem pitanje");
		questionsIdList.add(questionId);
	}

	public List<Long> getQuestionsIdList() {
		return questionsIdList;
	}

	public void setQuestionsIdList(List<Long> questionsIdList) {
		this.questionsIdList = questionsIdList;
	}

}
