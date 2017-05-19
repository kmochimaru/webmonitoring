/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import entities.ListInClass;
import entities.Ljoin2S;
import java.util.List;

/**
 *
 * @author PEEPO
 */
public interface ListInClassDao {
    public void addListInClass(ListInClass list);
    public void deleteListInClass(ListInClass list);
    public List<Ljoin2S> getListInClass(String subject_id);
}
