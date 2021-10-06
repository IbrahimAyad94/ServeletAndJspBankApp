package com.connect;
import java.sql.*;
public class DBConnection {

	public static Connection getConnection(){
		Connection con = null;
		try{
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bank_db","root","root");
		} catch(Exception e){
			System.out.println("Error IN Connection " + e.getMessage());
		}
		return con;
	}
	
	public static void closeConnection(Connection con){
		if (con != null){
			try{
				con.close();
				System.out.println("Connection Closed Succsessfuly");
			} catch(Exception e){
				System.out.println("Error In Close Connection " + e.getMessage());
			}
		} else{
			System.out.println("Not Closed Object Is Null");
		}
	}
	
}
