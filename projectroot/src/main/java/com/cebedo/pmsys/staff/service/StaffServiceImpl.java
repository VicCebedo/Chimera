package com.cebedo.pmsys.staff.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cebedo.pmsys.login.authentication.AuthenticationToken;
import com.cebedo.pmsys.project.dao.ProjectDAO;
import com.cebedo.pmsys.project.model.Project;
import com.cebedo.pmsys.staff.dao.StaffDAO;
import com.cebedo.pmsys.staff.model.ManagerAssignment;
import com.cebedo.pmsys.staff.model.Staff;
import com.cebedo.pmsys.staff.model.StaffTeamAssignment;

@Service
public class StaffServiceImpl implements StaffService {

	private StaffDAO staffDAO;
	private ProjectDAO projectDAO;

	public void setProjectDAO(ProjectDAO projectDAO) {
		this.projectDAO = projectDAO;
	}

	public void setStaffDAO(StaffDAO staffDAO) {
		this.staffDAO = staffDAO;
	}

	@Override
	@Transactional
	public void create(Staff staff) {
		this.staffDAO.create(staff);
	}

	@Override
	@Transactional
	public Staff getByID(long id) {
		return this.staffDAO.getByID(id);
	}

	@Override
	@Transactional
	public void update(Staff staff) {
		this.staffDAO.update(staff);
	}

	@Override
	@Transactional
	public void delete(long id) {
		this.staffDAO.delete(id);
	}

	@Override
	@Transactional
	public List<Staff> list() {
		return this.staffDAO.list();
	}

	@Override
	@Transactional
	public List<Staff> listWithAllCollections() {
		AuthenticationToken token = AuthenticationToken.get();
		if (token.isSuperAdmin()) {
			return this.staffDAO.listWithAllCollections(null);
		}
		return this.staffDAO.listWithAllCollections(token.getCompany().getId());
	}

	@Override
	@Transactional
	public void assignProjectManager(long projectID, long staffID,
			String position) {
		Project project = this.projectDAO.getByID(projectID);
		Staff staff = this.staffDAO.getByID(staffID);
		ManagerAssignment assignment = new ManagerAssignment();
		assignment.setProject(project);
		assignment.setManager(staff);
		assignment.setProjectPosition(position);
		this.staffDAO.assignProjectManager(assignment);
	}

	@Override
	@Transactional
	public void unassignProjectManager(long projectID, long staffID) {
		this.staffDAO.unassignProjectManager(projectID, staffID);
	}

	@Override
	@Transactional
	public void unassignAllProjectManagers(long projectID) {
		this.staffDAO.unassignAllProjectManagers(projectID);
	}

	@Override
	@Transactional
	public Staff getWithAllCollectionsByID(int id) {
		return this.staffDAO.getWithAllCollectionsByID(id);
	}

	@Override
	@Transactional
	public void unassignTeam(long teamID, long staffID) {
		this.staffDAO.unassignTeam(teamID, staffID);
	}

	@Override
	@Transactional
	public void unassignAllTeams(long staffID) {
		this.staffDAO.unassignAllTeams(staffID);
	}

	@Override
	@Transactional
	public void assignTeam(StaffTeamAssignment stAssign) {
		this.staffDAO.assignTeam(stAssign);
	}
}
