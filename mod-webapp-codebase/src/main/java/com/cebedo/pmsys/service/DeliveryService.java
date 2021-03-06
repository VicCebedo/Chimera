package com.cebedo.pmsys.service;

import java.util.Date;
import java.util.List;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.validation.BindingResult;

import com.cebedo.pmsys.base.IObjectExpense;
import com.cebedo.pmsys.constants.RegistryCache;
import com.cebedo.pmsys.domain.Delivery;
import com.cebedo.pmsys.model.Project;

public interface DeliveryService {

    /**
     * Export list of deliveries.
     * 
     * @param projID
     * @return
     */
    @PreAuthorize("hasAnyRole('ADMIN_COMPANY', 'INVENTORY_VIEW')")
    public HSSFWorkbook exportXLS(long projID);

    /**
     * Create or update a delivery.
     * 
     * @param obj
     * @param result
     * @return
     */
    @CacheEvict(value = RegistryCache.PROJECT_GET_WITH_COLLECTIONS, key = "#obj.project.id")
    @PreAuthorize("(#obj.uuid == null and hasAnyRole('ADMIN_COMPANY', 'INVENTORY_CREATE')) or"
	    + " (#obj.uuid != null and hasAnyRole('ADMIN_COMPANY', 'INVENTORY_UPDATE'))")
    public String set(Delivery obj, BindingResult result);

    /**
     * Delete a delivery.
     * 
     * @param key
     * @param projectId
     * @return
     */
    @CacheEvict(value = RegistryCache.PROJECT_GET_WITH_COLLECTIONS, key = "#projectId")
    @PreAuthorize("hasAnyRole('ADMIN_COMPANY', 'INVENTORY_DELETE')")
    public String delete(String key, long projectId);

    public List<Delivery> listDesc(Project proj);

    public List<Delivery> listAsc(Project proj);

    public List<Delivery> listAsc(Project proj, boolean override);

    public List<Delivery> listDesc(Project proj, Date startDate, Date endDate);

    public Delivery get(String uuid);

    public List<IObjectExpense> listDescExpense(Project proj);

    public List<IObjectExpense> listDescExpense(Project proj, Date startDate, Date endDate);

}
