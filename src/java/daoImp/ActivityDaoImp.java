/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package daoImp;

import connection.ConnectDB;
import dao.ActivityDao;
import entities.Activity;
import entities.AjointS;
import entities.Student;
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
public class ActivityDaoImp implements ActivityDao{

    static Connection dbConnect = null;
    static PreparedStatement pre = null;
    StringBuilder sql = new StringBuilder();
    
    @Override
    public void addActivity(Activity activity) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        session.save(activity);
        transaction.commit();
        session.close();
    }

    @Override
    public List<Activity> getAllActivity() {
        List<Activity> list = new ArrayList();
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        Query query = session.createQuery("FROM Activity");
        list = query.list();
        transaction.commit();
        session.close();
        return list;
    }

    @Override
    public void updateActivity(Activity activity) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        session.update(activity);
        transaction.commit();
        session.close();
    }

    @Override
    public void delActivity(Activity activity) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        session.delete(activity);
        transaction.commit();
        session.close();
    }

    @Override
    public List<AjointS> getAllActivityJoin() {
        List<AjointS> list = new ArrayList();
        AjointS bean = new AjointS();
        sql.append(" SELECT * ")
           .append(" FROM webmonitoring.activity INNER JOIN  webmonitoring.subject ")
           .append(" ON webmonitoring.activity.subject_id = webmonitoring.subject.subject_id ");
        try{
            dbConnect = ConnectDB.getConnection();
            pre = dbConnect.prepareStatement(sql.toString());
            ResultSet rec = pre.executeQuery();
            boolean rows = rec.next();
            if(rows){
                do{
                    bean.setId(rec.getInt("id"));
                    bean.setActivityName(rec.getString("activity_name"));
                    bean.setDescription(rec.getString("description"));
                    bean.setPoint(Integer.parseInt(rec.getString("point")));
                    bean.setSubjectId(rec.getString("subject_id"));
                    bean.setSubjectName(rec.getString("subject_name"));
                    list.add(bean);
                    bean = new AjointS();
                }while(rec.next());
            }
            dbConnect.close();
        }catch(Exception e){
            System.out.println("Exception getAllActivityJoin    :    "+e);
        }
        return list;
    }
    
}
