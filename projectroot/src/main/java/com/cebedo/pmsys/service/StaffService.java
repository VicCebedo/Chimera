package com.cebedo.pmsys.service;

import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.web.multipart.MultipartFile;

import com.cebedo.pmsys.domain.Attendance;
import com.cebedo.pmsys.domain.ProjectPayroll;
import com.cebedo.pmsys.enums.AttendanceStatus;
import com.cebedo.pmsys.enums.TaskStatus;
import com.cebedo.pmsys.model.Company;
import com.cebedo.pmsys.model.Project;
import com.cebedo.pmsys.model.Staff;
import com.cebedo.pmsys.model.assignment.StaffTeamAssignment;

public interface StaffService {

    /**
     * Create a new staff.
     * 
     * @param staff
     * @return
     */
    public String create(Staff staff);

    public Staff getByID(long id);

    /**
     * Update a staff.
     * 
     * @param staff
     * @return
     */
    public String update(Staff staff);

    /**
     * Delete a staff.
     * 
     * @param id
     * @return
     */
    public String delete(long id);

    public List<Staff> list();

    public List<Staff> list(Long companyID);

    public List<Staff> listWithAllCollections();

    public Staff getWithAllCollectionsByID(long id);

    /**
     * Unassign a team from staff.
     * 
     * @param teamID
     * @param staffID
     * @return
     */
    public String unassignTeam(long teamID, long staffID);

    /**
     * Unassign all teams.
     * 
     * @param staffID
     * @return
     */
    public String unassignAllTeams(long staffID);

    /**
     * Assign a team.
     * 
     * @param stAssign
     * @return
     */
    public String assignTeam(StaffTeamAssignment stAssign);

    public List<Staff> listUnassignedInProject(Long companyID, Project project);

    public String getNameByID(long staffID);

    /**
     * Create a staff from a specific origin.
     * 
     * @param staff
     * @param origin
     * @param originID
     * @return
     */
    public String createFromOrigin(Staff staff, String origin, String originID);

    public String getCalendarJSON(Staff staff, Set<Attendance> attendanceList);

    public String getGanttJSON(Staff staff);

    public Map<TaskStatus, Integer> getTaskStatusCountMap(Staff staff);

    public Map<AttendanceStatus, Map<String, Double>> getAttendanceStatusCountMap(
	    Set<Attendance> attendanceList);

    /**
     * List all staff from company except.
     * 
     * @param coID
     * @param staff
     * @return
     */
    public List<Staff> listExcept(Long coID, Set<Staff> staff);

    public String assignStaffMass(Project project);

    public String unassignStaffMember(Project project, long staffID);

    public String unassignAllStaffMembers(Project project);

    public List<Staff> listUnassignedStaffInProject(Long companyID, Project proj);

    public List<Staff> listUnassignedStaffInProjectPayroll(Long companyID, ProjectPayroll projectPayroll);

    public List<Staff> listWithUsers(Long companyID);

    /**
     * List staff with users, and filter by given set.
     * 
     * @param companyID
     * @param managers
     * @return
     */
    public List<Staff> listWithUsersAndFilter(Long companyID, Set<Staff> filterList);

    public List<Staff> convertExcelToStaffList(MultipartFile multipartFile, Company company);

    public List<Staff> createOrGetStaffInList(List<Staff> staffList);

}
