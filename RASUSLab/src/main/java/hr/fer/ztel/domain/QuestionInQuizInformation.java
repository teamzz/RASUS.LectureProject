package hr.fer.ztel.domain;

import java.io.Serializable;

import javax.persistence.AssociationOverride;
import javax.persistence.AssociationOverrides;
import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name = "quiz_has_question")
@AssociationOverrides({
		@AssociationOverride(name = "pk.quiz", joinColumns = @JoinColumn(name = "idquiz")),
		@AssociationOverride(name = "pk.question", joinColumns = @JoinColumn(name = "idquestion")) })
public class QuestionInQuizInformation implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -99212824365730932L;

	@EmbeddedId
	private QuestionInQuizId pk = new QuestionInQuizId();

	@Column(name = "order_number")
	private Integer orderNumber;

	@Column(name = "activated")
	private Boolean activated;

	@Column(name = "finished")
	private Boolean finished;

	public Boolean getFinished() {
		return finished;
	}

	public void setFinished(Boolean finished) {
		this.finished = finished;
	}

	@Transient
	public Quiz getQuiz() {
		return pk.getQuiz();
	}

	public void setQuiz(Quiz quiz) {
		pk.setQuiz(quiz);
	}

	@Transient
	public Question getQuestion() {
		return pk.getQuestion();
	}

	public void setQuestion(Question question) {
		pk.setQuestion(question);
	}

	public QuestionInQuizId getPk() {
		return pk;
	}

	public void setPk(QuestionInQuizId pk) {
		this.pk = pk;
	}

	public Integer getOrderNumber() {
		return orderNumber;
	}

	public void setOrderNumber(Integer orderNumber) {
		this.orderNumber = orderNumber;
	}

	public Boolean getActivated() {
		return activated;
	}

	public void setActivated(Boolean activated) {
		this.activated = activated;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result
				+ ((activated == null) ? 0 : activated.hashCode());
		result = prime * result
				+ ((orderNumber == null) ? 0 : orderNumber.hashCode());
		result = prime * result + ((pk == null) ? 0 : pk.hashCode());
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
		QuestionInQuizInformation other = (QuestionInQuizInformation) obj;
		if (activated == null) {
			if (other.activated != null)
				return false;
		} else if (!activated.equals(other.activated))
			return false;
		if (orderNumber == null) {
			if (other.orderNumber != null)
				return false;
		} else if (!orderNumber.equals(other.orderNumber))
			return false;
		if (pk == null) {
			if (other.pk != null)
				return false;
		} else if (!pk.equals(other.pk))
			return false;
		return true;
	}

}
