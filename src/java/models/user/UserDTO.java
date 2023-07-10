/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models.user;

/**
 *
 * @author hoang
 */
public class UserDTO {
    private String userID;
    private String name;
    private String roleID;
    private String password;

    public UserDTO() {
    }

    public UserDTO(String userID, String name, String roleID, String password) {
        this.userID = userID;
        this.name = name;
        this.roleID = roleID;
        this.password = password;
    }

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
    
    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getRole() {
        return roleID;
    }

    public void setRole(String role) {
        this.roleID = role;
    }
}
