package com.example.ebooksystemproject.entity;

public class Book_Order {
    private int orderId;
    private int userId;

    private int bookId;

    private String email;

    private String phno;

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    private String fullAddress;

    private String price;
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

    private String bookName;

    private String authorName;

    public Book_Order() {
    }

    private String paymentType;

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getBookId() {
        return bookId;
    }

    public void setBookId(int bookId) {
        this.bookId = bookId;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhno() {
        return phno;
    }

    public void setPhno(String phno) {
        this.phno = phno;
    }

    public String getFullAddress() {
        return fullAddress;
    }

    public void setFullAddress(String fullAddress) {
        this.fullAddress = fullAddress;
    }

    public String getPaymentType() {
        return paymentType;
    }

    public void setPaymentType(String paymentType) {
        this.paymentType = paymentType;
    }

    @Override
    public String toString() {
        return "Book_Order{" +
                "orderId=" + orderId +
                ", userId=" + userId +
                ", bookId=" + bookId +
                ", email='" + email + '\'' +
                ", phno='" + phno + '\'' +
                ", fullAddress='" + fullAddress + '\'' +
                ", paymentType='" + paymentType + '\'' +
                '}';
    }
}
