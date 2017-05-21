/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package daoImp;

import connection.ConnectDB;
import dao.ReportAttendanceDao;
import static daoImp.ListinClassDaoImp.dbConnect;
import entities.Ljoin2S;
import entities.ReportAttendance;
import entities.ReportAttendanceCount;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author PEEPO
 */
public class ReportAttendaceDaoImp implements ReportAttendanceDao{

    static Connection dbConnect = null;
    static PreparedStatement pre = null;
    StringBuilder sql = new StringBuilder();
    
    @Override
    public void addReport(ReportAttendance report) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        session.save(report);
        transaction.commit();
        session.close();
    }

    @Override
    public List<String> getReportBySubject(String subject_id) {
        Transaction transaction = null;
        Session session = HibernateUtil.getSessionFactory().openSession();
        List<String> list = new ArrayList<String>();
        try{
            transaction = session.beginTransaction();
            Query query = session.createQuery("SELECT DISTINCT date FROM ReportAttendance WHERE subjectId = :subject_id");
            query.setParameter("subject_id", subject_id);
            list = query.list();
            transaction.commit();
        }catch(RuntimeException e){
            if(transaction != null){
                transaction.rollback();
            }
            System.out.println("RuntimeException getReportBySubject ====>  "+e);
        }finally{
            session.flush();
            session.close();
        }
        
        return list;
    }

    @Override
    public List<ReportAttendance> getReportByDate(String date, String subject_id) {
        Transaction transaction = null;
        Session session = HibernateUtil.getSessionFactory().openSession();
        List<ReportAttendance> list = new ArrayList<ReportAttendance>();
        try{
            transaction = session.beginTransaction();
            Query query = session.createQuery("FROM ReportAttendance WHERE date = :date AND subjectId = :subject_id");
            query.setParameter("date", date);
            query.setParameter("subject_id", subject_id);
            list = query.list();
            transaction.commit();
        }catch(RuntimeException e){
            if(transaction != null){
                transaction.rollback();
            }
            System.out.println("RuntimeException getReportByDate ====>  "+e);
        }finally{
            session.flush();
            session.close();
        }
        return list;
    }

    @Override
    public List<ReportAttendanceCount> getCount(String subject_id, String student_id) {
        List<ReportAttendanceCount> list = new ArrayList();
        /*StringBuilder hql = new StringBuilder();
        hql.append(" SELECT r.studentId, r.subjectId, ")
                .append(" COUNT(CASE WHEN r.state='attend' THEN 1 ELSE NULL END) AS attend, ")
                .append(" COUNT(CASE WHEN r.state='absent' THEN 1 ELSE NULL END) AS absent, ")
                .append(" COUNT(CASE WHEN r.state='late' THEN 1 ELSE NULL END) AS late, ")
                .append(" COUNT(CASE WHEN r.state='sl' THEN 1 ELSE NULL END) AS sl, ")
                .append(" COUNT(CASE WHEN r.state='pbl' THEN 1 ELSE NULL END) AS pbl ")
                .append(" FROM ReportAttendance r WHERE r.studentId = :student_id AND r.subjectId = :subject_id");*/
        

        ReportAttendanceCount bean = new ReportAttendanceCount();
        sql.append(" SELECT student_id, subject_id, ")
           .append(" COUNT(IF(state = 'attend', 1, null)) 'attend' ,  ")
           .append(" COUNT(IF(state = 'absent', 1, null)) 'absent' , ")
           .append(" COUNT(IF(state = 'late', 1, null)) 'late' ," )
                .append(" COUNT(IF(state = 'sl', 1, null)) 'sl' ,")
                .append(" COUNT(IF(state = 'pbl', 1, null)) 'pbl'  ")
                .append(" FROM webmonitoring.report_attendance  ")
                .append(" WHERE subject_id='"+subject_id+"' and student_id = '"+student_id+"' ");
        try{
            dbConnect = ConnectDB.getConnection();
            pre = dbConnect.prepareStatement(sql.toString());
            ResultSet rec = pre.executeQuery();
            boolean rows = rec.next();
            if(rows){
                do{
                    bean.setStudentId(rec.getString("student_id"));
                    bean.setSubjectId(rec.getString("subject_id"));
                    bean.setAttend(rec.getInt("attend"));
                    bean.setAbsent(rec.getInt("absent"));
                    bean.setLate(rec.getInt("late"));
                    bean.setSl(rec.getInt("sl"));
                    bean.setPbl(rec.getInt("pbl"));
                    list.add(bean);
                    bean = new ReportAttendanceCount();
                }while(rec.next());
            }
            dbConnect.close();
        }catch(Exception e){
            System.out.println("Exception getCount    :    "+e);
        }
        return list;
    }

    
    
}
