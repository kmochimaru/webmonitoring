/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entities;

/**
 *
 * @author PEEPO
 */
public class SjoinT implements java.io.Serializable {
     private String subjectId;
     private String subjectName;
     private String teacherId;
     
     private String nameTitle;
     private String name;
     private String surname;
     private String password;
     
     public String getTeacherId() {
        return this.teacherId;
    }
    
    public void setTeacherId(String teacherId) {
        this.teacherId = teacherId;
    }
    public String getNameTitle() {
        return this.nameTitle;
    }
    
    public void setNameTitle(String nameTitle) {
        this.nameTitle = nameTitle;
    }
    public String getName() {
        return this.name;
    }
    
    public void setName(String name) {
        this.name = name;
    }
    public String getSurname() {
        return this.surname;
    }
    
    public void setSurname(String surname) {
        this.surname = surname;
    }
    public String getPassword() {
        return this.password;
    }
    
    public void setPassword(String password) {
        this.password = password;
    }
    
    public String getSubjectId() {
        return this.subjectId;
    }
    
    public void setSubjectId(String subjectId) {
        this.subjectId = subjectId;
    }
    public String getSubjectName() {
        return this.subjectName;
    }
    
    public void setSubjectName(String subjectName) {
        this.subjectName = subjectName;
    }
    
    public String getFullName(){
        return this.nameTitle+" "+this.name+" "+this.surname;
    }
    
}
