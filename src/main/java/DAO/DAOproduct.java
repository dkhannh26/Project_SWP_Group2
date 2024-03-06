
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
    
    
    public List<product> get8RandomProduct() {
        List<product> list = new ArrayList<>();
        String sql = "select top 8* from product order by newid()";
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


    public List<product> sortIncrease() {
        List<product> list = new ArrayList<>();
        String sql = "SELECT * FROM product\n"
                + "ORDER BY price";
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

    public List<product> sortDecrease() {
        List<product> list = new ArrayList<>();
        String sql = "SELECT * FROM product\n"
                + "ORDER BY price DESC";
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

    public List<product> sortBestSeller() {
        List<product> list = new ArrayList<>();
        String sql = "SELECT p.*\n"
                + "FROM product p\n"
                + "JOIN (\n"
                + "    SELECT product_id, SUM(quantity) AS total_quantity\n"
                + "    FROM order_detail\n"
                + "    GROUP BY product_id\n"
                + ") AS product_sales ON p.product_id = product_sales.product_id\n"
                + "ORDER BY product_sales.total_quantity DESC;";
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

    public List<product> sortNew() {
        List<product> list = new ArrayList<>();
        String sql = "select * from product ORDER BY product_id DESC";
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

    public int getNumberOfOrder() {
        int number = 0;
        String sql = "SELECT COUNT(*) AS total FROM orders";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                number = rs.getInt("total");

            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return number;
    }

    public int getNumberOfOrderByDate(String from, String to) {
        int number = 0;
        String sql = "SELECT COUNT(*) AS total FROM orders\n"
                + "WHERE date >= ? AND date <= ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, from);
            st.setString(2, to);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                number = rs.getInt("total");

            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return number;
    }

    public int getNumberOfProductByDate(String from, String to) {
        int number = 0;
        String sql = "SELECT sum(order_detail.quantity) as total\n"
                + "FROM   order_detail INNER JOIN\n"
                + "             orders ON order_detail.order_id = orders.order_id\n"
                + "			 Where date >= ? AND date <= ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, from);
            st.setString(2, to);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                number = rs.getInt("total");
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return number;
    }

    public int getNumberOfProduct() {
        int number = 0;
        String sql = "select sum(quantity) as total from order_detail";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                number = rs.getInt("total");

            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return number;
    }

    public int getRevenue() {
        int number = 0;
        String sql = "SELECT sum(order_detail.quantity * product.price) AS total\n"
                + "FROM   order_detail INNER JOIN\n"
                + "             product ON order_detail.product_id = product.product_id";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                number = rs.getInt("total");

            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return number;
    }

    public int getRevenueByDate(String from, String to) {
        int number = 0;
        String sql = "SELECT sum(order_detail.quantity * product.price) AS total\n"
                + "FROM   order_detail INNER JOIN\n"
                + "             product ON order_detail.product_id = product.product_id INNER JOIN\n"
                + "             orders ON order_detail.order_id = orders.order_id\n"
                + "			  Where date >= ? AND date <= ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, from);
            st.setString(2, to);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                number = rs.getInt("total");

            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return number;
    }

    public int getNumberOfCustomer() {
        int number = 0;
        String sql = "select count(DISTINCT  usernameCustomer) as total from orders";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                number = rs.getInt("total");

            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return number;
    }

    public int getNumberOfCustomerByDate(String from, String to) {
        int number = 0;
        String sql = "select count(DISTINCT  usernameCustomer) as total \n"
                + "from orders\n"
                + "Where date >= ? AND date <= ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, from);
            st.setString(2, to);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                number = rs.getInt("total");

            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return number;
    }

//
//    public List<product> getTop() {
//        List<product> list = new ArrayList<>();
//        String sql = "select * from product where type=0";
//        try {
//            PreparedStatement st = connection.prepareStatement(sql);
//            ResultSet rs = st.executeQuery();
//            while (rs.next()) {
//                product p = new product(rs.getInt("type"), rs.getInt("pro_quan"), rs.getInt("pro_id"), rs.getString("pro_name"),
//                        rs.getInt("pro_sale"), rs.getInt("pro_price"), rs.getString("pro_pic"), rs.getString("pro_des"));
//                list.add(p);
//            }
//        } catch (Exception e) {
//            System.out.println(e);
//        }
//        return list;
//    }
//    public List<product> getBottom() {
//        List<product> list = new ArrayList<>();
//        String sql = "select * from product where type=1";
//        try {
//            PreparedStatement st = connection.prepareStatement(sql);
//            ResultSet rs = st.executeQuery();
//            while (rs.next()) {
//                product p = new product(rs.getInt("type"), rs.getInt("pro_quan"), rs.getInt("pro_id"), rs.getString("pro_name"),
//                        rs.getInt("pro_sale"), rs.getInt("pro_price"), rs.getString("pro_pic"), rs.getString("pro_des"));
//                list.add(p);
//            }
//        } catch (Exception e) {
//            System.out.println(e);
//        }
//        return list;
//    }
//
//    public void insert(product p) {
//        String sql = "INSERT INTO [dbo].[product]\n"
//                + "           ([type]\n"
//                + "           ,[pro_quan]\n"
//                + "           ,[pro_id]\n"
//                + "           ,[pro_name]\n"
//                + "           ,[pro_sale]\n"
//                + "           ,[pro_price]\n"
//                + "           ,[pro_pic]\n"
//                + "           ,[pro_des])\n"
//                + "     VALUES\n"
//                + "           (?,?,?,?,?,?,?,?)";
//
//        try {
//
//            PreparedStatement st = connection.prepareStatement(sql);
//            st.setInt(1, p.getType());
//            st.setInt(2, p.getPro_quan());
//            st.setInt(3, p.getPro_id());
//            st.setString(4, p.getPro_name());
//            st.setInt(5, p.getPro_sale());
//            st.setInt(6, p.getPro_price());
//            st.setString(7, p.getPro_pic());
//            st.setString(8, p.getPro_des());
//            st.executeUpdate();
//        } catch (Exception e) {
//            System.out.println(e);
//        }
//
//    }
//
//
//
//
//    public void updateQuan(int quan, int id) {
//        String sql = "update product\n"
//                + "set pro_quan = ?\n"
//                + "where pro_id = ?";
//        try {
//            PreparedStatement ps = connection.prepareStatement(sql);
//            ps.setInt(1, quan);
//            ps.setInt(2, id);
//            ps.executeUpdate();
//        } catch (Exception e) {
//        }
//    }
//
//    public product getProductById(String id) {
//
//        String sql = "select * from product where pro_id=?";
//
//        try {
//            PreparedStatement st = connection.prepareStatement(sql);
//            st.setString(1, id);
//            ResultSet rs = st.executeQuery();
//            if (rs.next()) {
//                product p = new product(rs.getInt("type"), rs.getInt("pro_quan"), rs.getInt("pro_id"), rs.getString("pro_name"),
//                        rs.getInt("pro_sale"), rs.getInt("pro_price"), rs.getString("pro_pic"), rs.getString("pro_des"));
//                return p;
//            }
//        } catch (SQLException e) {
//            System.out.println(e);
//        }
//        return null;
//    }

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
