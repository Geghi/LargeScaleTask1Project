package hibernateTask1;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.MappedSuperclass;

//import javafx.beans.property.*;

@MappedSuperclass
public abstract class Comment {

	@Column(name = "id")
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private String text;
	private String date;

	public Comment() {

	}

	public Comment(int i, String t, Date d) {
		id = i;
		text = t;
		date = d.toString();
	}

	public int getId() {
		return id;
	}

	public void setText(String text) {
		this.text = text;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getText() {
		return text;
	}

	public String getDate() {
		return date;
	}
}