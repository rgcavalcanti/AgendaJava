package DAO;

import java.util.List;
import model.Contact;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import util.HibernateUtil;

public class ContactDAO {
    
    private Session session = null;
    
    public ContactDAO(){
        this.session = HibernateUtil.getSessionFactory().getCurrentSession();
    }
    
    public int create(Contact contact) {
        Transaction tx = session.beginTransaction();
        int id = (Integer) session.save(contact);
        tx.commit();
        return id;
    }
    
    public List<Contact> index() {
        Transaction tx = session.beginTransaction();
        Query q = session.createQuery("FROM Contact");
        List result = (List<Contact>) q.list();
        session.close();
        return result;
    }
    
    public Contact show(int id) {
        Transaction tx = session.beginTransaction();
        Query q = session.createQuery("from Contact where id = :id");
        q.setParameter("id", id);
        List<Contact> result = (List<Contact>) q.list();
        session.close();
        return result.get(0);
    }
    
    public void update(Contact contact) {
        Transaction tx = session.beginTransaction();
        session.update(contact);
        tx.commit();
    }
    
    public void delete(Contact contact) {
        Transaction tx = session.beginTransaction();
        session.delete(contact);
        tx.commit();
    }
    
    public void delete(int id) {
        Transaction tx = session.beginTransaction();
        Query q = session.createQuery("delete from Contact where id = :id");
        q.setParameter("id", id);
        q.executeUpdate();
        tx.commit();
    }
}
