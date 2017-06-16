/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package daoImp;

import connection.ConnectDB;
import dao.ReportActivityDao;
import entities.ReportActivity;
import entities.ReportActivitySum;
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
public class ReportActivityDaoImp implements ReportActivityDao {

    static Connection dbConnect = null;
    static PreparedStatement pre = null;
    StringBuilder sql = new StringBuilder();

    @Override
    public void addReport(ReportActivity report) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        session.save(report);
        transaction.commit();
        session.close();
    }

    @Override
    public List<ReportActivity> getReportBySubjectId(String subject_id) {
        List<ReportActivity> list = new ArrayList();
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        Query query = session.createQuery("FROM ReportActivity WHERE subjectId = :subject_id");
        query.setParameter("subject_id", subject_id);
        list = query.list();
        transaction.commit();
        session.close();
        return list;
    }

    @Override
    public List<ReportActivity> getAllReport() {
        List<ReportActivity> list = new ArrayList();
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        Query query = session.createQuery("FROM ReportActivity");
        list = query.list();
        transaction.commit();
        session.close();
        return list;
    }

    @Override
    public List<ReportActivity> getReportByActivityId(int id) {
        List<ReportActivity> list = new ArrayList();
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        Query query = session.createQuery("FROM ReportActivity WHERE activityId = :id");
        query.setParameter("id", id);
        list = query.list();
        transaction.commit();
        session.close();
        return list;
    }
    
    @Override
    public List<ReportActivitySum> getSumPointBySubjectId(String subject_id) {
        List<ReportActivitySum> list = new ArrayList();
        ReportActivitySum bean = new ReportActivitySum();
        sql.append(" SELECT student_id, SUM(point) AS total FROM webmonitoring.report_activity  ")
                .append(" WHERE subject_id = '" + subject_id + "' GROUP BY student_id  ");
        try {
            dbConnect = ConnectDB.getConnection();
            pre = dbConnect.prepareStatement(sql.toString());
            ResultSet rec = pre.executeQuery();
            boolean rows = rec.next();
            if (rows) {
                do {
                    bean.setStudent_id(rec.getString("student_id"));
                    bean.setTotal(rec.getInt("total"));
                    list.add(bean);
                    bean = new ReportActivitySum();
                } while (rec.next());
            }
            dbConnect.close();
        } catch (Exception e) {
            System.out.println("Exception getSumPointBySubjectId    :    " + e);
        }
        return list;
    }
    
    @Override
    public void updateReportById(int id, String state, int point) {
        Transaction transaction = null;
        Session session = HibernateUtil.getSessionFactory().openSession();
        try{
            transaction = session.beginTransaction();
            Query query = session.createQuery("UPDATE ReportActivity r SET r.state = :state, r.point = :point WHERE r.id = :id");
            query.setParameter("id", id);
            query.setParameter("state", state);
            query.setParameter("point", point);
            int result = query.executeUpdate();
            transaction.commit();
        }catch(RuntimeException e){
            if(transaction != null){
                transaction.rollback();
            }
            System.out.println("RuntimeException updateReportById ====>  "+e);
        }finally{
            session.flush();
            session.close();
        }
    }

    @Override
    public void delReportBySubjectId(String subject_id) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        Query query = session.createQuery("DELETE ReportActivity WHERE subjectId = :subjectId");
        query.setParameter("subjectId", subject_id);
        int result = query.executeUpdate();
        transaction.commit();
        session.close();
    }

    @Override
    public void delReportByActivityId(String activity_id) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        Query query = session.createQuery("DELETE ReportActivity WHERE activityId = :activityId");
        query.setParameter("activityId", Integer.parseInt(activity_id));
        int result = query.executeUpdate();
        transaction.commit();
        session.close();
    }

}
