package com.cebedo.pmsys.domain;

import java.util.Date;
import java.util.Map;

import com.cebedo.pmsys.constants.RegistryRedisKeys;
import com.cebedo.pmsys.enums.AttendanceStatus;
import com.cebedo.pmsys.model.Company;
import com.cebedo.pmsys.model.Project;
import com.cebedo.pmsys.model.Staff;
import com.cebedo.pmsys.utils.DateUtils;

public class Attendance implements IDomainObject {

    private static final long serialVersionUID = -724701840751019923L;

    private Company company;
    private Project project;
    private Staff staff;
    private Date date;
    private AttendanceStatus status;

    /**
     * Specs.
     */
    private double wage;

    /**
     * Extension map.
     */
    private Map<String, Object> extMap;

    /**
     * Bean-backed form.
     */
    private int statusID;

    public int getStatusID() {
	return statusID;
    }

    public void setStatusID(int statusID) {
	this.statusID = statusID;
    }

    public Attendance() {
	;
    }

    public Attendance(Company coID, Project project, Staff stf) {
	setCompany(coID);
	setProject(project);
	setStaff(stf);
    }

    public Attendance(Company coID, Project project, Staff stf, AttendanceStatus stat, Date tstamp,
	    double w) {
	setCompany(coID);
	setProject(project);
	setStaff(stf);
	setStatus(stat);
	setDate(tstamp);
	setWage(w);
    }

    public Staff getStaff() {
	return staff;
    }

    public void setStaff(Staff staff) {
	this.staff = staff;
    }

    public Company getCompany() {
	return company;
    }

    public void setCompany(Company companyID) {
	this.company = companyID;
    }

    public Date getDate() {
	return date;
    }

    public String getFormattedDateString(String pattern) {
	return DateUtils.formatDate(this.date, pattern);
    }

    public void setDate(Date d) {
	this.date = d;
    }

    public AttendanceStatus getStatus() {
	return status;
    }

    public void setStatus(AttendanceStatus status) {
	this.status = status;
    }

    public double getWage() {
	return wage;
    }

    public void setWage(double wage) {
	this.wage = wage;
    }

    @Override
    public Map<String, Object> getExtMap() {
	return extMap;
    }

    @Override
    public void setExtMap(Map<String, Object> extMap) {
	this.extMap = extMap;
    }

    public static String constructPattern(Project project, Staff staff, Date myDate) {
	Company company = staff.getCompany();
	String date = DateUtils.formatDate(myDate, "yyyy.MM.dd");
	return String.format(RegistryRedisKeys.KEY_ATTENDANCE, company.getId(), project.getId(),
		staff.getId(), date, "*");
    }

    public static String constructPattern(Project project, Staff staff) {
	Company company = staff.getCompany();
	return String.format(RegistryRedisKeys.KEY_ATTENDANCE, company.getId(), project.getId(),
		staff.getId(), "*", "*");
    }

    /**
     * Key: company:%s:staff:%s:attendance:date:%s:status:%s
     */
    @Override
    public String getKey() {
	Date myDate = getDate();
	String date = DateUtils.formatDate(myDate, "yyyy.MM.dd");
	int status = (getStatus() == null ? getStatusID() : getStatus().id());
	return String.format(RegistryRedisKeys.KEY_ATTENDANCE, this.company.getId(),
		this.project.getId(), this.staff.getId(), date, status);
    }

    @Override
    public boolean equals(Object obj) {
	return obj instanceof Attendance ? ((Attendance) obj).getKey().equals(getKey()) : false;
    }

    @Override
    public int hashCode() {
	return getKey().hashCode();
    }

    public Project getProject() {
	return project;
    }

    public void setProject(Project project) {
	this.project = project;
    }
}