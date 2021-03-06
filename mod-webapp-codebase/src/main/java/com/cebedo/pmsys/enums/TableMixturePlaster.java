package com.cebedo.pmsys.enums;

public enum TableMixturePlaster {

    CLASS_A("Class A", "A", 1, 2, 18.0, UnitMass.CEMENT_BAG_40KG, 14.5,
	    UnitMass.CEMENT_BAG_50KG, 1.0, UnitVolume.CUBIC_METER),

    CLASS_B("Class B", "B", 1, 3, 12.0, UnitMass.CEMENT_BAG_40KG, 9.5,
	    UnitMass.CEMENT_BAG_50KG, 1.0, UnitVolume.CUBIC_METER),

    CLASS_C("Class C", "C", 1, 4, 9.0, UnitMass.CEMENT_BAG_40KG, 7.0,
	    UnitMass.CEMENT_BAG_50KG, 1.0, UnitVolume.CUBIC_METER),

    CLASS_D("Class D", "D", 1, 5, 7.5, UnitMass.CEMENT_BAG_40KG, 6.0,
	    UnitMass.CEMENT_BAG_50KG, 1.0, UnitVolume.CUBIC_METER);

    private String label;
    private String mixClass;
    private double ratioCement;
    private double ratioSand;
    private double partCement40kg;
    private UnitMass partCement40kgUnit;
    private double partCement50kg;
    private UnitMass partCement50kgUnit;
    private double partSand;
    private UnitVolume partSandUnit;

    TableMixturePlaster(String label, String mixClass, double ratioCement, double ratioSand,
	    double partCement40kg, UnitMass partCement40kgUnit, double partCement50kg,
	    UnitMass partCement50kgUnit, double partSand, UnitVolume partSandUnit) {
	this.mixClass = mixClass;
	this.label = label;
	this.ratioCement = ratioCement;
	this.ratioSand = ratioSand;
	this.partCement40kg = partCement40kg;
	this.partCement40kgUnit = partCement40kgUnit;
	this.partCement50kg = partCement50kg;
	this.partCement50kgUnit = partCement50kgUnit;
	this.partSand = partSand;
	this.partSandUnit = partSandUnit;
    }

    public String getMixClass() {
	return mixClass;
    }

    public void setMixClass(String mixClass) {
	this.mixClass = mixClass;
    }

    public String getLabel() {
	return label;
    }

    public void setLabel(String label) {
	this.label = label;
    }

    public double getRatioCement() {
	return ratioCement;
    }

    public void setRatioCement(double ratioCement) {
	this.ratioCement = ratioCement;
    }

    public double getRatioSand() {
	return ratioSand;
    }

    public void setRatioSand(double ratioSand) {
	this.ratioSand = ratioSand;
    }

    public double getPartCement40kg() {
	return partCement40kg;
    }

    public void setPartCement40kg(double partCement40kg) {
	this.partCement40kg = partCement40kg;
    }

    public UnitMass getPartCement40kgUnit() {
	return partCement40kgUnit;
    }

    public void setPartCement40kgUnit(UnitMass partCement40kgUnit) {
	this.partCement40kgUnit = partCement40kgUnit;
    }

    public double getPartCement50kg() {
	return partCement50kg;
    }

    public void setPartCement50kg(double partCement50kg) {
	this.partCement50kg = partCement50kg;
    }

    public UnitMass getPartCement50kgUnit() {
	return partCement50kgUnit;
    }

    public void setPartCement50kgUnit(UnitMass partCement50kgUnit) {
	this.partCement50kgUnit = partCement50kgUnit;
    }

    public double getPartSand() {
	return partSand;
    }

    public void setPartSand(double partSand) {
	this.partSand = partSand;
    }

    public UnitVolume getPartSandUnit() {
	return partSandUnit;
    }

    public void setPartSandUnit(UnitVolume partSandUnit) {
	this.partSandUnit = partSandUnit;
    }

}
