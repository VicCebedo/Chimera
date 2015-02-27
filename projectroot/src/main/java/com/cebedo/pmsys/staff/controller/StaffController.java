package com.cebedo.pmsys.staff.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.cebedo.pmsys.common.SystemConstants;
import com.cebedo.pmsys.field.controller.FieldController;
import com.cebedo.pmsys.field.model.Field;
import com.cebedo.pmsys.field.service.FieldService;
import com.cebedo.pmsys.project.model.Project;
import com.cebedo.pmsys.staff.model.ManagerAssignment;
import com.cebedo.pmsys.staff.model.Staff;
import com.cebedo.pmsys.staff.model.StaffTeamAssignment;
import com.cebedo.pmsys.staff.service.StaffService;
import com.cebedo.pmsys.team.controller.TeamController;
import com.cebedo.pmsys.team.model.Team;
import com.cebedo.pmsys.team.service.TeamService;

@Controller
@RequestMapping(Staff.OBJECT_NAME)
public class StaffController {

	public static final String ATTR_LIST = "staffList";
	public static final String ATTR_STAFF = Staff.OBJECT_NAME;
	public static final String JSP_LIST = "staffList";
	public static final String JSP_EDIT = "staffEdit";

	private StaffService staffService;
	private TeamService teamService;
	private FieldService fieldService;

	@Autowired(required = true)
	@Qualifier(value = "fieldService")
	public void setFieldService(FieldService s) {
		this.fieldService = s;
	}

	@Autowired(required = true)
	@Qualifier(value = "staffService")
	public void setStaffService(StaffService s) {
		this.staffService = s;
	}

	@Autowired(required = true)
	@Qualifier(value = "teamService")
	public void setTeamService(TeamService s) {
		this.teamService = s;
	}

	@RequestMapping(value = { SystemConstants.REQUEST_ROOT,
			SystemConstants.REQUEST_LIST }, method = RequestMethod.GET)
	public String listStaff(Model model) {
		model.addAttribute(ATTR_LIST,
				this.staffService.listWithAllCollections());
		model.addAttribute(SystemConstants.ATTR_ACTION,
				SystemConstants.ACTION_LIST);
		return JSP_LIST;
	}

	@RequestMapping(value = SystemConstants.REQUEST_CREATE, method = RequestMethod.POST)
	public String create(@ModelAttribute(ATTR_STAFF) Staff staff) {
		if (staff.getId() == 0) {
			this.staffService.create(staff);
		} else {
			this.staffService.update(staff);
		}
		return SystemConstants.CONTROLLER_REDIRECT + ATTR_STAFF + "/"
				+ SystemConstants.REQUEST_LIST;
	}

	/**
	 * Create a staff from the Project Edit jsp.
	 * 
	 * @param staff
	 * @param projectID
	 * @return
	 */
	@RequestMapping(value = SystemConstants.REQUEST_CREATE + "/"
			+ SystemConstants.FROM_PROJECT, method = RequestMethod.POST)
	public String createFromProject(@ModelAttribute(ATTR_STAFF) Staff staff,
			@RequestParam(Project.COLUMN_PRIMARY_KEY) long projectID) {
		if (staff.getId() == 0) {
			this.staffService.create(staff);
		} else {
			this.staffService.update(staff);
		}
		return SystemConstants.CONTROLLER_REDIRECT + Project.OBJECT_NAME + "/"
				+ SystemConstants.REQUEST_EDIT + "/" + projectID;
	}

	@RequestMapping("/" + SystemConstants.REQUEST_DELETE + "/{"
			+ Staff.COLUMN_PRIMARY_KEY + "}")
	public String delete(@PathVariable(Staff.COLUMN_PRIMARY_KEY) int id) {
		this.staffService.delete(id);
		return SystemConstants.CONTROLLER_REDIRECT + ATTR_STAFF + "/"
				+ SystemConstants.REQUEST_LIST;
	}

