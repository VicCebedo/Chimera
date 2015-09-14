package com.cebedo.pmsys.service;

import java.util.List;
import java.util.Map;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.validation.BindingResult;
import org.springframework.web.multipart.MultipartFile;

import com.cebedo.pmsys.enums.TaskStatus;
import com.cebedo.pmsys.model.Project;

public interface ProjectService {

    public HSSFWorkbook exportXLS(long projID);

    /**
     * Create a new project.
     * 
     * @param project
     * @param result
     * @return
     */
    public String create(Project project, BindingResult result);

    public Project getByID(long projectID);

    /**
     * Update a project.
     * 
     * @param project
     * @param result
     * @return
     */
    public String update(Project project, BindingResult result);

    /**
     * Delete a project.
     * 
     * @param id
     * @return
     */
    public String delete(long id);

    public List<Project> list();

    public List<Project> listWithAllCollections();

    public Project getByIDWithAllCollections(long id);

    public String getGanttJSON(Project proj);

    public Map<TaskStatus, Integer> getTaskStatusCountMap(Project proj);

    public String getCalendarJSON(Project proj);

    public String createStaffFromExcel(MultipartFile multipartFile, Project proj, BindingResult result);

    public String createTasksFromExcel(MultipartFile multipartFile, Project project, BindingResult result);

    public String clearActualCompletionDate(Project proj);

}