package com.cebedo.pmsys.dao.impl;

import java.util.List;

import org.hibernate.Hibernate;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import com.cebedo.pmsys.dao.SystemUserDAO;
import com.cebedo.pmsys.helper.DAOHelper;
import com.cebedo.pmsys.model.Company;
import com.cebedo.pmsys.model.SystemUser;

/**
 * A custom DAO for accessing data from the database.
 */
@Repository
public class SystemUserDAOImpl implements SystemUserDAO {

    private DAOHelper daoHelper = new DAOHelper();
    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
	this.sessionFactory = sessionFactory;
    }

    /**
     * Simulates retrieval of data from a database.
     * 
     * @param username
     * @return
     */
    @Override
    public SystemUser searchDatabase(String username) {
	// Retrieve all users from the database.
	List<SystemUser> users = list(null);

	// Search user based on the parameters.
	for (SystemUser dbUser : users) {
	    if (dbUser.getUsername().equals(username) == true) {
		Hibernate.initialize(dbUser.getStaff());

		Company co = dbUser.getCompany();
		Hibernate.initialize(co);
		return dbUser;
	    }
	}
	throw new RuntimeException("User does not exist.");
    }

    /**
     * Get list of all system users from the database.
     */
    @SuppressWarnings("unchecked")
    @Override
    public List<SystemUser> list(Long companyID) {
	Session session = this.sessionFactory.getCurrentSession();
	List<SystemUser> systemUserList = this.daoHelper
		.getSelectQueryFilterCompany(session, SystemUser.class.getName(), companyID).list();
	return systemUserList;
    }

    @Override
    public void create(SystemUser user) {
	Session session = this.sessionFactory.getCurrentSession();
	session.persist(user);
    }

    @Override
    public void update(SystemUser user) {
	Session session = this.sessionFactory.getCurrentSession();
	session.update(user);
    }

    @Override
    public void delete(long id) {
	Session session = this.sessionFactory.getCurrentSession();
	String hql = "DELETE FROM " + SystemUser.class.getName();
	hql += " WHERE " + SystemUser.COLUMN_PRIMARY_KEY + "=:" + SystemUser.COLUMN_PRIMARY_KEY;
	Query query = session.createQuery(hql);
	query.setParameter(SystemUser.COLUMN_PRIMARY_KEY, id);
	query.executeUpdate();
    }

    @Override
    public SystemUser getByID(long id) {
	Session session = this.sessionFactory.getCurrentSession();
	SystemUser user = (SystemUser) session.load(SystemUser.class, new Long(id));
	Hibernate.initialize(user.getStaff());
	return user;
    }

    @Override
    public SystemUser getWithSecurityByID(long id) {
	Session session = this.sessionFactory.getCurrentSession();
	SystemUser user = (SystemUser) session.load(SystemUser.class, new Long(id));
	Hibernate.initialize(user.getStaff());
	return user;
    }
}
