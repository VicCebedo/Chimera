package com.cebedo.pmsys.model;

import java.util.Date;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;

import org.apache.commons.lang.StringUtils;

import com.cebedo.pmsys.base.IObjectModel;
import com.cebedo.pmsys.enums.HTMLTheme;

@Entity
@Table(name = Company.TABLE_NAME)
public class Company implements IObjectModel {

    private static final long serialVersionUID = 8860496412110526096L;
    public static final String TABLE_NAME = "companies";
    public static final String OBJECT_NAME = "company";
    public static final String COLUMN_PRIMARY_KEY = OBJECT_NAME + "_id";

    public static final String PROPERTY_ID = "id";

    private long id;
    private String name = "";
    private String description;
    private Date dateStarted;
    private Date dateExpiration;
    private Set<Staff> staff;
    private Set<SystemUser> employees;
    private Set<Project> projects;
    private Set<SystemConfiguration> configs;
    private Set<Task> tasks;
    private Set<AuditLog> auditLogs;
    private boolean betaTester;

    // For cloning.
    private boolean randomizeNames;
    private String clonePassword;

    // HTMLTheme.
    private String themeID;

    public Company() {
	;
    }

    public Company(long id) {
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

    @Column(name = "name", nullable = false, length = 64)
    public String getName() {
	return name;
    }

    public void setName(String name) {
	this.name = StringUtils.trim(name);
    }

    @Column(name = "description")
    public String getDescription() {
	return description;
    }

    public void setDescription(String description) {
	this.description = StringUtils.trim(description);
    }

    @Column(name = "date_started", nullable = false)
    @Temporal(TemporalType.TIMESTAMP)
    public Date getDateStarted() {
	return dateStarted;
    }

    public void setDateStarted(Date dateStarted) {
	this.dateStarted = dateStarted;
    }

    @Column(name = "date_expiration", nullable = false)
    @Temporal(TemporalType.TIMESTAMP)
    public Date getDateExpiration() {
	return dateExpiration;
    }

    public void setDateExpiration(Date dateExpiration) {
	this.dateExpiration = dateExpiration;
    }

    @OneToMany(mappedBy = "company", cascade = CascadeType.ALL)
    public Set<Staff> getStaff() {
	return staff;
    }

    public void setStaff(Set<Staff> stf) {
	this.staff = stf;
    }

    @OneToMany(mappedBy = "company", cascade = CascadeType.ALL)
    public Set<SystemUser> getEmployees() {
	return employees;
    }

    public void setEmployees(Set<SystemUser> employees) {
	this.employees = employees;
    }

    @OneToMany(mappedBy = "company", cascade = CascadeType.ALL)
    public Set<Project> getProjects() {
	return projects;
    }

    public void setProjects(Set<Project> projects) {
	this.projects = projects;
    }

    @OneToMany(mappedBy = "company", cascade = CascadeType.ALL)
    public Set<SystemConfiguration> getConfigs() {
	return configs;
    }

    public void setConfigs(Set<SystemConfiguration> configs) {
	this.configs = configs;
    }

    @OneToMany(mappedBy = "company", cascade = CascadeType.ALL)
    public Set<Task> getTasks() {
	return tasks;
    }

    public void setTasks(Set<Task> tasks) {
	this.tasks = tasks;
    }

    @OneToMany(mappedBy = "company", cascade = CascadeType.ALL)
    public Set<AuditLog> getAuditLogs() {
	return auditLogs;
    }

    public void setAuditLogs(Set<AuditLog> auditLogs) {
	this.auditLogs = auditLogs;
    }

    public String toString() {
	String str = "";
	str += "id=" + id;
	str += ", name=" + name;
	str += ", description=" + description;
	str += ", dateStarted=" + dateStarted;
	str += ", dateExpiration=" + dateExpiration;
	return str;
    }

    @Column(name = "beta_tester", nullable = false)
    public boolean isBetaTester() {
	return betaTester;
    }

    public void setBetaTester(boolean betaTester) {
	this.betaTester = betaTester;
    }

    @Column(name = "theme", nullable = false, length = 32)
    public String getThemeID() {
	if (StringUtils.isBlank(themeID)) {
	    return HTMLTheme.DEFAULT.getId();
	}
	return themeID;
    }

    public void setThemeID(String themeID) {
	this.themeID = themeID;
    }

    @Transient
    @Override
    public String getObjectName() {
	return OBJECT_NAME;
    }

    @Transient
    @Override
    public Company getCompany() {
	return this;
    }

    @Transient
    @Override
    public String getTableName() {
	return TABLE_NAME;
    }

    public Company clone() {
	try {
	    return (Company) super.clone();
	} catch (Exception e) {
	    return null;
	}
    }

    @Transient
    public boolean isRandomizeNames() {
	return randomizeNames;
    }

    public void setRandomizeNames(boolean randomizeNames) {
	this.randomizeNames = randomizeNames;
    }

    @Transient
    public String getClonePassword() {
	return clonePassword;
    }

    public void setClonePassword(String clonePassword) {
	this.clonePassword = clonePassword;
    }

}
