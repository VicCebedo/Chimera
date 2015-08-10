package com.cebedo.pmsys.bean;

import java.io.Serializable;

import com.cebedo.pmsys.domain.Estimate;
import com.cebedo.pmsys.utils.EstimateUtils;

public class MasonryCHBLayingEstimateResults implements Serializable {

    private static final long serialVersionUID = -927040799981812601L;

    /**
     * Results.
     */
    private double bags;
    private double sand;

    // Cost.
    private double costCement40kg;
    private double costCement50kg;
    private double costSand;

    public MasonryCHBLayingEstimateResults() {
	;
    }

    public MasonryCHBLayingEstimateResults(Estimate estimate, double bags40kg, double sandNeeded) {
	setBags(bags40kg);
	setSand(sandNeeded);

	double bags50kg = EstimateUtils.convert40kgTo50kg(bags40kg);
	setCostCement40kg(bags40kg * estimate.getCostPerUnitCement40kg());
	setCostCement50kg(bags50kg * estimate.getCostPerUnitCement50kg());
	setCostSand(sandNeeded * estimate.getCostPerUnitSand());
    }

    public double getCement40kg() {
	return bags;
    }

    public void setBags(double bags) {
	this.bags = bags;
    }

    public double getSand() {
	return sand;
    }

    public void setSand(double sand) {
	this.sand = sand;
    }

    public double getCostCement40kg() {
	return costCement40kg;
    }

    public void setCostCement40kg(double costCement40kg) {
	this.costCement40kg = costCement40kg;
    }

    public double getCostCement50kg() {
	return costCement50kg;
    }

    public void setCostCement50kg(double costCement50kg) {
	this.costCement50kg = costCement50kg;
    }

    public double getCostSand() {
	return costSand;
    }

    public void setCostSand(double costSand) {
	this.costSand = costSand;
    }

}
