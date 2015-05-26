package com.cebedo.pmsys.model.assignment;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import com.cebedo.pmsys.model.Staff;
import com.cebedo.pmsys.model.Team;

@Entity
@Table(name = StaffTeamAssignment.TABLE_NAME)
public class StaffTeamAssignment implements Serializable {

	public static final String TABLE_NAME = "assignments_staff_team";

	private static final long serialVersionUID = 1L;

	private long staffID;
	private long teamID;

	@Id
	@Column(name = Staff.COLUMN_PRIMARY_KEY, nullable = false)
	public long getStaffID() {
		return staffID;
	}

	public void setStaffID(long staffID) {
		this.staffID = staffID;
	}

	@Id
	@Column(name = Team.COLUMN_PRIMARY_KEY, nullable = false)
	public long getTeamID() {
		return teamID;
	}

	public void setTeamID(long teamID) {
		this.teamID = teamID;
	}

}