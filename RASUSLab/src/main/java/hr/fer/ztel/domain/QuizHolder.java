package hr.fer.ztel.domain;

import java.io.Serializable;

public class QuizHolder implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 8740367013878285527L;
	private Quiz quiz;
	private long idCategory;
	private long idProfessor;
	private long[] questionsIdList;

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

	public long[] getQuestionsIdList() {
		return questionsIdList;
	}

	public void setQuestionsIdList(long[] questionsIdList) {
		System.out.println("doda");
		this.questionsIdList = questionsIdList;
	}

}