	/**
	 * If the Create/Edit Staff request is coming from the project.
	 * 
	 * @param staffID
	 * @param projectID
	 * @param model
	 * @return
	 */
	@RequestMapping("/" + SystemConstants.REQUEST_EDIT + "/"
			+ SystemConstants.FROM_PROJECT)
	public String editStaffFromProject(
			@RequestParam(Staff.COLUMN_PRIMARY_KEY) int staffID,
			@RequestParam(Project.COLUMN_PRIMARY_KEY) int projectID, Model model) {
		// Add origin details.
		model.addAttribute(SystemConstants.ORIGIN, Project.OBJECT_NAME);
		model.addAttribute(SystemConstants.ORIGIN_ID, projectID);

		// If new, create it.
		if (staffID == 0) {
			model.addAttribute(ATTR_STAFF, new Staff());
			model.addAttribute(SystemConstants.ATTR_ACTION,
					SystemConstants.ACTION_CREATE);
			return JSP_EDIT;
		}

		// Else if not new, edit it.
		model.addAttribute(ATTR_STAFF, this.staffService.getByID(staffID));
		model.addAttribute(SystemConstants.ATTR_ACTION,
				SystemConstants.ACTION_EDIT);
		return JSP_EDIT;
	}

	/**
	 * Open a view page where the user can edit the staff.
	 * 
	 * @param id
	 * @param model
	 * @return
	 */
	@RequestMapping("/" + SystemConstants.REQUEST_EDIT + "/{"
			+ Staff.COLUMN_PRIMARY_KEY + "}")
	public String editStaff(@PathVariable(Staff.COLUMN_PRIMARY_KEY) int id,
			Model model) {
		List<Team> teamList = this.teamService.list();
		List<Field> fields = this.fieldService.list();
		model.addAttribute(TeamController.JSP_LIST, teamList);
		model.addAttribute(FieldController.JSP_LIST, fields);
		if (id == 0) {
			model.addAttribute(ATTR_STAFF, new Staff());
			model.addAttribute(SystemConstants.ATTR_ACTION,
					SystemConstants.ACTION_CREATE);
			return JSP_EDIT;
		}
		model.addAttribute(ATTR_STAFF,
				this.staffService.getWithAllCollectionsByID(id));
		model.addAttribute(SystemConstants.ATTR_ACTION,
				SystemConstants.ACTION_EDIT);
		return JSP_EDIT;
	}

	/**
	 * Unassign all staff from a project.
	 * 
	 * @param projectID
	 * @return
	 */
	@RequestMapping(value = SystemConstants.REQUEST_UNASSIGN_PROJECT_ALL, method = RequestMethod.POST)
	public ModelAndView unassignAllProjectManagers(
			@RequestParam(Project.COLUMN_PRIMARY_KEY) long projectID) {
		this.staffService.unassignAllProjectManagers(projectID);
		return new ModelAndView(SystemConstants.CONTROLLER_REDIRECT
				+ Project.OBJECT_NAME + "/" + SystemConstants.REQUEST_EDIT
				+ "/" + projectID);
	}

	/**
	 * Unassign a staff from a project.
	 * 
	 * @param projectID
	 * @param staffID
	 * @param position
	 * @return
	 */
	@RequestMapping(value = SystemConstants.REQUEST_UNASSIGN_PROJECT, method = RequestMethod.POST)
	public ModelAndView unassignProjectManager(
			@RequestParam(Project.COLUMN_PRIMARY_KEY) long projectID,
			@RequestParam(Staff.COLUMN_PRIMARY_KEY) long staffID) {
		this.staffService.unassignProjectManager(projectID, staffID);
		return new ModelAndView(SystemConstants.CONTROLLER_REDIRECT
				+ Project.OBJECT_NAME + "/" + SystemConstants.REQUEST_EDIT
				+ "/" + projectID);
	}

