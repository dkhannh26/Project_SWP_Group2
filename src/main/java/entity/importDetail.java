/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import java.util.Date;

/**
 *
 * @author thinh
 */
public class importDetail {

    private int importDetailID, importID, productID, quantity, price;
    private Date importDate;
    private String username, status;

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getImportDetailID() {
        return importDetailID;
    }

    public void setImportDetailID(int importDetailID) {
        this.importDetailID = importDetailID;
    }

    public int getImportID() {
        return importID;
    }

    public void setImportID(int importID) {
        this.importID = importID;
    }

    public int getProductID() {
        return productID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public Date getImportDate() {
        return importDate;
    }

    public void setImportDate(Date importDate) {
        this.importDate = importDate;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public importDetail(int importDetailID, int importID, int productID, int quantity, Date importDate, String username, String status, int price) {
        this.importDetailID = importDetailID;
        this.importID = importID;
        this.productID = productID;
        this.quantity = quantity;
        this.importDate = importDate;
        this.username = username;
        this.status = status;
        this.price = price;
    }

    public importDetail() {
    }

}
