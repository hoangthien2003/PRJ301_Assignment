/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models.shopping;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import models.user.UserDTO;
import utils.DBUtils;

/**
 *
 * @author hoang
 */
public class ProductDAO {
    private static final String ALL_PRODUCT = "SELECT * FROM tblProducts";
    private static final String INSERT_ORDER = "INSERT INTO tblOrders(orderID, userID, date, total, address, phoneNumber) VALUES(?,?,?,?,?,?)";
    private static final String INSERT_ORDER_DETAIL = "INSERT INTO tblOrderDetails(orderDetailID, orderID, productID, price, quantity) VALUES(?,?,?,?,?)";
    private static final String UPDATE_QUANTITY = "UPDATE tblProducts SET quantity = ? WHERE productID = ?";
    private static final String QUANTITY = "SELECT quantity FROM tblProducts WHERE productID = ?";
    private static final String UPDATE = "UPDATE tblProducts SET name = ?, price = ?, quantity = ?, imageURL = ? WHERE productID = ?";
    private static final String DELETE_PRODUCT = "DELETE tblProducts WHERE productID = ?";
    private static final String SEARCH = "SELECT productID, name, price, quantity, imageURL FROM tblProducts WHERE name like ?";
    private static final String ADD_PRODUCT = "INSERT INTO tblProducts(productID, name, price, quantity, imageURL) VALUES(?,?,?,?,?)";
    private static final String TOTAL_PRODUCT = "SELECT count(*) FROM tblProducts";
    private static final String GET_INDEX_TO_PADDING_PRODUCT = "SELECT * FROM tblProducts ORDER BY productID OFFSET ? ROWS FETCH NEXT 5 ROWS ONLY;";
    
    
    public List<ProductDTO> getListProduct() throws SQLException {
        List<ProductDTO> listProduct = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(ALL_PRODUCT);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String productID = rs.getString("productID");
                    String name = rs.getString("name");
                    double price = rs.getDouble("price");
                    int quantity = rs.getInt("quantity");
                    String imageURL = rs.getString("imageURL");
                    listProduct.add(new ProductDTO(productID, name, price, quantity, imageURL));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) rs.close();
            if (ptm != null) ptm.close();
            if (conn != null) conn.close();
        }
        return listProduct;
    }
    
    public int getQuantity(String teaID) throws SQLException {
        int quantity = 0;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(QUANTITY);
                ptm.setString(1, teaID);
                rs = ptm.executeQuery();
                while(rs.next()) {
                    quantity = rs.getInt("quantity");
                }
            }
        } catch (Exception e) {
        } finally {
            if (rs != null) rs.close();
            if (ptm != null) ptm.close();
            if (conn != null) conn.close();
        }
        return quantity;
    }
    
    public boolean checkSoldOut(String teaID, int quantityCart) throws SQLException {
        boolean check = false;
        int quantityDB = getQuantity(teaID);
        if (quantityDB == 0) check = true;
        return check;
    }
    
    public boolean checkQuantity(String teaID, int quantityCart) throws SQLException {
        boolean check = false;
        int quantityDB = getQuantity(teaID);
        if (quantityCart > quantityDB) check = true;
        return check;
    }

    public boolean insertOrder(OrderDTO orderDTO) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(INSERT_ORDER);
                ptm.setString(1, orderDTO.getOrderID());
                ptm.setString(2, orderDTO.getUserID());
                ptm.setDate(3, orderDTO.getDate());
                ptm.setDouble(4, orderDTO.getTotal());
                ptm.setString(5, orderDTO.getAddress());
                ptm.setString(6, orderDTO.getPhoneNumber());
                check = ptm.executeUpdate()>0 ? true : false;
            }
        } catch (Exception e) {
        } finally {
            if (rs != null) rs.close();
            if (ptm != null) ptm.close();
            if (conn != null) conn.close();
        }
        return check;
    }

    public boolean insertOrderDetail(OrderDetailDTO orderDetailDTO) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(INSERT_ORDER_DETAIL);
                ptm.setString(1, orderDetailDTO.getOrderDetailID());
                ptm.setString(2, orderDetailDTO.getOrderID());
                ptm.setString(3, orderDetailDTO.getProductID());
                ptm.setDouble(4, orderDetailDTO.getPrice());
                ptm.setInt(5, orderDetailDTO.getQuantity());
                check = ptm.executeUpdate()>0 ? true : false;
            }
        } catch (Exception e) {
        } finally {
            if (rs != null) rs.close();
            if (ptm != null) ptm.close();
            if (conn != null) conn.close();
        }
        return check;
    }

    public boolean updateQuantity(String teaID, int quantityCart) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(UPDATE_QUANTITY);
                int quantityDB = getQuantity(teaID);
                int quantityUpdate = quantityDB - quantityCart;
                ptm.setInt(1, quantityUpdate);
                ptm.setString(2, teaID);
                check = ptm.executeUpdate()>0 ? true : false;
            }
        } catch (Exception e) {
        } finally {
            if (rs != null) rs.close();
            if (ptm != null) ptm.close();
            if (conn != null) conn.close();
        }
        return check;
    }
    
    public boolean updateProduct(ProductDTO product) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(UPDATE);
                ptm.setString(1, product.getName());
                ptm.setDouble(2, product.getPrice());
                ptm.setInt(3, product.getQuantity());
                ptm.setString(4, product.getImageURL());
                ptm.setString(5, product.getProductID());
                check = ptm.executeUpdate()>0 ? true : false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ptm != null) ptm.close();
            if (conn != null) conn.close();
        }
        return check;
    }

    public boolean removeProduct(String productID) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(DELETE_PRODUCT);
                ptm.setString(1, productID);
                check = ptm.executeUpdate()>0 ? true : false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ptm!=null) ptm.close();
            if (conn != null) conn.close();
        }
        return check;
    }
    
    public List<ProductDTO> getListProductSearch(String search) throws SQLException {
        List<ProductDTO> listProduct = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(SEARCH);
                ptm.setString(1, "%"+search+"%");
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String productID = rs.getString("productID");
                    String name = rs.getString("name");
                    double price = rs.getDouble("price");
                    int quantity = rs.getInt("quantity");
                    String imageURL = rs.getString("imageURL");
                    listProduct.add(new ProductDTO(productID, name, price, quantity, imageURL));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) rs.close();
            if (ptm != null) ptm.close();
            if (conn != null) conn.close();
        }
        return listProduct;
    }

    public boolean addProduct(ProductDTO product) throws SQLException, ClassNotFoundException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(ADD_PRODUCT);
                ptm.setString(1, product.getProductID());
                ptm.setString(2, product.getName());
                ptm.setDouble(3, product.getPrice());
                ptm.setInt(4, product.getQuantity());
                ptm.setString(5, product.getImageURL());
                check = ptm.executeUpdate()>0 ? true : false;
            }
        } finally {
            if (ptm != null) ptm.close();
            if (conn != null) conn.close();
        }
        return check;
    }
    
    public int getCountProduct() throws SQLException{
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(TOTAL_PRODUCT);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    return rs.getInt(1);
                }
            }
        } catch (Exception e) {
        } finally {
            if (rs != null) rs.close();
            if (ptm != null) ptm.close();
            if (conn != null) conn.close();
        }
        
        return 0;
    }
    
    public List<ProductDTO> paddingProduct(int index) throws SQLException{
        List<ProductDTO> listProduct = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_INDEX_TO_PADDING_PRODUCT);
                ptm.setInt(1, (index - 1)*5);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String id = rs.getString("productID");
                    String name = rs.getString("name");
                    double price = rs.getDouble("price");
                    int quantity = rs.getInt("quantity");
                    String image = rs.getString("imageURL");
                    listProduct.add(new ProductDTO(id, name, price, quantity, image));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) rs.close();
            if (ptm != null) ptm.close();
            if (conn != null) conn.close();
        }
        return listProduct;
    }
}
