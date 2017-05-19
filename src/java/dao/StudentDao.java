/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import entities.Student;
import java.util.List;

/**
 *
 * @author PEEPO
 */
public interface StudentDao {
    public void addStudent(Student student);
    public List<Student> getAllStudent();
    public List<Student> getStudentById(int id);
    public void updateStudent(Student student);
    public void deleteStudent(Student student);
}
