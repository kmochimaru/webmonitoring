/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import entities.Major;
import java.util.List;

/**
 *
 * @author PEEPO
 */
public interface MajorDao {
    public void addMajor(Major major);
    public List<Major> getAllMajor();
    public void updateMajor(Major major);
    public void delMajor(Major major);
}
