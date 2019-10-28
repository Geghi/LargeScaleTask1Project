package hibernateTask1;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.TypedQuery;

public class ManagerEM {
	private EntityManagerFactory factory;
	private EntityManager entityManager;

	public void setup() {
		factory = Persistence.createEntityManagerFactory("test");

	}

	public void exit() {
		factory.close();
	}

	public Student createStudent(String username, String password, boolean admin, Degree degree) {
		System.out.println("Creating a new student");

		Student student = new Student(0, username, password, admin);
		degree.getStudent().add(student);
		student.setDeg(degree);

		try {
			entityManager = factory.createEntityManager();
			entityManager.getTransaction().begin();
			entityManager.persist(student);
			entityManager.getTransaction().commit();
			System.out.println("student Added");
			return student;

		} catch (Exception ex) {
			ex.printStackTrace();
			System.out.println("A problem occurred in updating a student!");
		} finally {
			entityManager.close();
		}
		return student;

	}

	public Degree createDegree(String name) {
		System.out.println("Creating a new degree program");

		Degree degree = new Degree(0, name);

		try {
			entityManager = factory.createEntityManager();
			entityManager.getTransaction().begin();
			entityManager.persist(degree);
			entityManager.getTransaction().commit();
			System.out.println("degree Added");
			return degree;

		} catch (Exception ex) {
			ex.printStackTrace();
			System.out.println("A problem occurred in updating a degree!");
		} finally {
			entityManager.close();
		}
		return degree;

	}

	public Professor createProfessor(String name, String surname, String info) {
		System.out.println("Creating a new professor");

		Professor professor = new Professor(0, name, surname, info);

		try {
			entityManager = factory.createEntityManager();
			entityManager.getTransaction().begin();
			entityManager.persist(professor);
			entityManager.getTransaction().commit();
			System.out.println("professor Added");
			return professor;

		} catch (Exception ex) {
			ex.printStackTrace();
			System.out.println("A problem occurred in updating a professor!");
		} finally {
			entityManager.close();
		}
		return professor;

	}

	public Subject createSubject(String name, int credits, String info, Professor professor, Degree degree) {
		System.out.println("Creating a new subject");

		Subject subject = new Subject(0, name, credits, info);
		subject.getProfessor().add(professor);
		professor.getSubject().add(subject);
		degree.getSubject().add(subject);
		subject.setDeg(degree);

		try {
			entityManager = factory.createEntityManager();
			entityManager.getTransaction().begin();
			entityManager.persist(subject);
			entityManager.getTransaction().commit();
			System.out.println("subject Added");
			return subject;

		} catch (Exception ex) {
			ex.printStackTrace();
			System.out.println("A problem occurred in updating a subject!");
		} finally {
			entityManager.close();
		}
		return subject;

	}

	public SubjectComment createSubjectComment(String text, Date date, Student student, Subject subject) {
		System.out.println("Creating a new subjectComment");

		SubjectComment subjectComment = new SubjectComment(0, text, date);
		subject.getSubjectComments().add(subjectComment);
		subjectComment.setStud(student);
		subjectComment.setSubj(subject);

		try {
			entityManager = factory.createEntityManager();
			entityManager.getTransaction().begin();
			entityManager.persist(subjectComment);
			entityManager.getTransaction().commit();
			System.out.println("subjectComment Added");

		} catch (Exception ex) {
			ex.printStackTrace();
			System.out.println("A problem occurred in updating a subjectComment!");
		} finally {
			entityManager.close();
		}

		return subjectComment;

	}

	public ProfessorComment createProfessorComment(String text, Date date, Student student, Professor professor) {
		System.out.println("Creating a new professorComment");

		ProfessorComment professorComment = new ProfessorComment(0, text, date);
		professor.getProfessorComments().add(professorComment);
		professorComment.setStud(student);
		professorComment.setProf(professor);

		try {
			entityManager = factory.createEntityManager();
			entityManager.getTransaction().begin();
			entityManager.persist(professorComment);
			entityManager.getTransaction().commit();
			System.out.println("professorComment Added");

		} catch (Exception ex) {
			ex.printStackTrace();
			System.out.println("A problem occurred in updating a professorComment!");
		} finally {
			// entityManager.getTransaction().commit();
			entityManager.close();
		}
		return professorComment;
	}

	public Student checkUser(String username, String password) {

		Student student = null;
		System.out.println("Getting a student");
		String selectUser = "SELECT u FROM Users u WHERE username = ?1 AND password = ?2";
		try {
			entityManager = factory.createEntityManager();

			TypedQuery<Student> query = entityManager.createQuery(selectUser, Student.class);
			query.setParameter(1, username);
			query.setParameter(2, password);

			List<Student> results = query.getResultList();
			if (results.size() == 0) {
				return null;
			} else if (results.size() > 1) {
				System.out.println("In the Database are present more than one user with the same username");
			} else {
				System.out.println(results.get(0).getUsername() + " " + results.get(0).getPassword() + " "
						+ results.get(0).getDeg().getId());
				student = results.get(0);
			}

		} catch (Exception ex) {
			ex.printStackTrace();
			System.out.println("A problem occurred in retriving a student!");

		} finally {
			entityManager.close();
		}
		return student;
	}

