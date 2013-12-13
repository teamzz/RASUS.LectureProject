package hr.fer.ztel.domain;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "statistic_picture")
public class StatisticPicture implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1471641816292409980L;

	@Id
	@ManyToOne
	@JoinColumn(name = "idquiz")
	private Quiz quiz;

	@Id
	@ManyToOne
	@JoinColumn(name = "idquestion")
	private Question question;

	@Column(name = "picture")
	private byte[] picture;

	public Quiz getQuiz() {
		return quiz;
	}

	public void setQuiz(Quiz quiz) {
		this.quiz = quiz;
	}

	public Question getQuestion() {
		return question;
	}

	public void setQuestion(Question question) {
		this.question = question;
	}

	public byte[] getPicture() {
		return picture;
	}

	public void setPicture(byte[] picture) {
		this.picture = picture;
	}

}
