package Util;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;


import javax.servlet.ServletException;
import javax.servlet.http.*;

public class DatabaseStuff {
   

    /**
     * Get username with the email
     *
     * @param email
     * @return userName
     * @throws SQLException
     */
    public static String getUserName(String email) throws SQLException {
    	try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
    	String sql = "SELECT * FROM finalproject.users where email = ?";
		try(Connection conn = DriverManager.getConnection(Constant.SQLUrl, Constant.SQLuser, Constant.SQLpass);
				PreparedStatement ps = conn.prepareStatement(sql);){
			ps.setString(1, email);
			ResultSet rs = ps.executeQuery();
			rs.next();
			return rs.getString("username");
		} catch (SQLException e) {
			System.out.println ("SQLException: " + e.getMessage());
		} 
        return null;
    }

    /**
     * Get userID with email
     *
     * @param email
     * @return userID
     * @throws SQLException
     */
    public static int getUserID(String email) throws SQLException {
    	try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
    	String sql = "SELECT * FROM finalproject.users where email = ?";
		try(Connection conn = DriverManager.getConnection(Constant.SQLUrl, Constant.SQLuser, Constant.SQLpass);
				PreparedStatement ps = conn.prepareStatement(sql);){
			ps.setString(1, email);
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				return rs.getInt(0);
			}
		} catch (SQLException e) {
			System.out.println ("SQLException: " + e.getMessage());
		}        
		return 0;
    }

    /**
     * check if the email and password matches
     *
     * @param email
     * @param password
     */
    public static boolean checkPassword(String email, String password) throws SQLException {
    	try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
    	String sql = "SELECT * FROM finalproject.users where email = ? AND passkey = ?";
		try(Connection conn = DriverManager.getConnection(Constant.SQLUrl, Constant.SQLuser, Constant.SQLpass);
				PreparedStatement ps = conn.prepareStatement(sql);){
			ps.setString(1, email);
			ps.setString(2, password);
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				return true;
			}
		} catch (SQLException e) {
			System.out.println ("SQLException: " + e.getMessage());
		}        
		return false;
    }

    /**
     * Check if email is already registered
     *
     * @param email
     * @param request
     * @param response
     * @return email registered or not
     * @throws ServletException
     * @throws IOException
     */
    public static boolean emailAlreadyRegistered(String email, HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
    	String sql = "SELECT * FROM finalproject.users where email = ?";
		try(Connection conn = DriverManager.getConnection(Constant.SQLUrl, Constant.SQLuser, Constant.SQLpass);
				PreparedStatement ps = conn.prepareStatement(sql);){
			ps.setString(1, email);
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				return true;
			}
		} catch (SQLException e) {
			System.out.println ("SQLException: " + e.getMessage());
		}        
		return false;
    }
    
    public static boolean insertUser(String email, String username, String password) {
    	try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
    	String sql = "INSERT INTO finalproject.users (email, username, passkey) VALUES (?,?,?)";
		try(Connection conn = DriverManager.getConnection(Constant.SQLUrl, Constant.SQLuser, Constant.SQLpass);
			PreparedStatement ps = conn.prepareStatement(sql);){

			ps.setString(1, email);
			ps.setString(2, username);
			ps.setString(3, password);
			ps.execute();
			return true;
		} catch (SQLException e) {
			System.out.println ("SQLException: " + e.getMessage());
			return false;
		}
    }
    
    public static ArrayList<Item> resultsToList(ResultSet rs) throws SQLException{
    	ArrayList<Item> most_recent = new ArrayList<>();
		while(rs.next()) {
			most_recent.add(new Item(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getDate(5),rs.getInt(6)));
		}
		return most_recent;
    }
    
    /**
     * get most recent items
     *
     *
     */
    public static ArrayList<Item> getRecentItems() throws SQLException {
    	try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
    	String sql = "SELECT * FROM finalproject.items ORDER BY date_created DESC LIMIT 10";
		try(Connection conn = DriverManager.getConnection(Constant.SQLUrl, Constant.SQLuser, Constant.SQLpass);
				PreparedStatement ps = conn.prepareStatement(sql);){
			
			ResultSet rs = ps.executeQuery();
			return resultsToList(rs);
		} catch (SQLException e) {
			System.out.println ("SQLException: " + e.getMessage());
		}        
		return null;
    }
    
    public static ArrayList<Item> nameSearch(String param) throws SQLException {
    	try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
    	String sql = "SELECT * FROM finalproject.items ORDER BY date_created DESC WHERE CONTAINS(name, ?)";
		try(Connection conn = DriverManager.getConnection(Constant.SQLUrl, Constant.SQLuser, Constant.SQLpass);
				PreparedStatement ps = conn.prepareStatement(sql);){
			ps.setString(1, param);
			ResultSet rs = ps.executeQuery();
			return resultsToList(rs);
		} catch (SQLException e) {
			System.out.println ("SQLException: " + e.getMessage());
		}        
		return null;
    }
    
    public static ArrayList<Item> ownerSearch(int param) throws SQLException {
    	try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
    	String sql = "SELECT * FROM finalproject.items ORDER BY date_created DESC WHERE user_id = ?";
		try(Connection conn = DriverManager.getConnection(Constant.SQLUrl, Constant.SQLuser, Constant.SQLpass);
				PreparedStatement ps = conn.prepareStatement(sql);){
			ps.setInt(1, param);
			ResultSet rs = ps.executeQuery();
			return resultsToList(rs);
		} catch (SQLException e) {
			System.out.println ("SQLException: " + e.getMessage());
		}        
		return null;
    }
    
    
    public static ArrayList<Item> descSearch(String param) throws SQLException {
    	try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
    	String sql = "SELECT * FROM finalproject.items ORDER BY date_created DESC WHERE CONTAINS(desc, ?)";
		try(Connection conn = DriverManager.getConnection(Constant.SQLUrl, Constant.SQLuser, Constant.SQLpass);
				PreparedStatement ps = conn.prepareStatement(sql);){
			ps.setString(1, param);
			ResultSet rs = ps.executeQuery();
			return resultsToList(rs);
		} catch (SQLException e) {
			System.out.println ("SQLException: " + e.getMessage());
		}        
		return null;
    }
    
    public static ArrayList<Item> tagSearch(String param) throws SQLException {
    	try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
    	String sql = "SELECT * FROM finalproject.tags WHERE CONTAINS(name, ?)";
    	String tag_ids = "";
    	String item_ids = "";
		try(Connection conn = DriverManager.getConnection(Constant.SQLUrl, Constant.SQLuser, Constant.SQLpass);
				PreparedStatement ps = conn.prepareStatement(sql);){
			ps.setString(1, param);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				tag_ids += rs.getInt(1) +", ";
			}
			tag_ids = tag_ids.substring(0,tag_ids.length()-2);
		} catch (SQLException e) {
			System.out.println ("SQLException: " + e.getMessage());
		}  
		sql = "SELECT * FROM finalproject.bridge where tag_id in (" + tag_ids + ")";
		try(Connection conn = DriverManager.getConnection(Constant.SQLUrl, Constant.SQLuser, Constant.SQLpass);
				PreparedStatement ps = conn.prepareStatement(sql);){
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				item_ids += rs.getInt(2) +", ";
			}
			item_ids = tag_ids.substring(0,tag_ids.length()-2);
		} catch (SQLException e) {
			System.out.println ("SQLException: " + e.getMessage());
		}     
		sql = "SELECT * FROM finalproject.items where item_id in (" + item_ids + ")";
		try(Connection conn = DriverManager.getConnection(Constant.SQLUrl, Constant.SQLuser, Constant.SQLpass);
				PreparedStatement ps = conn.prepareStatement(sql);){
			ResultSet rs = ps.executeQuery();
			return resultsToList(rs);
		} catch (SQLException e) {
			System.out.println ("SQLException: " + e.getMessage());
			return new ArrayList<Item>();
		} 
    }
    
    
    public static boolean insertItem(String name, String image_url, String desc, int user_id) {
    	try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
    	String sql = "INSERT INTO finalproject.items (name, image_url, desc, user_id) VALUES (?,?,?,?)";
		try(Connection conn = DriverManager.getConnection(Constant.SQLUrl, Constant.SQLuser, Constant.SQLpass);
				PreparedStatement ps = conn.prepareStatement(sql);){
			ps.setString(1, name);
			ps.setString(2, image_url);
			ps.setString(3, desc);
			ps.setInt(4, user_id);
			ps.execute();
			return true;
		} catch (SQLException e) {
			System.out.println ("SQLException: " + e.getMessage());
			return false;
		}
    }
    
  
}
