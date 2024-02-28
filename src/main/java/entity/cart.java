/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author Administrator
 */
public class cart {
    int cart_id;
    String username;
    int product_id;
    int quantity;
    int price;

    public cart(int cart_id, String username, int product_id, int quantity, int price) {
        this.cart_id = cart_id;
        this.username = username;
        this.product_id = product_id;
        this.quantity = quantity;
        this.price = price;
    }

    public int getCartID() {
        return cart_id;
    }

    public void setCartID(int cart_id) {
        this.cart_id = cart_id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public int getProductID() {
        return product_id;
    }

    public void setProductID(int product_id) {
        this.product_id = product_id;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    @Override
    public String toString() {
        return "cart{" + "cart_id=" + cart_id + ", username=" + username + ", product_id=" + product_id + ", quantity=" + quantity + ", price=" + price + '}';
    }
    
}
