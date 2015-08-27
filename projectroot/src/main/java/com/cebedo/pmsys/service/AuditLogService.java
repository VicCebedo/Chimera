package com.cebedo.pmsys.service;

import java.util.List;

import com.cebedo.pmsys.model.AuditLog;

public interface AuditLogService {

    public AuditLog getByID(long id);

    public void delete(long id);

    public List<AuditLog> list();

}
