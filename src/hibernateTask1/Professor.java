package hibernateTask1;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.Table;

//import javafx.beans.property.*;

@Entity(name = "Professors")
@Table(name = "professors")
public class Professor extends Person{
	
	private String info;
	private String name;
	private String surname;

	//relation with profComments.
	@OneToMany(mappedBy = "prof", cascade = CascadeType.ALL, orphanRemoval = true)
	private List<ProfessorComment> professorComments = new ArrayList<ProfessorComment>();

	//relation with Subjects.
	@ManyToMany(mappedBy = "professor")
	private Set<Subject> subject = new HashSet<Subject>();

	public Professor() {
		
	}
	// CONSTRUCTOR
	public Professor(int i, String n, String s, String inf) {
		super(i);
		name = n;
		surname = s;
		info = inf;
	}

	public Set<Subject> getSubject() {
		return subject;
	}

	public void setSubject(Set<Subject> subject) {
		this.subject = subject;
	}

	public List<ProfessorComment> getProfessorComments() {
		return professorComments;
	}

	public void setProfessorComments(List<ProfessorComment> professorComments) {
		this.professorComments = professorComments;
	}

	public String getInfo() {
		return info;
	}

	public String getName() {
		return name;
	}

	public String getSurname() {
		return surname;
	}

}