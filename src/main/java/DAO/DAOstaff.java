/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import entity.customer;
import entity.staff;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author thinh
 */
public class DAOstaff extends DBconnect.DBconnect{
    public List<staff> getAll() {
        List<staff> listAccount = new ArrayList<>();
        String sql = "select * from staff";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                staff a = new staff(rs.getString("username"),
                        rs.getString("email"), rs.getString("password"),rs.getString("address"),rs.getString("phoneNumber"),rs.getString("fullName"));
                listAccount.add(a);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return listAccount;
    }
    
       public boolean checkLogin(String input, String password) {
        String sql = "select * from staff where (username = ? or email = ?) and password = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, input);
            st.setString(2, input);

            st.setString(3, password);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return true;
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return false;
    }
}