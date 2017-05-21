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

    public void create(Contact contact) {
        SessionFactory factory = HibernateUtil.getSessionFactory();
        Session session = factory.getCurrentSession();
        session.beginTransaction();
        session.save(contact);
        session.getTransaction().commit();
    }
    
    public List index(){
        SessionFactory factory = HibernateUtil.getSessionFactory();
        Session session = factory.getCurrentSession();
        session.beginTransaction();
        Query q = session.createQuery("FROM Contact");
        List result = q.list();
        session.close();
        return result;
    }
    
    public Object show(int id){
        SessionFactory factory = HibernateUtil.getSessionFactory();
        Session session = factory.getCurrentSession();
        session.beginTransaction();
        Query q = session.createQuery("from Contact where id = :id");
        q.setParameter("id", id);
        List result = q.list();
        session.close();
        return result.get(0);
    }
    
    public void update(Contact contact){
        SessionFactory factory = HibernateUtil.getSessionFactory();
        Session session = factory.getCurrentSession();
        session.beginTransaction();
        Query q = session.createQuery( "update Contact"
                                     + "set name = :name"
                                     + "set email = :email"
                                     + "set phone = :phone"
                                     );
        q.setParameter("name", contact.getName());
        q.setParameter("email", contact.getEmail());
        q.setParameter("phone", contact.getPhone());
        q.executeUpdate();
        session.getTransaction().commit();
    }
    
    public void delete(int id){
         SessionFactory factory = HibernateUtil.getSessionFactory();
        Session session = factory.getCurrentSession();
        session.beginTransaction();
        Query q = session.createQuery( "delete Contact where id = :id");
        q.setParameter("id", id);
        q.executeUpdate();
        session.getTransaction().commit();
    }

}
