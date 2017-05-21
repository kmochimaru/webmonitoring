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
public class ReportAttendanceCount {
    private String studentId;
    private String subjectId;
    private int attend;
    private int absent;
    private int late;
    private int sl;
    private int pbl;

    public ReportAttendanceCount() {
    }

    public String getStudentId() {
        return studentId;
    }

    public void setStudentId(String studentId) {
        this.studentId = studentId;
    }

    public String getSubjectId() {
        return subjectId;
    }

    public void setSubjectId(String subjectId) {
        this.subjectId = subjectId;
    }

    public int getAttend() {
        return attend;
    }

    public void setAttend(int attend) {
        this.attend = attend;
    }

    public int getAbsent() {
        return absent;
    }

    public void setAbsent(int absent) {
        this.absent = absent;
    }

    public int getLate() {
        return late;
    }

    public void setLate(int late) {
        this.late = late;
    }

    public int getSl() {
        return sl;
    }

    public void setSl(int sl) {
        this.sl = sl;
    }

    public int getPbl() {
        return pbl;
    }

    public void setPbl(int pbl) {
        this.pbl = pbl;
    }
    
    
}
