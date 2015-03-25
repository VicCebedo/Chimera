package com.cebedo.pmsys.subcontractor.model;

import java.io.Serializable;
import java.util.Set;

import com.cebedo.pmsys.cashflow.expense.model.Expense;
import com.cebedo.pmsys.company.model.Company;
import com.cebedo.pmsys.project.model.Project;
import com.cebedo.pmsys.task.model.Task;

//@Entity
//@Table(name = Subcontractor.TABLE_NAME)
public class Subcontractor implements Serializable {

	public static final String OBJECT_NAME = "subcontractor";
	public static final String TABLE_NAME = "subcontractors";
	public static final String COLUMN_PRIMARY_KEY = OBJECT_NAME + "_id";
	public static final String PROPERTY_ID = "id";
	private static final long serialVersionUID = 1L;

	private long id;
	private String name;
	private Company company;
	private Set<Project> projects;
	private Set<Task> tasks;
	private Set<Expense> expenses;

	// @Id
	// @GeneratedValue(strategy = GenerationType.IDENTITY)
	// @Column(name = COLUMN_PRIMARY_KEY, unique = true, nullable = false)
	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	// @Column(name = "name", nullable = false, length = 64)
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	// @ManyToOne
	// @JoinColumn(name = Company.COLUMN_PRIMARY_KEY)
	public Company getCompany() {
		return company;
	}

	public void setCompany(Company company) {
		this.company = company;
	}

	// @ManyToMany(mappedBy = "subcontractor")
	public Set<Project> getProjects() {
		return projects;
	}

	public void setProjects(Set<Project> projects) {
		this.projects = projects;
	}

	// @ManyToMany(mappedBy = "subcontractor")
	public Set<Task> getTasks() {
		return tasks;
	}

	public void setTasks(Set<Task> tasks) {
		this.tasks = tasks;
	}

	// @ManyToMany(mappedBy = "subcontractor")
	public Set<Expense> getExpenses() {
		return expenses;
	}

	public void setExpenses(Set<Expense> expenses) {
		this.expenses = expenses;
	}
}
