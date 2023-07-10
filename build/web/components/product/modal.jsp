<%-- 
    Document   : modal
    Created on : Jul 4, 2023, 4:03:14 PM
    Author     : hoang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- Modal -->
<div class="modal fade" id="addProductModal" aria-hidden="true" aria-labelledby="exampleModalToggleLabel" tabindex="-1">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalToggleLabel">Add Product Modal</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <form action="AdminController" method="POST">
                <div class="modal-body">
                    <div class="form-floating mb-3">
                        <input type="text" class="form-control" id="addID" name="productID" placeholder="ProductID" required="">
                        <label for="floatingInput">ProductID</label>
                    </div>
                    <div class="form-floating mb-3">
                        <input type="text" class="form-control" id="addImage" name="imageURL" placeholder="ProductID" required="">
                        <label for="floatingInput">Image URL</label>
                    </div>
                    <div class="form-floating mb-3">
                        <input type="text" class="form-control" id="addName" name="name" placeholder="Name" required="">
                        <label for="floatingInput">Name</label>
                    </div>
                    <div class="form-floating mb-3">
                        <input type="number" min="1" value="1.0" class="form-control" name="price" id="addPrice" placeholder="Price">
                        <label for="floatingPassword">Price</label>
                    </div>
                    <div class="form-floating">
                        <input type="number" min="1" value="1" class="form-control" name="quantity" id="addQuantity" placeholder="Quantity">
                        <label for="floatingPassword">Quantity</label>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal"
                            onclick="resetInputs()">Close</button>
                    <button type="submit" name="action" value="AddProduct" class="btn btn-danger">Add</button>
                </div>
            </form>
        </div>
    </div>
</div>
<div class="modal fade" id="editProductModal" aria-hidden="true" aria-labelledby="exampleModalToggleLabel" tabindex="-1">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalToggleLabel">Edit Product Modal</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <form action="AdminController" method="POST">
                <div class="modal-body">
                    <div class="form-floating mb-3">
                        <input type="text" class="form-control" id="editID" name="productID" value="" readonly>
                        <label for="floatingInput">ProductID</label>
                    </div>
                    <div class="form-floating mb-3">
                        <input type="text" class="form-control" id="editImage" name="imageURL" value="" required="">
                        <label for="floatingInput">Image URL</label>
                    </div>
                    <div class="form-floating mb-3">
                        <input type="text" class="form-control" id="editName" name="name" value="" required="">
                        <label for="floatingInput">Name</label>
                    </div>
                    <div class="form-floating mb-3">
                        <input type="number" class="form-control" id="editPrice" name="price" value="" min="1">
                        <label for="floatingPassword">Price</label>
                    </div>
                    <div class="form-floating">
                        <input type="number" class="form-control" id="editQuantity" name="quantity" value="" min="0">
                        <label for="floatingPassword">Quantity</label>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-success" name="action" value="UpdateProduct">Edit</button>
                </div>
            </form>
        </div>
    </div>
</div>
<script>
    function resetInputs() {
        document.getElementById("addID").value = "";
        document.getElementById("addImage").value = "";
        document.getElementById("addName").value = "";
        document.getElementById("addPrice").value = 1.0;
        document.getElementById("addQuantity").value = 1;
    }
</script>
