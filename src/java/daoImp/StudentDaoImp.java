package daoImp;

import connection.ConnectDB;
import dao.StudentDao;
import static daoImp.ActivityDaoImp.dbConnect;
import static daoImp.ActivityDaoImp.pre;
import entities.Student;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;



/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author PEEPO
 */
public class StudentDaoImp implements StudentDao{

    static Connection dbConnect = null;
    static PreparedStatement pre = null;
    
    @Override
    public void addStudent(Student student) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        session.save(student);
        transaction.commit();
        session.close();
    }

    @Override
    public List<Student> getAllStudent() {
        List<Student> list = new ArrayList();
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        Query query = session.createQuery("FROM Student");
        list = query.list();
        transaction.commit();
        session.close();
        return list;
    }

    @Override
    public List<Student> getStudentById(String id) {
        List<Student> list = new ArrayList();
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        Query query = session.createQuery("FROM Student WHERE studentId = '"+id+"'");
        list = query.list();
        transaction.commit();
        session.close();
        return list;
    }

    @Override
    public void updateStudent(Student student) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        session.update(student);
        transaction.commit();
        session.close();
    }

    @Override
    public void deleteStudent(Student student) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        session.delete(student);
        transaction.commit();
        session.close();
    }

    @Override
    public List<Student> getStudentNotIn(String subject_id) {
        StringBuilder sql = new StringBuilder();
        List<Student> list = new ArrayList();
        Student bean = new Student();
        sql.append(" SELECT * FROM webmonitoring.student where student_id ")
           .append(" not in (select student_id from webmonitoring.list_in_class where subject_id = '"+subject_id+"')  ");
        try{
            dbConnect = ConnectDB.getConnection();
            pre = dbConnect.prepareStatement(sql.toString());
            ResultSet rec = pre.executeQuery();
            boolean rows = rec.next();
            if(rows){
                do{
                    bean.setStudentId(rec.getString("student_id"));
                    bean.setName(rec.getString("name"));
                    bean.setSurname(rec.getString("surname"));
                    bean.setMajor(rec.getString("major"));
                    bean.setLevel(rec.getString("level"));
                    list.add(bean);
                    bean = new Student();
                }while(rec.next());
            }
            dbConnect.close();
        }catch(Exception e){
            System.out.println("Exception getStudentNotIn    :    "+e);
        }
        return list;
    }

    
}
