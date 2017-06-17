/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package daoImp;

import dao.MajorDao;
import entities.Major;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author PEEPO
 */
public class MajorDaoImp implements MajorDao{

    @Override
    public void addMajor(Major major) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        session.save(major);
        transaction.commit();
        session.close();
    }

    @Override
    public List<Major> getAllMajor() {
        List<Major> list = new ArrayList();
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        Query query = session.createQuery("FROM Major");
        list = query.list();
        transaction.commit();
        session.close();
        return list;
    }

    @Override
    public void updateMajor(Major major) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        session.update(major);
        transaction.commit();
        session.close();
    }

    @Override
    public void delMajor(Major major) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        session.delete(major);
        transaction.commit();
        session.close();
    }
    
}
