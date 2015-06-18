package com.cebedo.pmsys.service;

import java.util.List;
import java.util.Map;
import java.util.Set;

import com.cebedo.pmsys.enums.TaskStatus;
import com.cebedo.pmsys.model.Project;
import com.cebedo.pmsys.model.Staff;
import com.cebedo.pmsys.model.assignment.ManagerAssignment;

public interface ProjectService {

    /**
     * Create a new project.
     * 
     * @param project
     * @return
     */
    public String create(Project project);

    public Project getByID(long projectID);

    /**
     * Update a project.
     * 
     * @param project
     * @return
     */
    public String update(Project project);

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

    public List<Project> listWithTasks();

    public String getNameByID(long projectID);

    public void clearProjectCache(long projectID);

    public void clearSearchCache(Long companyID);

    public String getGanttJSON(Project proj);

    public Map<String, Object> getTimelineSummaryMap(Project proj);

    public Map<TaskStatus, Integer> getTaskStatusCountMap(Project proj);

    public String getCalendarJSON(Project proj);

    public void clearListCache();

    public List<Staff> getAllStaff(Project proj);

    public List<Staff> getAllManagers(Project proj);

    public List<Staff> getAllManagersWithUsers(Project proj);

    public Set<ManagerAssignment> getAllManagersAssignmentsWithUsers(
	    Project proj);

}