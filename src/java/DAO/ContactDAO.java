/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import java.util.List;
import model.Contact;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import util.HibernateUtil;

/**
 *
 * @author rafael
 */
public class ContactDAO {

    ContactDAO() {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
    }

    public void create(Contact contact) {
        session.beginTransaction();
        session.save(contact);
        session.getTransaction().commit();
    }
    
    public Contact index() {
        session.beginTransaction();
        Query q = session.createQuery("FROM Contact");
        List result = (Contact) q.list();
        session.close();
        return result;
    }
    
    public Object show(int id) {
        session.beginTransaction();
        Query q = session.createQuery("from Contact where id = :id");
        q.setParameter("id", id);
        List result = (Contact) q.list();
        session.close();
        return result.get(0);
    }
    
    public void update(Contact contact) {
        session.beginTransaction();
        session.update(contact);
        session.getTransaction().commit();
    }
    
    public void delete(Contact contact) {
        session.beginTransaction();
        session.delete(contact)
        session.getTransaction().commit();
    }

}
