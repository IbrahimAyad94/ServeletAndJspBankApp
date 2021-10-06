package utils;

import com.beans.Register;
import com.connect.DBConnection;
import com.sun.org.apache.regexp.internal.recompile;

import javafx.scene.media.MediaPlayer.Status;
import jdk.nashorn.internal.codegen.DumpBytecode;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
public class UtilDB {

	public static String validUser(Register u){
		Connection con = null;
		String page = "error.jsp";
		String sql = "select * from record where username = '" + u.getUserName() + "' and password = '" + u.getPassword() + "' ;";
		try{
			con  =  DBConnection.getConnection();
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			if (rs.next()){
				return "home";
			} else {
				return "index";
			}
			
		} catch(Exception e){
			System.out.println("Error In Valid " + e.getMessage());
			return "errorpage";
		} finally{
			DBConnection.closeConnection(con);
		}
		
	}
	public static boolean isUer(String name){
		String sql = "select * from record where username = ?;"; 
		Connection con = null;
		boolean user;
		try{
			con = DBConnection.getConnection();
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, name);
			ResultSet rs = ps.executeQuery();
			if (rs.next()){
				user = true;
			} else {
				user = false;
			}
		} catch(Exception e){
			System.out.println("Error In IsUser " + e.getMessage());
			user = false;
		} finally{
			DBConnection.closeConnection(con);
		}
		return user;
	}
	
	public static int  updateAccount(String name, int value, char a){
		Connection con = null;
		int status = 0;
		String sql = "update record set amount = amount " +  a  + value+ " where username = '" + name + "';";
		System.out.println();
		try{
			con = DBConnection.getConnection();
			Statement stmt = con.createStatement();
			status = stmt.executeUpdate(sql);
			System.out.println("Upadte Goooooooooooooooooooooood");
		} catch(Exception e){
			System.out.println("Error In Update Account " + e.getMessage());
		} finally{
			DBConnection.closeConnection(con);
		}
		return status;
	}
	
	public static int getRow(String name){
		//ResultSet rss = null;
		int v = 0;
		Connection con = null;
		String sql = "select * from  record where username = '" + name + "';";
		try{
			con = DBConnection.getConnection();
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			if (rs.next()){
				v = rs.getInt(3);
			}
		} catch(Exception e){
			System.out.println("Error In Get Row " + e.getMessage());
		} finally {
			DBConnection.closeConnection(con);
		}
		
		return v;
	}
	public static Register getInfo(String name){
		Connection con = null;
		Register u = new Register();
		String sql = "select * from  record where username = '" + name + "';";
		try{
			con = DBConnection.getConnection();
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			if (rs.next()){
				u.setUserName(rs.getString(1));
				u.setPassword(rs.getString(2));
				u.setAmount(rs.getInt(3));
				u.setAddress(rs.getString(4));
				u.setPhone(rs.getString(5));
			}
		} catch(Exception e){
			System.out.println("Error In Get Row " + e.getMessage());
		} finally {
			DBConnection.closeConnection(con);
		}
		return u;
	}
	
	public static String addUser(Register u){
		String status = "";
		if (isUer(u.getUserName())){
			status = "found";
		} else{
		Connection con = null;
		String sql = "insert into record (username, password, amount, address, phone)values(?, ?, ?, ?, ?);";
		try{
			con = DBConnection.getConnection();
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, u.getUserName());
			ps.setString(2, u.getPassword());
			ps.setInt(3, u.getAmount());
			ps.setString(4, u.getAddress());
			ps.setString(5, u.getPhone());
			int x = ps.executeUpdate();
			if (x > 0){
				status = "added";
			} else{
				status = "notAdded";
			}
			
		} catch(Exception e){
			System.out.println("Error In AddUser " + e.getMessage());
			status = "notAdded";
		} finally{
			DBConnection.closeConnection(con);
		}
		}
		return status;
	}
	public static String deleteUser(String name){
		String status = null;
		Connection con = null;
		String sql = "delete from record where username = ?;";
		if (!isUer(name)){
			return "notfound";
		} else{
			try{
			con = DBConnection.getConnection();
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, name);
			int x = ps.executeUpdate();
			if (x > 0){
				status = "delete";
			} else {
				status = "nodelete";
			}
			} catch(Exception e){
				status = "nodelete";
				System.out.println("Error In Delete " + e.getMessage());
			} finally{
				DBConnection.closeConnection(con);
			}
			
		}
		return status;
	}
	public static ArrayList<Register> getAll(){
		Register u = null;
		String sql = "select * from record";
		Connection con = null;
		ArrayList<Register> users = new ArrayList<Register>();
		try{
			con = DBConnection.getConnection();
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			while (rs.next()){
				u = new Register();
				u.setUserName(rs.getString(1));
				u.setPassword(rs.getString(2));
				u.setAmount(rs.getInt(3));
				u.setAddress(rs.getString(4));
				u.setPhone(rs.getString(5));
				users.add(u);
			}
		} catch(Exception e){
			System.out.println("Error In GetAll " + e.getMessage());
		} finally{
			DBConnection.closeConnection(con);
		}
		return users;
	}
	public static boolean havePhoto(String name){
		boolean status = false;
		Connection con = null;
		try{
			con = DBConnection.getConnection();
			PreparedStatement ps = con.prepareStatement("select photo from record where photo is null and username = ?;");
			ps.setString(1, name);
			ResultSet rs = ps.executeQuery(); 
			System.out.println("No Error Here ");
			if (!rs.next()){
				status = true;
				System.out.println("output" + status);
			}
		} catch(Exception e){
			System.out.println("Error In HavePhoto" + e.getMessage());
		}
		return status;
	}
}
