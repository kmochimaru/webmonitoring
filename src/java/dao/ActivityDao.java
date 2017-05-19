/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import entities.Activity;
import entities.AjointS;
import java.util.List;

/**
 *
 * @author PEEPO
 */
public interface ActivityDao {
    public void addActivity(Activity activity);
    public List<Activity> getAllActivity();
    public List<AjointS> getAllActivityJoin();
    public void updateActivity(Activity activity);
    public void delActivity(Activity activity);
}
