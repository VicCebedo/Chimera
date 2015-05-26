package com.cebedo.pmsys.repository;

import java.util.Set;

import com.cebedo.pmsys.domain.IDomainObject;

public interface ISetRepository<V extends IDomainObject> {

	void add(V obj);

	Set<V> members(String key);

}