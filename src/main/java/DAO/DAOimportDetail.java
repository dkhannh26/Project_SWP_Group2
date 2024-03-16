/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import entity.importDetail;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author thinh
 */
public class DAOimportDetail extends DBconnect.DBconnect {

    public List<importDetail> getAllImportDetail() {
        List<importDetail> list = new ArrayList<>();
        String sql = "SELECT import_detail_id, import.import_id, importDetails.product_id, importDate, importDetails.quantity, username, status,price *importDetails.quantity as \"price\"\n"
                + "FROM     import INNER JOIN\n"
                + "                  importDetails ON import.import_id = importDetails.import_id INNER JOIN\n"
                + "                  product ON importDetails.product_id = product.product_id";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                importDetail o = new importDetail(rs.getInt("import_detail_id"), rs.getInt("import_id"), rs.getInt("product_id"), rs.getInt("quantity"), rs.getDate("importDate"), rs.getString("username"), rs.getString("status"), rs.getInt("price"));
                list.add(o);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public int getQuantityByImportID(String id) {
        int quantity = 0;

        String sql = "SELECT SUM(importDetails.quantity) as \"quantity\"\n"
                + "                FROM     import INNER JOIN\n"
                + "                                 importDetails ON import.import_id = importDetails.import_id INNER JOIN\n"
                + "                                product ON importDetails.product_id = product.product_id\n"
                + "								where import.import_id  = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                quantity = rs.getInt("quantity");
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return quantity;
    }

    public int getPriceByImportID(String id) {
        int price = 0;

        String sql = "			SELECT SUM(price *importDetails.quantity) as \"price\"\n"
                + "FROM     import INNER JOIN\n"
                + "                  importDetails ON import.import_id = importDetails.import_id INNER JOIN\n"
                + "                  product ON importDetails.product_id = product.product_id\n"
                + "where import.import_id = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                price = rs.getInt("price");
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return price;
    }

}
