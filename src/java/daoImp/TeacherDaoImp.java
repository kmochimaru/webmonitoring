package daoImp;

import dao.TeacherDao;
import entities.Teacher;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;


public class TeacherDaoImp implements TeacherDao{

    @Override
    public void addTeacher(Teacher teacher) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        session.save(teacher);
        transaction.commit();
        session.close();
    }

    @Override
    public void deleteTeacher(Teacher teacher) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        session.delete(teacher);
        transaction.commit();
        session.close();
    }

    @Override
    public boolean isValidLogin(String username, String password) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        String sql = "FROM Teacher t WHERE t.teacherId= :username AND t.password = :password";
        Query query = session.createQuery(sql);
        query.setParameter("username", Integer.parseInt(username));
        query.setParameter("password", password);
        List<Teacher> list = query.list();
        if(list.size() > 0){
            transaction.commit();
            session.close();
            return true;
        }
        transaction.commit();
        session.close();
        return false;
    }

    @Override
    public List<Teacher> getAllTeacher() {
        List<Teacher> list = new ArrayList();
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        Query query = session.createQuery("FROM Teacher");
        list = query.list();
        transaction.commit();
        session.close();
        return list;
    }


    @Override
    public List<Teacher> getTeacherById(int id) {
        List<Teacher> list = new ArrayList();
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        Query query = session.createQuery("FROM Teacher t WHERE t.teacherId = :id");
        query.setParameter("id", id);
        list = query.list();
        transaction.commit();
        session.close();
        return list;
    }
    
    
}
