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
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = Storage.TABLE_NAME)
public class Storage implements Serializable {

    private static final long serialVersionUID = 3801357012130647914L;
    public static final String TABLE_NAME = "storages";
    public static final String OBJECT_NAME = "storage";
    public static final String COLUMN_PRIMARY_KEY = OBJECT_NAME + "_id";
    public static final String PROPERTY_ID = "id";

    private long id;
    private String name;
    private String location;
    private String description;
    private Set<MaterialToRemove> materials;
    private Set<DeliveryToDelete> deliveries;
    private Company company;
    private Set<Expense> expenses;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = COLUMN_PRIMARY_KEY, unique = true, nullable = false)
    public long getId() {
	return id;
    }

    public void setId(long id) {
	this.id = id;
    }

    @Column(name = "name", nullable = false, length = 32)
    public String getName() {
	return name;
    }

    public void setName(String name) {
	this.name = name;
    }

    @Column(name = "location", nullable = false)
    public String getLocation() {
	return location;
    }

    public void setLocation(String location) {
	this.location = location;
    }

    @Column(name = "description")
    public String getDescription() {
	return description;
    }

    public void setDescription(String description) {
	this.description = description;
    }

    @OneToMany(mappedBy = "storage", cascade = CascadeType.ALL)
    public Set<MaterialToRemove> getMaterials() {
	return materials;
    }

    public void setMaterials(Set<MaterialToRemove> m) {
	this.materials = m;
    }

    @OneToMany(mappedBy = "storage", cascade = CascadeType.ALL)
    public Set<DeliveryToDelete> getDeliveries() {
	return deliveries;
    }

    public void setDeliveries(Set<DeliveryToDelete> deliveries) {
	this.deliveries = deliveries;
    }

    @ManyToOne
    @JoinColumn(name = Company.COLUMN_PRIMARY_KEY)
    public Company getCompany() {
	return company;
    }

    public void setCompany(Company company) {
	this.company = company;
    }

    @OneToMany(mappedBy = "storage", cascade = CascadeType.ALL)
    public Set<Expense> getExpenses() {
	return expenses;
    }

    public void setExpenses(Set<Expense> expenses) {
	this.expenses = expenses;
    }

}
