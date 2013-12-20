package hr.fer.ztel.domain;

/**
 * pomoćna klasa za upravljanje pitanjima pojedinom kviza pomoću AJAX-a
 *
 */
public class AjaxQuizQuestionTransport {
	
	private Long idQuiz;
	private Long idQuestion;
	private boolean activated;
	
	public AjaxQuizQuestionTransport()
	{}

	public Long getIdQuiz() {
		return idQuiz;
	}

	public void setIdQuiz(Long idQuiz) {
		this.idQuiz = idQuiz;
	}

	public Long getIdQuestion() {
		return idQuestion;
	}

	public void setIdQuestion(Long idQuestion) {
		this.idQuestion = idQuestion;
	}

	public boolean isActivated() {
		return activated;
	}

	public void setActivated(boolean activated) {
		this.activated = activated;
	}
	
	
	
}
