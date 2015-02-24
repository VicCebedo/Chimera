package com.cebedo.pmsys.field.dao;

import java.util.List;

import com.cebedo.pmsys.field.model.Field;
import com.cebedo.pmsys.field.model.FieldAssignment;
import com.cebedo.pmsys.task.model.TaskFieldAssignment;

public interface FieldDAO {

	public void create(Field field);

	public Field getByID(long id);

	public void update(Field field);

	public void delete(long id);

	public List<Field> list();

	public List<Field> listWithAllCollections();

	public void assignProject(FieldAssignment fieldAssignment);

	public void unassignProject(long fieldID, long projID, String label,
			String value);

	public void unassignAllProjects(long projectID);

	public FieldAssignment getFieldByKeys(long projectID, long fieldID,
			String label, String value);

	public void deleteAssignedField(long projectID, long fieldID, String label,
			String value);

	public void assignTask(TaskFieldAssignment taskField);
}
