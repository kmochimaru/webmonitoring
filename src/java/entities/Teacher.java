package entities;
// Generated Jun 17, 2017 2:06:25 AM by Hibernate Tools 4.3.1



/**
 * Teacher generated by hbm2java
 */
public class Teacher  implements java.io.Serializable {


     private int teacherId;
     private String nameTitle;
     private String name;
     private String surname;
     private String username;
     private String password;

    public Teacher() {
    }

	
    public Teacher(int teacherId) {
        this.teacherId = teacherId;
    }
    public Teacher(int teacherId, String nameTitle, String name, String surname, String username, String password) {
       this.teacherId = teacherId;
       this.nameTitle = nameTitle;
       this.name = name;
       this.surname = surname;
       this.username = username;
       this.password = password;
    }
   
    public int getTeacherId() {
        return this.teacherId;
    }
    
    public void setTeacherId(int teacherId) {
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
    public String getUsername() {
        return this.username;
    }
    
    public void setUsername(String username) {
        this.username = username;
    }
    public String getPassword() {
        return this.password;
    }
    
    public void setPassword(String password) {
        this.password = password;
    }




}


