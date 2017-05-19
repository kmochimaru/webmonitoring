/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package daoImp;

import connection.ConnectDB;
import dao.ListInClassDao;
import entities.ListInClass;
import entities.Ljoin2S;
import entities.SjoinT;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author PEEPO
 */
public class ListinClassDaoImp implements ListInClassDao{
    static Connection dbConnect = null;
    static PreparedStatement pre = null;
    StringBuilder sql = new StringBuilder();
    
    @Override
    public void addListInClass(ListInClass list) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        session.save(list);
        transaction.commit();
        session.close();
    }

    @Override
    public void deleteListInClass(ListInClass list) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        session.delete(list);
        transaction.commit();
        session.close();
    }

    @Override
    public List<Ljoin2S> getListInClass(String subject_id) {
        List<Ljoin2S> list = new ArrayList();
        Ljoin2S bean = new Ljoin2S();
        sql.append(" SELECT * ")
           .append(" FROM webmonitoring.list_in_class INNER JOIN webmonitoring.student  ")
           .append(" ON webmonitoring.list_in_class.student_id = webmonitoring.student.student_id ")
           .append(" WHERE webmonitoring.list_in_class.subject_id = '"+subject_id+"'");
        try{
            dbConnect = ConnectDB.getConnection();
            pre = dbConnect.prepareStatement(sql.toString());
            ResultSet rec = pre.executeQuery();
            boolean rows = rec.next();
            if(rows){
                do{
                    bean.setId(rec.getInt("id"));
                    bean.setSubjectId(rec.getString("subject_id"));
                    bean.setStudentId(rec.getString("student_id"));
                    bean.setStudentName(rec.getString("name"));
                    bean.setStudentSurname(rec.getString("surname"));
                    bean.setMajor(rec.getString("major"));
                    bean.setLevel(rec.getString("level"));
                    list.add(bean);
                    bean = new Ljoin2S();
                }while(rec.next());
            }
            dbConnect.close();
        }catch(Exception e){
            System.out.println("Exception getListInClass    :    "+e);
        }
        return list;
    }
    
}
