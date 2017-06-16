/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import entities.ReportActivity;
import entities.ReportActivitySum;
import java.util.List;

/**
 *
 * @author PEEPO
 */
public interface ReportActivityDao {
    public void addReport(ReportActivity report);
    public void updateReportById(int id, String state, int point);
    public List<ReportActivity> getAllReport();
    public List<ReportActivitySum> getSumPointBySubjectId(String subject_id);
    public List<ReportActivity> getReportByActivityId(int id);
    public List<ReportActivity> getReportBySubjectId(String subject_id);
    public void delReportByActivityId(String activity_id);
    public void delReportBySubjectId(String subject_id);
}
