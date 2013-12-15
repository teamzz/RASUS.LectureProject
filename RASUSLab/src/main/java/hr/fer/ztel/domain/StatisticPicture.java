package hr.fer.ztel.domain;

import java.io.Serializable;
import java.util.Arrays;

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

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + Arrays.hashCode(picture);
		result = prime * result
				+ ((question == null) ? 0 : question.hashCode());
		result = prime * result + ((quiz == null) ? 0 : quiz.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		StatisticPicture other = (StatisticPicture) obj;
		if (!Arrays.equals(picture, other.picture))
			return false;
		if (question == null) {
			if (other.question != null)
				return false;
		} else if (!question.equals(other.question))
			return false;
		if (quiz == null) {
			if (other.quiz != null)
				return false;
		} else if (!quiz.equals(other.quiz))
			return false;
		return true;
	}

}
