package com.example.ebooksystemproject.entity;

public class BookOrderViewAdmin {
    private int orderId;

    private String customerName;

    private String customerEmail;

    private String orderAddress;

    private String phoneNumber;

    private String bookName;

    private String authorName;

    private String price;

    private String paymentType;

    public BookOrderViewAdmin() {
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public String getCustomerEmail() {
        return customerEmail;
    }

    public void setCustomerEmail(String customerEmail) {
        this.customerEmail = customerEmail;
    }

    public String getOrderAddress() {
        return orderAddress;
    }

    public void setOrderAddress(String orderAddress) {
        this.orderAddress = orderAddress;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getBookName() {
        return bookName;
    }

    public void setBookName(String bookName) {
        this.bookName = bookName;
    }

    public String getAuthorName() {
        return authorName;
    }

    public void setAuthorName(String authorName) {
        this.authorName = authorName;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public String getPaymentType() {
        return paymentType;
    }

    @Override
    public String toString() {
        return "BookOrderViewAdmin{" +
                "orderId=" + orderId +
                ", customerName='" + customerName + '\'' +
                ", customerEmail='" + customerEmail + '\'' +
                ", orderAddress='" + orderAddress + '\'' +
                ", phoneNumber='" + phoneNumber + '\'' +
                ", bookName='" + bookName + '\'' +
                ", authorName='" + authorName + '\'' +
                ", price='" + price + '\'' +
                ", paymentType='" + paymentType + '\'' +
                '}';
    }

    public void setPaymentType(String paymentType) {
        this.paymentType = paymentType;
    }
}
