/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import entities.ReportAttendance;
import entities.ReportAttendanceCount;
import java.util.List;

/**
 *
 * @author PEEPO
 */
public interface ReportAttendanceDao {
    public void addReport(ReportAttendance report);
    public List<String> getReportBySubject(String subject_id);
    public List<ReportAttendance> getReportByDate(String date, String subject_id);
    public List<ReportAttendanceCount> getCount(String subject_id, String student_id);
}
