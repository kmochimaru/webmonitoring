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
public class Ljoin2S implements java.io.Serializable{
    private Integer id;
    private String studentId;
    private String subjectId;
    private String studentName;
    private String studentSurname;
    private String subjectName;
    private String level;
    private String major;

    public Ljoin2S() {
    }
   
    
    public void setStudentName(String studentName){
        this.studentName = studentName;
    }
    
    public String getStudentName(){
        return this.studentName;
    }
    
    public void setStudentSurname(String studentSurname){
        this.studentSurname = studentSurname;
    }
    
    public String getStudentSurname(){
        return this.studentSurname;
    }
     
    public String getFullName(){
        return this.studentName +" "+this.studentSurname;
    }
   
    public void setSubjectName(String subjectName){
        this.subjectName = subjectName;
    }
    
    public String getSubjectName(){
        return this.subjectName;
    }
    
    public Integer getId() {
        return this.id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }
    public String getStudentId() {
        return this.studentId;
    }
    
    public void setStudentId(String studentId) {
        this.studentId = studentId;
    }
    public String getSubjectId() {
        return this.subjectId;
    }
    
    public void setSubjectId(String subjectId) {
        this.subjectId = subjectId;
    }
    
    public String getMajor() {
        return this.major;
    }
    
    public void setMajor(String major) {
        this.major = major;
    }
    public String getLevel() {
        return this.level;
    }
    
    public void setLevel(String level) {
        this.level = level;
    }
}
