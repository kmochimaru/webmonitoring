/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author kenji
 */
public class ConnectDB {
    static Connection con;
    static String url;

	public static Connection getConnection() {
		try {
			String url = "jdbc:mysql://localhost/webmonitoring?useUnicode=true&characterEncoding=UTF-8";
			Class.forName("com.mysql.jdbc.Driver");
			try {
				con = DriverManager.getConnection(url, "root", "1234"); 
			} catch (SQLException ex) {
				ex.printStackTrace();
			}
		} catch (ClassNotFoundException e) {
			System.out.println(e);
		}
		return con;
	}
}