	/**
	 * Assign a staff to a project.
	 * 
	 * @param projectID
	 * @param staffID
	 * @param position
	 * @return
	 */
	@RequestMapping(value = SystemConstants.REQUEST_ASSIGN_PROJECT, method = RequestMethod.POST)
	public ModelAndView assignProjectManager(
			@RequestParam(Project.COLUMN_PRIMARY_KEY) long projectID,
			@RequestParam(Staff.COLUMN_PRIMARY_KEY) long staffID,
			@RequestParam(ManagerAssignment.COLUMN_PROJECT_POSITION) String position) {
		this.staffService.assignProjectManager(projectID, staffID, position);
		return new ModelAndView(SystemConstants.CONTROLLER_REDIRECT
				+ Project.OBJECT_NAME + "/" + SystemConstants.REQUEST_EDIT
				+ "/" + projectID);
	}

	/**
	 * Unassign a staff from a team.
	 * 
	 * @param teamID
	 * @param staffID
	 * @return
	 */
	@RequestMapping(value = SystemConstants.REQUEST_UNASSIGN + "/"
			+ Team.OBJECT_NAME, method = RequestMethod.POST)
	public ModelAndView unassignTeam(
			@RequestParam(Team.COLUMN_PRIMARY_KEY) long teamID,
			@RequestParam(Staff.COLUMN_PRIMARY_KEY) long staffID,
			@RequestParam(value = SystemConstants.ORIGIN, required = false) String origin) {
		this.staffService.unassignTeam(teamID, staffID);
		if (origin.equals(Team.OBJECT_NAME)) {
			return new ModelAndView(SystemConstants.CONTROLLER_REDIRECT
					+ Team.OBJECT_NAME + "/" + SystemConstants.REQUEST_EDIT
					+ "/" + teamID);
		}
		return new ModelAndView(SystemConstants.CONTROLLER_REDIRECT
				+ Staff.OBJECT_NAME + "/" + SystemConstants.REQUEST_EDIT + "/"
				+ staffID);
	}

	/**
	 * Unassign all teams from a staff.
	 * 
	 * @param teamID
	 * @param staffID
	 * @return
	 */
	@RequestMapping(value = SystemConstants.REQUEST_UNASSIGN + "/"
			+ Team.OBJECT_NAME + "/" + SystemConstants.ALL, method = RequestMethod.POST)
	public ModelAndView unassignAllTeams(
			@RequestParam(Staff.COLUMN_PRIMARY_KEY) long staffID) {
		this.staffService.unassignAllTeams(staffID);
		return new ModelAndView(SystemConstants.CONTROLLER_REDIRECT
				+ Staff.OBJECT_NAME + "/" + SystemConstants.REQUEST_EDIT + "/"
				+ staffID);
	}

	/**
	 * Assign a team to a staff.
	 * 
	 * @param staffID
	 * @param teamID
	 * @return
	 */
	@RequestMapping(value = SystemConstants.REQUEST_ASSIGN + "/"
			+ Team.OBJECT_NAME, method = RequestMethod.POST)
	public ModelAndView assignTeam(
			@RequestParam(Staff.COLUMN_PRIMARY_KEY) long staffID,
			@RequestParam(Team.COLUMN_PRIMARY_KEY) long teamID,
			@RequestParam(value = SystemConstants.ORIGIN, required = false) String origin,
			@RequestParam(value = SystemConstants.ORIGIN_ID, required = false) String originID) {
		StaffTeamAssignment stAssign = new StaffTeamAssignment();
		stAssign.setStaffID(staffID);
		stAssign.setTeamID(teamID);
		this.staffService.assignTeam(stAssign);
		if (!origin.isEmpty()) {
			return new ModelAndView(SystemConstants.CONTROLLER_REDIRECT
					+ origin + "/" + SystemConstants.REQUEST_EDIT + "/"
					+ originID);
		}
		return new ModelAndView(SystemConstants.CONTROLLER_REDIRECT
				+ Staff.OBJECT_NAME + "/" + SystemConstants.REQUEST_EDIT + "/"
				+ staffID);
	}
}
