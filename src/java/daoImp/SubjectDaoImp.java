/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package daoImp;

import connection.ConnectDB;
import dao.SubjectDao;
import entities.SjoinT;
import entities.Subject;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author PEEPO
 */
public class SubjectDaoImp implements SubjectDao{

    static Connection dbConnect = null;
    static PreparedStatement pre = null;
    StringBuilder sql = new StringBuilder();
    
    @Override
    public void addSubject(Subject subject) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        session.save(subject);
        transaction.commit();
        session.close();
    }

    @Override
    public List<Subject> getAllSubject() {
        List<Subject> list = new ArrayList();
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        Query query = session.createQuery("FROM Subject");
        list = query.list();
        transaction.commit();
        session.close();
        return list;
    }
    
    
    public List<SjoinT> getAllSubjectJoin() {
        List<SjoinT> list = new ArrayList();
        SjoinT bean = new SjoinT();
        sql.append(" SELECT * ")
           .append(" FROM webmonitoring.subject INNER JOIN webmonitoring.teacher ")
           .append(" ON webmonitoring.subject.teacher_id = webmonitoring.teacher.teacher_id ");
        try{
            dbConnect = ConnectDB.getConnection();
            pre = dbConnect.prepareStatement(sql.toString());
            ResultSet rec = pre.executeQuery();
            boolean rows = rec.next();
            if(rows){
                do{
                    bean.setSubjectId(rec.getString("subject_id"));
                    bean.setSubjectName(rec.getString("subject_name"));
                    bean.setTeacherId(rec.getString("teacher_id"));
                    bean.setNameTitle(rec.getString("name_title"));
                    bean.setName(rec.getString("name"));
                    bean.setSurname(rec.getString("surname"));
                    list.add(bean);
                    bean = new SjoinT();
                }while(rec.next());
            }
            dbConnect.close();
        }catch(Exception e){
            System.out.println("Exception getAllSubjectJoin    :    "+e);
        }
        return list;
    }
    
    @Override
    public List<Subject> getSubjectById(int id) {
        List<Subject> list = new ArrayList();
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        Query query = session.createQuery("FROM Subject WHERE subjectId = "+id);
        list = query.list();
        transaction.commit();
        session.close();
        return list;
    }

    @Override
    public void updateSubject(Subject subject) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        session.update(subject);
        transaction.commit();
        session.close();
    }

    @Override
    public void deleteSubject(Subject subject) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        session.delete(subject);
        transaction.commit();
        session.close();
    }
    
}
