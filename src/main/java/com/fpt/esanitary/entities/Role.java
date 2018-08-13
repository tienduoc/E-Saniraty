package com.fpt.esanitary.entities;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Collection;
import java.util.Objects;

@Entity
public class Role implements Serializable {
  private String id;
  private String name;
  private Collection<Account> accountsById;

  @Id
  @Column(name = "Id", nullable = false, length = 10)
  public String getId() {
    return id;
  }

  public void setId(String id) {
    this.id = id;
  }

  @Basic
  @Column(name = "Name", nullable = false, length = 50)
  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  @Override
  public boolean equals(Object o) {
    if (this == o) return true;
    if (o == null || getClass() != o.getClass()) return false;
    Role role = (Role) o;
    return Objects.equals(id, role.id) &&
            Objects.equals(name, role.name);
  }

  @Override
  public int hashCode() {

    return Objects.hash(id, name);
  }

  @OneToMany(mappedBy = "roleByRoleId")
  public Collection<Account> getAccountsById() {
    return accountsById;
  }

  public void setAccountsById(Collection<Account> accountsById) {
    this.accountsById = accountsById;
  }
}
