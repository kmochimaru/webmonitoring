/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import entities.Teacher;
import java.util.List;

/**
 *
 * @author PEEPO
 */
public interface TeacherDao {
    public void addTeacher(Teacher teacher);
    public List<Teacher> getAllTeacher();
    public void deleteTeacher(Teacher teacher);
    public boolean isValidLogin(String username, String password);
    public List<Teacher> getTeacherById(int id);
}
