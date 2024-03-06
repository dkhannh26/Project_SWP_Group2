
/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import entity.product;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author LENOVO
 */
public class DAOproduct extends DBconnect.DBconnect {
//int id, int quantity, int price, int categoryID, int promoID, String name, String description, String picURL

    public List<product> getAll() {
        List<product> list = new ArrayList<>();
        String sql = "select * from product";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                product p = new product(rs.getInt("product_id"), rs.getInt("quantity"), rs.getInt("price"), rs.getInt("category_id"), rs.getInt("promo_id"), rs.getString("name"),
                        rs.getString("description"), rs.getString("pic_url"));
                list.add(p);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public product getProductById(String id) {

        String sql = "select * from product where product_id=?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                product p = new product(rs.getInt("product_id"), rs.getInt("quantity"), rs.getInt("price"), rs.getInt("category_id"), rs.getInt("promo_id"), rs.getString("name"),
                        rs.getString("description"), rs.getString("pic_url"));
                return p;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public void update(product p) {
        String sql = "UPDATE [dbo].[product]\n"
                + "   SET [name] = ?\n"
                + "      ,[quantity] = ?\n"
                + "      ,[description] = ?\n"
                + "      ,[pic_url] =?\n"
                + "      ,[price] = ?\n"
                + "      ,[category_id] = ?\n"
                + "      ,[promo_id] = ?\n"
                + " WHERE [product_id] = ?\n"
                + ""
                + "";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, p.getName());
            st.setInt(2, p.getQuantity());
            st.setString(3, p.getDescription());
            st.setString(4, p.getPicURL());
            st.setInt(5, p.getPrice());
            st.setInt(6, p.getCategoryID());
            st.setInt(7, p.getPromoID());
            st.setInt(8, p.getId());
            st.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void delete(String id) {
        String sql = "delete from cart where product_id = ?\n"
                + "delete from product where product_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, id);
            st.setString(2, id);
            st.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public void insert(product p) {
        String sql = "INSERT INTO [dbo].[product]\n"
                + "           ([name]\n"
                + "           ,[quantity]\n"
                + "           ,[description]\n"
                + "           ,[pic_url]\n"
                + "           ,[price]\n"
                + "           ,[category_id]\n"
                + "           ,[promo_id])\n"
                + "     VALUES\n"
                + "           (?,?,?,?,?,?,?)";

        try {

            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, p.getName());
            st.setInt(2, p.getQuantity());
            st.setString(3, p.getDescription());
            st.setString(4, p.getPicURL());
            st.setInt(5, p.getPrice());
            st.setInt(6, p.getCategoryID());
            st.setInt(7, p.getPromoID());
            st.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }

    }

    public List<product> search(String name) {
        List<product> list = new ArrayList<>();
        String sql = "select * from product \n"
                + "where name like ? ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, name);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                product p = new product(rs.getInt("product_id"), rs.getInt("quantity"), rs.getInt("price"), rs.getInt("category_id"), rs.getInt("promo_id"), rs.getString("name"),
                        rs.getString("description"), rs.getString("pic_url"));
                list.add(p);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public List<product> getFemaleProduct() {
        DAOcategory DAOcategory = new DAOcategory();
        String listId = DAOcategory.getIdGender("female");

        List<product> list = new ArrayList<>();
        String sql = "select * from product where category_id in " + listId;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                product p = new product(rs.getInt("product_id"), rs.getInt("quantity"), rs.getInt("price"), rs.getInt("category_id"), rs.getInt("promo_id"), rs.getString("name"),
                        rs.getString("description"), rs.getString("pic_url"));
                list.add(p);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public List<product> getMaleProduct() {
        DAOcategory DAOcategory = new DAOcategory();
        String listId = DAOcategory.getIdGender("male");

        List<product> list = new ArrayList<>();
        String sql = "select * from product where category_id in " + listId;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                product p = new product(rs.getInt("product_id"), rs.getInt("quantity"), rs.getInt("price"), rs.getInt("category_id"), rs.getInt("promo_id"), rs.getString("name"),
                        rs.getString("description"), rs.getString("pic_url"));
                list.add(p);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public List<product> getFemaleProductByType(String type) {
        DAOcategory DAOcategory = new DAOcategory();
        int id = DAOcategory.getIdType(type,"female");

        List<product> list = new ArrayList<>();
        String sql = "select * from product\n"
                + "where category_id = " + id;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                product p = new product(rs.getInt("product_id"), rs.getInt("quantity"), rs.getInt("price"), rs.getInt("category_id"), rs.getInt("promo_id"), rs.getString("name"),
                        rs.getString("description"), rs.getString("pic_url"));
                list.add(p);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public List<product> getMaleProductByType(String type) {
        DAOcategory DAOcategory = new DAOcategory();
        int id = DAOcategory.getIdType(type, "male");

        List<product> list = new ArrayList<>();
        String sql = "select * from product\n"
                + "where category_id = " + id;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                product p = new product(rs.getInt("product_id"), rs.getInt("quantity"), rs.getInt("price"), rs.getInt("category_id"), rs.getInt("promo_id"), rs.getString("name"),
                        rs.getString("description"), rs.getString("pic_url"));
                list.add(p);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

//    public static void main(String[] args) {
//        DAOproduct dao = new DAOproduct();
//        
//        System.out.println(dao.getFemaleProductByType("dress"));
//    }
}
