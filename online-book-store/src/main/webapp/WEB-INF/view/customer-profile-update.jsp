<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="header.jsp"/>

      <!-- Main Content -->
      <div id="content">

        <jsp:include page="topbar.jsp">
          <jsp:param name="pageTitle" value="Customer Profile" />
        </jsp:include>

        <!-- Begin Page Content -->
        <div class="container-fluid">

          <!-- DataTales Example -->
          <div class="card shadow mb-4">
            <div class="card-header py-3">
              <h6 class="m-0 font-weight-bold text-primary">Profile Update</h6>
            </div>
            <div class="card-body">
              <div class="table-responsive">
              <form:form method="POST" modelAttribute="customerData" action="/customers/profile/update/process" >
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                		<form:hidden path="role" value="ROLE_CUSTOMER"/>
                		<form:hidden path="username"/>
                  <tbody>
                  		<tr><td colspan="2" style="color:red; align:center;"><c:if test="${message != null}"><c:out value="${message}"></c:out> </c:if>
                  		</td></tr>
	                    <tr>
	                      <td style="color:green;">First Name: </td> <td><form:input path="firstName"/> </td>
	                    </tr>
	                    <tr>
	                      <td style="color:green;">Last Name: </td> <td><form:input path="lastName"/> </td>
	                    </tr>
	                    <tr>
	                      <td style="color:green;">Username: </td> <td><c:out value="${customerData.username}"></c:out> </td>
	                    </tr>
	                    <tr>
	                      <td style="color:green;">Email Id: </td> <td><form:input path="email"/> </td>
	                    </tr>
	                    <tr>
	                      <td style="color:green;">Mobile Number: </td> <td><form:input path="mobile"/> </td>
	                    </tr>
	                    <tr>
	                      <td style="color:green;">Address: </td> <td><form:textarea path="address"/> </td>
	                    </tr>
	                    <tr>
	                      <td style="color:green;">Password(Encrypted)</td> <td>***************************************************************</td>
	                    </tr>
	                    <tr>
	                      <td style="color:green;">Enter Password to update</td> <td><form:password path="password" placeholder="Confirm Password.." /></td>
	                    </tr>
	                    <tr>
	                      <td colspan="2" ><input type="submit" class="btn btn-success" value="Update Profile" style="align:center" onClick="return confirm('Do you really want to update ?');"/> </td>
	                    </tr>
                  </tbody>
                </table>
                </form:form>
              </div>
            </div>
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
