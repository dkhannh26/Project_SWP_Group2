/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import entity.orders;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 *
 * @author Administrator
 */
public class DAOorder extends DBconnect.DBconnect {

    public List<orders> getAll() {
        List<orders> list = new ArrayList<>();
        String sql = "select * from orders";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                orders o = new orders(rs.getInt("order_id"), rs.getString("address"), rs.getDate("date"), rs.getString("date"),
                        rs.getString("phone_number"), rs.getString("usernameCustomer"), rs.getString("usernameStaff"));
                list.add(o);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public void insertOrder(String address, Date date, String status, String phoneNumber, String usernameCustomer, String usernameStaff) {
        String sql = "insert into\n"
                + "orders\n"
                + "values(?,?,?,?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, address);
            st.setDate(2, new java.sql.Date(date.getTime()));
            st.setString(3, status);
            st.setString(4, phoneNumber);
            st.setString(5, usernameCustomer);
            st.setString(6, usernameStaff);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void insertOrderDetail(int quantity, int productID, int orderID) {
        String sql = "insert into\n"
                + "order_detail\n"
                + "values(?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, quantity);
            st.setInt(2, productID);
            st.setInt(3, orderID);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public int getOrderId() {
        int order_id = 0;
        String sql = "SELECT MAX(order_id) as order_id\n"
                + "FROM orders;";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                order_id = rs.getInt("order_id");
                return order_id;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return order_id;
    }
}