	public List<Subject> getSubjects(int degree) {

		List<Subject> results = new ArrayList<>();
		System.out.println("Getting a List of subjects based on the degree");

		String selectionSubjects = "SELECT s FROM Subjects s";
		String selectionSubjectByDegree = "SELECT s FROM Subjects s WHERE degreeId = ?1";
		try {
			entityManager = factory.createEntityManager();
			if (degree < 0) {
				TypedQuery<Subject> query = entityManager.createQuery(selectionSubjects, Subject.class);
				results = query.getResultList();
			} else {

				TypedQuery<Subject> query = entityManager.createQuery(selectionSubjectByDegree, Subject.class);
				query.setParameter(1, degree);
				results = query.getResultList();
			}

		} catch (Exception ex) {
			ex.printStackTrace();
			System.out.println("A problem occurred in retriving subjects!");

		} finally {
			entityManager.close();
		}
		return results;
	}

	public List<Professor> getProfessors(int degree) {

		List<Professor> results = new ArrayList<>();
		System.out.println("Getting a List of professors based on the degree");

		String selectionProfessors = "SELECT p FROM Professors p";
		String selectionProfessorByDegree = "SELECT p FROM Subjects s JOIN s.professor p WHERE s.deg.id = ?1";
		try {
			entityManager = factory.createEntityManager();
			if (degree < 0) {
				TypedQuery<Professor> query = entityManager.createQuery(selectionProfessors, Professor.class);
				results = query.getResultList();
			} else {

				TypedQuery<Professor> query = entityManager.createQuery(selectionProfessorByDegree, Professor.class);
				query.setParameter(1, degree);
				results = query.getResultList();
			}

		} catch (Exception ex) {
			ex.printStackTrace();
			System.out.println("A problem occurred in retriving professors!");

		} finally {
			entityManager.close();
		}
		return results;
	}

	public List<Comment> getSubjectComments(int subjectId) {
		List<Comment> results = new ArrayList<>();
		System.out.println("Getting a list of subject comments");

		String selectionSubjectComments = "SELECT sc FROM SubjectComments sc WHERE sc.subj.id = ?1";
		try {
			entityManager = factory.createEntityManager();
			TypedQuery<Comment> query = entityManager.createQuery(selectionSubjectComments, Comment.class);
			query.setParameter(1, subjectId);
			results = query.getResultList();

		} catch (Exception ex) {
			ex.printStackTrace();
			System.out.println("A problem occurred in retriving subject comments!");

		} finally {
			entityManager.close();
		}
		return results;
	}

	public List<Comment> getProfessorComments(int subjectId) {
		List<Comment> results = new ArrayList<>();
		System.out.println("Getting a list of professor comments");

		String selectionProfessorComments = "SELECT pc FROM ProfComments pc WHERE pc.prof.id = ?1";
		try {
			entityManager = factory.createEntityManager();
			TypedQuery<Comment> query = entityManager.createQuery(selectionProfessorComments, Comment.class);
			query.setParameter(1, subjectId);
			results = query.getResultList();

			for (int i = 0; i < results.size(); i++) {
				System.out.println(results.get(i).getText());
			}

		} catch (Exception ex) {
			ex.printStackTrace();
			System.out.println("A problem occurred in retriving professor comments!");

		} finally {
			entityManager.close();
		}
		return results;
	}

	public List<Degree> getDegreeCourses() {
		List<Degree> results = new ArrayList<>();
		System.out.println("Getting a list of degree courses");

		String selectionDegreeComments = "SELECT d FROM Degree d";
		try {
			entityManager = factory.createEntityManager();
			TypedQuery<Degree> query = entityManager.createQuery(selectionDegreeComments, Degree.class);

			results = query.getResultList();

			for (int i = 0; i < results.size(); i++) {
				System.out.println(results.get(i).getName());
			}

		} catch (Exception ex) {
			ex.printStackTrace();
			System.out.println("A problem occurred in retriving Degree courses!");

		} finally {
			entityManager.close();
		}
		return results;
	}

	public int getDegreeId(String name) {
		Degree result;
		System.out.println("Getting a degree id");

		String selectionDegreeComments = "SELECT d FROM Degree d WHERE d.name = ?1";
		try {
			entityManager = factory.createEntityManager();
			TypedQuery<Degree> query = entityManager.createQuery(selectionDegreeComments, Degree.class);
			query.setParameter(1, name);
			result = query.getSingleResult();

			System.out.println(result.getId());
			return result.getId();
		} catch (Exception ex) {
			ex.printStackTrace();
			System.out.println("A problem occurred in retriving degree id!");

		} finally {
			entityManager.close();
		}
		return -1;
	}

