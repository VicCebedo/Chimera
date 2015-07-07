package com.cebedo.pmsys.enums;

public enum PlainDeformedRoundSteelBars {

    BAR_8_5(8.0, 5.0, CommonLengthUnit.MILLIMETER, CommonLengthUnit.METER,
	    1.98, CommonWeightUnit.KILOGRAM),

    BAR_10_5(10.0, 5.0, CommonLengthUnit.MILLIMETER, CommonLengthUnit.METER,
	    1.98, CommonWeightUnit.KILOGRAM),

    BAR_12_5(12.0, 5.0, CommonLengthUnit.MILLIMETER, CommonLengthUnit.METER,
	    1.98, CommonWeightUnit.KILOGRAM),

    BAR_13_5(13.0, 5.0, CommonLengthUnit.MILLIMETER, CommonLengthUnit.METER,
	    1.98, CommonWeightUnit.KILOGRAM);

    // BAR_13_5(13.0, 5.0, CommonLengthUnit.MILLIMETER, CommonLengthUnit.METER,
    // 1.98, CommonWeightUnit.KILOGRAM);
    //
    // BAR_13_5(13.0, 5.0, CommonLengthUnit.MILLIMETER, CommonLengthUnit.METER,
    // 1.98, CommonWeightUnit.KILOGRAM);
    //
    // BAR_13_5(13.0, 5.0, CommonLengthUnit.MILLIMETER, CommonLengthUnit.METER,
    // 1.98, CommonWeightUnit.KILOGRAM);
    //
    // BAR_13_5(13.0, 5.0, CommonLengthUnit.MILLIMETER, CommonLengthUnit.METER,
    // 1.98, CommonWeightUnit.KILOGRAM);

    private double diameter;
    private double length;
    private CommonLengthUnit diameterUnit;
    private CommonLengthUnit lengthUnit;
    private double weight;
    private CommonWeightUnit weightUnit;

    PlainDeformedRoundSteelBars(double d, double l, CommonLengthUnit dU,
	    CommonLengthUnit lU, double w, CommonWeightUnit wU) {
	this.diameter = d;
	this.length = l;
	this.diameterUnit = dU;
	this.lengthUnit = lU;
	this.weight = w;
	this.weightUnit = wU;
    }
}
