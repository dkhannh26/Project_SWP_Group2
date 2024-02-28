/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import entity.cart;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Administrator
 */
public class DAOcart extends DBconnect.DBconnect {

    public List<cart> getAll(String username) {
        List<cart> list = new ArrayList<>();
        String sql = "select * from cart where username = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                cart c = new cart(rs.getInt("cart_id"), rs.getString("username"), rs.getInt("product_id"), rs.getInt("quantity"),
                        rs.getInt("price"));
                list.add(c);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public void insertCart( int quantity, int price, String username, int product_id) {
        String sql = "insert into\n"
                + "cart\n"
                + "values(?,?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            
            st.setInt(1, quantity);
            st.setInt(2, price);
            st.setString(3, username);
            st.setInt(4, product_id);                    
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void updateCart( String username, int product_id, int quantity, int price) {
        String sql = "update cart\n"                
                + "set username = ?,\n"
                + "product_id = ?,\n"
                + "quantity = ?,\n"
                + "price = ?\n"
                + "where username = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            st.setInt(2, product_id);
            st.setInt(3, quantity);
            st.setInt(4, price);
            st.setString(5, username);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void deleteCart(int cart_id, String username, int product_id, int quantity, int price) {
        String sql = "delete from cart \n"
                + "where cart_id = ? and username = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, cart_id);
            st.setString(2, username);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public static void main(String[] args) {
        DAOcart cart = new DAOcart();
    }
}
