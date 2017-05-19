package controller;


import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author PEEPO
 */
public class DateTime {
    DateFormat df = new SimpleDateFormat("dd/MM/yy HH:mm:ss");
    DateFormat date = new SimpleDateFormat("dd/MM/yy");
    DateFormat time = new SimpleDateFormat("HH:mm:ss");
    Calendar calobj = Calendar.getInstance();
    
    public String getDate(){
        return date.format(calobj.getTime());
    }
    public String getTime(){
        return time.format(calobj.getTime());
    }
    public String getDateTime(){
        return df.format(calobj.getTime());
    }
}
