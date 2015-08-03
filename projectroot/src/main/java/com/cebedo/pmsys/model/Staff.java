package com.cebedo.pmsys.model;

import java.io.Serializable;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import com.cebedo.pmsys.model.assignment.StaffTeamAssignment;
import com.cebedo.pmsys.utils.NumberFormatUtils;

@Entity
@Table(name = Staff.TABLE_NAME)
public class Staff implements Serializable {

    private static final long serialVersionUID = 8510201653144668336L;
    public static final String OBJECT_NAME = "staff";
    public static final String TABLE_NAME = "staff";
    public static final String COLUMN_PRIMARY_KEY = "staff_id";

    public static final String PROPERTY_ID = "id";
    public static final String PROPERTY_PREFIX = "prefix";
    public static final String PROPERTY_FIRST_NAME = "firstName";
    public static final String PROPERTY_MIDDLE_NAME = "middleName";
    public static final String PROPERTY_LAST_NAME = "lastName";
    public static final String PROPERTY_SUFFIX = "suffix";

    public static final String PROPERTY_TRANSIENT_FULL_NAME = "Full Name";

    public static final String SUB_MODULE_PROFILE = "profile";

    private long id;
    private String prefix;
    private String firstName;
    private String middleName;
    private String lastName;
    private String suffix;
    private String companyPosition;
    private Set<Task> tasks;

    private String email;
    private String contactNumber;
    private Set<ProjectFile> files;
    private Set<Team> teams;
    private Company company;
    private SystemUser user;
    private double wage;

    public Staff() {
	;
    }

    public Staff(long id) {
	setId(id);
    }

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = COLUMN_PRIMARY_KEY, unique = true, nullable = false)
    public long getId() {
	return id;
    }

    public void setId(long id) {
	this.id = id;
    }

    @Column(name = "name_prefix", length = 8)
    public String getPrefix() {
	return prefix;
    }

    public void setPrefix(String prefix) {
	this.prefix = prefix;
    }

    @Column(name = "name_first", length = 32)
    public String getFirstName() {
	return firstName;
    }

    public void setFirstName(String firstName) {
	this.firstName = firstName;
    }

    @Column(name = "name_middle", length = 16)
    public String getMiddleName() {
	return middleName;
    }

    public void setMiddleName(String middleName) {
	this.middleName = middleName;
    }

    @Column(name = "name_last", length = 16)
    public String getLastName() {
	return lastName;
    }

    public void setLastName(String lastName) {
	this.lastName = lastName;
    }

    @Column(name = "name_suffix", length = 8)
    public String getSuffix() {
	return suffix;
    }

    public void setSuffix(String suffix) {
	this.suffix = suffix;
    }

    @Column(name = "position", length = 32)
    public String getCompanyPosition() {
	return companyPosition;
    }

    public void setCompanyPosition(String companyPosition) {
	this.companyPosition = companyPosition;
    }

    @ManyToMany(mappedBy = "staff")
    public Set<Task> getTasks() {
	return tasks;
    }

    public void setTasks(Set<Task> tasks) {
	this.tasks = tasks;
    }

    @Column(name = "email", length = 32)
    public String getEmail() {
	return email;
    }

    public void setEmail(String email) {
	this.email = email;
    }

    @Column(name = "wage")
    public double getWage() {
	return wage;
    }

    @Transient
    public String getWageAsString() {
	return NumberFormatUtils.getCurrencyFormatter().format(wage);
    }

    public void setWage(double wage) {
	this.wage = wage;
    }

    @Column(name = "contact_number", length = 32)
    public String getContactNumber() {
	return contactNumber;
    }

    public void setContactNumber(String contactNumber) {
	this.contactNumber = contactNumber;
    }

    @OneToMany(mappedBy = "uploader")
    public Set<ProjectFile> getFiles() {
	return files;
    }

    public void setFiles(Set<ProjectFile> files) {
	this.files = files;
    }

    @ManyToMany
    @JoinTable(name = StaffTeamAssignment.TABLE_NAME, joinColumns = { @JoinColumn(name = COLUMN_PRIMARY_KEY) }, inverseJoinColumns = { @JoinColumn(name = Team.COLUMN_PRIMARY_KEY, nullable = false, updatable = false) })
    public Set<Team> getTeams() {
	return teams;
    }

    public void setTeams(Set<Team> teams) {
	this.teams = teams;
    }

    @ManyToOne
    @JoinColumn(name = Company.COLUMN_PRIMARY_KEY)
    public Company getCompany() {
	return company;
    }

    public void setCompany(Company company) {
	this.company = company;
    }

    @OneToOne(mappedBy = Staff.OBJECT_NAME, cascade = CascadeType.ALL)
    public SystemUser getUser() {
	return user;
    }

    public void setUser(SystemUser user) {
	this.user = user;
    }

    @Transient
    public String getFullName() {
	String fullName = getPrefix() == null ? "" : getPrefix() + " ";
	fullName += getFirstName() == null ? "" : getFirstName() + " ";
	fullName += getMiddleName() == null ? "" : getMiddleName().charAt(0) + ". ";
	fullName += getLastName() == null ? "" : getLastName() + " ";
	fullName += getSuffix() == null ? "" : getSuffix();
	return fullName;
    }

    @Transient
    public String getFormalName() {
	String pfx = getPrefix() == null || getPrefix().equals("") ? "" : ", " + getPrefix();
	String fname = getFirstName() == null ? "" : getFirstName();
	String mname = getMiddleName() == null || getMiddleName().equals("") ? "" : ", "
		+ getMiddleName().charAt(0) + ".";
	String lname = getLastName() == null ? "" : getLastName();
	String sfx = getSuffix() == null ? "" : getSuffix();

	return lname + ", " + fname + " " + sfx + mname + pfx;
    }

}
