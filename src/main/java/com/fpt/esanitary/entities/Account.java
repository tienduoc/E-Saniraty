package com.fpt.esanitary.entities;

import javax.persistence.*;
import java.util.Collection;
import java.util.Objects;

@Entity
public class Account {
    private String username;
    private String password;
    private String fullname;
    private String phone;
    private String email;
    private String address;
    private boolean enabled;
    private String roleId;
    private Role roleByRoleId;
    private Collection<Feedback> feedbacksByUsername;
    private Collection<Order> ordersByUsername;

    @Id
    @Column(name = "Username", nullable = false, length = 50)
    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    @Basic
    @Column(name = "Password", nullable = false, length = 68)
    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Basic
    @Column(name = "Fullname", nullable = true, length = 2147483647)
    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    @Basic
    @Column(name = "Phone", nullable = true, length = 15)
    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    @Basic
    @Column(name = "Email", nullable = false, length = 2147483647)
    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    @Basic
    @Column(name = "Address", nullable = true, length = 2147483647)
    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    @Basic
    @Column(name = "Enabled", nullable = false)
    public boolean isEnabled() {
        return enabled;
    }

    public void setEnabled(boolean enabled) {
        this.enabled = enabled;
    }

    @Basic
    @Column(name = "RoleID", nullable = false, length = 10)
    public String getRoleId() {
        return roleId;
    }

    public void setRoleId(String roleId) {
        this.roleId = roleId;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Account account = (Account) o;
        return enabled == account.enabled &&
                Objects.equals(username, account.username) &&
                Objects.equals(password, account.password) &&
                Objects.equals(fullname, account.fullname) &&
                Objects.equals(phone, account.phone) &&
                Objects.equals(email, account.email) &&
                Objects.equals(address, account.address) &&
                Objects.equals(roleId, account.roleId);
    }

    @Override
    public int hashCode() {

        return Objects.hash(username, password, fullname, phone, email, address, enabled, roleId);
    }

    @ManyToOne
    @JoinColumn(name = "RoleID", referencedColumnName = "Id", insertable = false, updatable = false)
    public Role getRoleByRoleId() {
        return roleByRoleId;
    }

    public void setRoleByRoleId(Role roleByRoleId) {
        this.roleByRoleId = roleByRoleId;
    }

    @OneToMany(mappedBy = "accountByUsername")
    public Collection<Feedback> getFeedbacksByUsername() {
        return feedbacksByUsername;
    }

    public void setFeedbacksByUsername(Collection<Feedback> feedbacksByUsername) {
        this.feedbacksByUsername = feedbacksByUsername;
    }

    @OneToMany(mappedBy = "accountByUsername")
    public Collection<Order> getOrdersByUsername() {
        return ordersByUsername;
    }

    public void setOrdersByUsername(Collection<Order> ordersByUsername) {
        this.ordersByUsername = ordersByUsername;
    }
}
