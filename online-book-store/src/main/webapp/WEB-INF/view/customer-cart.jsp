<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*, com.shashirajraja.onlinebookstore.entity.ShoppingCart" %>
<jsp:include page="header.jsp"/>

      <!-- Main Content -->
      <div id="content">

        <!-- Topbar -->
        <jsp:include page="topbar.jsp">
          <jsp:param name="pageTitle" value="Shopping Cart" />
        </jsp:include>
        <!-- End of Topbar -->

        <!-- Begin Page Content -->
        <div class="container-fluid">

          <!-- DataTales Example -->
          <div class="card shadow mb-4">
            <div class="card-header py-3">
              <h6 class="m-0 font-weight-bold text-primary">Shopping Items List</h6>
            </div>
            <c:if test="${message != null}">
            <div class="card-header py-3">
              <h6 class="m-0 font-weight-bold text-primary"><c:out value="${message}"></c:out> </h6>
            </div>
            </c:if>
            <div class="card-body">
              <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                  <thead>
                    <tr>
                      <th>Id</th>
                      <th>Name</th>
                      <th>Type</th>
                      <th>Price/Item</th>
                      <th>Quantity</th>
                      <th>Amount</th>
                      <th>Action</th>
                    </tr>
                  </thead>
                  
                  <tbody>
                  		<c:set var="totalPrice" value="0" scope="page" />
						<c:set var="totalQuantity" value="0" scope="page" />
	                 <c:forEach var="shoppingCart" items="${shoppingItems}">
	                 	<!--URL for the add to cart option  -->
	           
						<c:url var="removeFromCartLink" value="/customers/cart/remove">
							<c:param name="bookId" value="${shoppingCart.book.id}"/>
						</c:url>
				
	                    <tr>
	                      <td><c:out value="${shoppingCart.book.id}"/></td>
	                      <td><c:out value="${shoppingCart.book.name}"/></td>
	                      <td><c:out value="${shoppingCart.book.bookDetail.type}"/></td>
	                      <td><c:out value="${shoppingCart.book.price}"/> <span>&#8377;</span></td>
	                      <td><c:out value="${shoppingCart.quantity}"/></td>
	                      <td><c:out value="${shoppingCart.quantity * shoppingCart.book.price}"/></td>
	                      
	                      <td style="color:green;">
		                      	<a href="${removeFromCartLink}"><input type="button" class="button btn-danger" value="Remove"></a>	                      	 
	                      </td>
	                      <c:set var="totalPrice" value="${totalPrice + (shoppingCart.quantity * shoppingCart.book.price) }" scope="page" />
						  <c:set var="totalQuantity" value="${totalQuantity + shoppingCart.quantity }" scope="page" />
	                      
	                    </tr>
                	</c:forEach>
                  </tbody>
                  <tfoot>
                    <tr>
                      <td colspan="3"></td>
                      <td>Total</td>
                      <td><c:out value="${totalQuantity}"/> (items)</td>
                      <td><c:out value="${totalPrice}"/> <span>&#8377;</span></td>
                      <td>
                      	<c:if test="${totalQuantity ne 0}"><a class="btn btn-success" href="${pageContext.request.contextPath}/customers/cart/pay">Pay Now</a> </c:if>
                      	<c:if test="${totalQuantity eq 0}"><a class="btn btn-success" href="${pageContext.request.contextPath}/books">View Books</a> </c:if>                      
                      </td>
                    </tr>
                  </tfoot>
                </table>
              </div>
            </div>
          </div>
            <div class="card-header py-3">
              <h6 class="m-0 font-weight-bold text-primary">
              <c:if test="${totalQuantity ne 0}"><a class="btn btn-success" href="${pageContext.request.contextPath}/customers/cart/pay">Proceed to Pay</a></c:if>
              <c:if test="${totalQuantity eq 0}"><a class="btn btn-success" href="${pageContext.request.contextPath}/books">View Books</a></c:if>
              </h6>
            </div>
        </div>
        <!-- /.container-fluid -->

      </div>
      <!-- End of Main Content -->

      <!-- Footer -->
      <footer class="sticky-footer bg-white">
        <div class="container my-auto">
          <div class="copyright text-center my-auto">
            <span>Copyright &copy; CSB Batch-VI 2023</span>
          </div>
        </div>
      </footer>
      <!-- End of Footer -->

    </div>
    <!-- End of Content Wrapper -->

  </div>
  <!-- End of Page Wrapper -->

  <!-- Scroll to Top Button-->
  <a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>

  <!-- Logout Modal-->
  <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
          <button class="close" type="button" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">x</span>
          </button>
        </div>
        <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
        <div class="modal-footer">
          <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
          <a class="btn btn-primary" href="${pageContext.request.contextPath}/logout">Logout</a>
        </div>
      </div>
    </div>
  </div>

  <!-- Bootstrap core JavaScript-->
  <script src="${pageContext.request.contextPath}/vendor/jquery/jquery.min.js"></script>
  <script src="${pageContext.request.contextPath}/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="${pageContext.request.contextPath}/vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="${pageContext.request.contextPath}/js/sb-admin-2.min.js"></script>

  <!-- Page level plugins -->
  <script src="${pageContext.request.contextPath}/vendor/datatables/jquery.dataTables.min.js"></script>
  <script src="${pageContext.request.contextPath}/vendor/datatables/dataTables.bootstrap4.min.js"></script>

  <!-- Page level custom scripts -->
  <script src="${pageContext.request.contextPath}/js/demo/datatables-demo.js"></script>

</body>

</html>
