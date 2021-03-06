package com.cebedo.pmsys.base;

public interface IObjectDomain extends IObjectBase, IObjectWithCompany {

    String getKey();

    public boolean equals(Object obj);

    public int hashCode();

}