	public String getDegreeName(int degreeId) {
		Degree result;
		System.out.println("Getting a degree name");

		try {
			entityManager = factory.createEntityManager();
			result = entityManager.find(Degree.class, degreeId);

			System.out.println(result.getName());
			return result.getName();
		} catch (Exception ex) {
			ex.printStackTrace();
			System.out.println("A problem occurred in retriving degree id!");

		} finally {
			entityManager.close();
		}
		return null;
	}

	public void updateCommentProf(int profCommentId, String text, int userId) {
		System.out.println("Updating a professor comment");

		Date date = new Date();

		try {
			entityManager = factory.createEntityManager();
			entityManager.getTransaction().begin();
			ProfessorComment professorComment = entityManager.find(ProfessorComment.class, profCommentId);
			professorComment.setText(text);
			professorComment.setDate(date.toString());
			entityManager.getTransaction().commit();
			System.out.println("professor comment updated");

		} catch (Exception ex) {
			ex.printStackTrace();
			System.out.println("A problem occurred in updating a professor comment!");

		} finally {
			entityManager.close();
		}
	}

	public void updateCommentSubject(int subjectCommentId, String text, int userId) {
		System.out.println("Updating a subject comment");

		Date date = new Date();

		try {
			entityManager = factory.createEntityManager();
			entityManager.getTransaction().begin();
			SubjectComment subjectComment = entityManager.find(SubjectComment.class, subjectCommentId);
			subjectComment.setText(text);
			subjectComment.setDate(date.toString());
			entityManager.getTransaction().commit();
			System.out.println("subject comment updated");

		} catch (Exception ex) {
			ex.printStackTrace();
			System.out.println("A problem occurred in updating a subject comment!");

		} finally {
			entityManager.close();
		}
	}

	public void deleteCommentSubject(int subjectCommentId, int userId, boolean admin) {
		try {
			entityManager = factory.createEntityManager();
			entityManager.getTransaction().begin();
			SubjectComment subjectComment = entityManager.find(SubjectComment.class, subjectCommentId);

			if (!admin) { // if the user is not the admin --> check if he is the owner of the comment.

				if (subjectComment.getStud().getId() == userId)
					entityManager.remove(subjectComment);
				else {

					System.out.println("You are not the owner of that comment, please select another comment");
					return;
				}
			} else // if the user is the admin i just delete the comment
				entityManager.remove(subjectComment);

			entityManager.getTransaction().commit();
			System.out.println("subject comment removed");

		} catch (Exception ex) {
			ex.printStackTrace();
			System.out.println("A problem occurred in removing a subject comment!");

		} finally {
			entityManager.close();
		}
	}

	public void deleteCommentProf(int profCommentId, int userId, boolean admin) {
		try {
			entityManager = factory.createEntityManager();
			entityManager.getTransaction().begin();
			ProfessorComment professorComment = entityManager.find(ProfessorComment.class, profCommentId);

			if (!admin) { // if the user is not the admin --> check if he is the owner of the comment.

				if (professorComment.getStud().getId() == userId)
					entityManager.remove(professorComment);
				
				else {
					System.out.println("You are not the owner of that comment, please select another comment");
					return;
				}

			} else // if the user is the admin i just delete the comment
				entityManager.remove(professorComment);

			entityManager.getTransaction().commit();
			System.out.println("professor comment removed");

		} catch (Exception ex) {
			ex.printStackTrace();
			System.out.println("A problem occurred in removing a professor comment!");

		} finally {
			entityManager.close();
		}
	}

	public static void main(String[] args) {

		ManagerEM manager = new ManagerEM();
		manager.setup();

		Date date = new Date();
		Degree degree = manager.createDegree("xdsST");
		Student student = manager.createStudent("Ge", "Geghi", true, degree);
		Professor professor = manager.createProfessor("Coco", "cococcioni", "faccio informatica");
		Subject subject = manager.createSubject("Fondamenti di informatica I", 12, "subinfo", professor, degree);
		manager.createSubjectComment("prova commento", date, student, subject);
		manager.createProfessorComment("prova commento", date, student, professor);

		//TESTS
		manager.checkUser("Ge", "Geghi");
		manager.getSubjects(1);
		manager.getProfessors(1);
		manager.getSubjectComments(1);
		manager.getProfessorComments(1);
		manager.getDegreeCourses();
		manager.getDegreeId("TEST");
		manager.getDegreeName(2);
		manager.updateCommentProf(1, "CommentoModificato YEEE", 1);
		manager.updateCommentSubject(1, "CommentoModificato YEEE", 1);
		manager.deleteCommentSubject(2, 2, false);
		manager.deleteCommentProf(1, 9, false);

		manager.exit();
		System.out.println("Finished");

	}
}

//the degree default constructor is used in the checkUser when the List<Student> is created since we don't
//pass to the function the degree.
//same for all other default constructos.

//rollback