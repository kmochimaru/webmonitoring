/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import entities.Subject;
import java.util.List;

/**
 *
 * @author PEEPO
 */
public interface SubjectDao {
    public void addSubject(Subject subject);
    public List<Subject> getAllSubject();
    public List<Subject> getSubjectById(int id);
    public void updateSubject(Subject subject);
    public void deleteSubject(Subject subject);
}
