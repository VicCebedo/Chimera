package com.cebedo.pmsys.domain;

import java.util.Date;
import java.util.UUID;

import org.apache.commons.lang.StringUtils;

import com.cebedo.pmsys.base.IObjectExpense;
import com.cebedo.pmsys.constants.ConstantsRedis;
import com.cebedo.pmsys.constants.RegistryRedisKeys;
import com.cebedo.pmsys.model.Company;
import com.cebedo.pmsys.model.Project;
import com.cebedo.pmsys.utils.NumberFormatUtils;

public class Delivery implements IObjectExpense {

    private static final long serialVersionUID = 2539632179017470796L;
    /**
     * Key: "company:%s:project:%s:delivery:uuid:%s"
     */
    private Company company;
    private Project project;
    private UUID uuid;

    /**
     * Details.
     */
    private String name;
    private String description;
    private Date datetime;

    /**
     * More details.
     */
    private double grandTotalOfMaterials;

    public Delivery() {
	;
    }

    public Delivery(Project proj) {
	setCompany(proj.getCompany());
	setProject(proj);
    }

    @Override
    public String getKey() {
	// "company:%s:project:%s:delivery:uuid:%s"
	return String.format(RegistryRedisKeys.KEY_DELIVERY, this.company.getId(), this.project.getId(),
		this.uuid);
    }

    public Company getCompany() {
	return company;
    }

    public void setCompany(Company company) {
	this.company = company;
    }

    public Project getProject() {
	return project;
    }

    public void setProject(Project project) {
	this.project = project;
    }

    public Date getDatetime() {
	return datetime;
    }

    public void setDatetime(Date datetime) {
	this.datetime = datetime;
    }

    public UUID getUuid() {
	return uuid;
    }

    public void setUuid(UUID uuid) {
	this.uuid = uuid;
    }

    public String getName() {
	return name;
    }

    public void setName(String name) {
	this.name = StringUtils.trim(name);
    }

    public String getDescription() {
	return description;
    }

    public void setDescription(String description) {
	this.description = StringUtils.trim(description);
    }

    public String getGrandTotalOfMaterialsAsString() {
	return NumberFormatUtils.getCurrencyFormatter().format(grandTotalOfMaterials);
    }

    public double getGrandTotalOfMaterials() {
	return grandTotalOfMaterials;
    }

    public void setGrandTotalOfMaterials(double grandTotalOfMaterials) {
	this.grandTotalOfMaterials = grandTotalOfMaterials;
    }

    /**
     * company:%s:project:%s:delivery:uuid:%s
     * 
     * @param project
     * @return
     */
    public static String constructPattern(Project project) {
	Company company = project.getCompany();
	return String.format(RegistryRedisKeys.KEY_DELIVERY, company.getId(), project.getId(), "*");
    }

    @Override
    public boolean equals(Object obj) {
	return obj instanceof Delivery ? ((Delivery) obj).getKey().equals(getKey()) : false;
    }

    @Override
    public int hashCode() {
	return getKey().hashCode();
    }

    @Override
    public double getCost() {
	return getGrandTotalOfMaterials();
    }

    @Override
    public String getObjectName() {
	return ConstantsRedis.OBJECT_DELIVERY;
    }

    public String toString() {
	return String.format("[%s = %s]", getName(), getCost());
    }

    public Delivery clone() {
	try {
	    return (Delivery) super.clone();
	} catch (Exception e) {
	    return null;
	}
    }

}
