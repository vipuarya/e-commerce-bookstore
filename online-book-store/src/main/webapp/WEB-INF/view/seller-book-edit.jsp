<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="header.jsp"/>
        <!-- Main Content -->
        <div id="content">

            <!-- Topbar -->
            <jsp:include page="topbar.jsp">
                <jsp:param name="pageTitle" value="Edit Book Info" />
            </jsp:include>
            <!-- End of Topbar -->

            <!-- Begin Page Content -->
            <div class="container-fluid">

                <!-- DataTales Example -->
                <div class="card shadow mb-4">
                    <div class="card-header py-3">
                        <h6 class="m-0 font-weight-bold text-primary">Present Category: ${bookDetail.type}</h6>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <form:form method="POST" modelAttribute="book" action="/sellers/books/update">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <form:hidden path="id"/>
                                    <tbody>
                                    <tr>
                                        <td colspan="2" style="color:red; align:center;"><c:if
                                                test="${message != null}"><c:out value="${message}"></c:out> </c:if>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="color:green;">Name:</td>
                                        <td><form:input type="text" path="name"
                                                        required="required"/></td>
                                    </tr>
                                    <tr>
                                        <td style="color:green;">Price:</td>
                                        <td><form:input type="number" path="price"
                                                        required="required"/></td>
                                    </tr>
                                    <tr>
                                        <td style="color:green;">Quantity:</td>
                                        <td><form:input type="number"
                                                        path="quantity"
                                                        required="required"/></td>
                                    </tr>
                                    <form:form modelAttribute="bookDetail">
                                        <jsp:useBean id="bookDetail" scope="request" type="com.shashirajraja.onlinebookstore.entity.BookDetail"/>
                                        <form:hidden path="id"/>
                                        <tr>
                                            <td style="color:green;">Book Details:</td>
                                            <td><form:textarea id="detail"
                                                               path="detail" rows="3"
                                                               cols="50"
                                                               placeholder="Enter Details"
                                                               required="required"/></td>
                                        <tr>
                                            <td style="color:green;">Type:</td>

                                        <td><form:select path="type" required="required">
                                            <form:option value="Horror"
                                                         label="Horror"
                                                         selected='<%= (bookDetail.getType().equals("Horror"))? "true": ""%>'/>
                                            <form:option value="Cubs"
                                                         label="Cubs"
                                                         selected='<%= (bookDetail.getType().equals("Cubs"))? "true": ""%>'/>
                                            <form:option value="Science Fiction"
                                                         label="Science Fiction"
                                                         selected='<%= (bookDetail.getType().equals("Science Fiction"))? "true": ""%>'/>
                                            <form:option value="Adventure"
                                                         label="Adventure"
                                                         selected='<%= (bookDetail.getType().equals("Adventure"))? "true": ""%>'/>
                                            <form:option value="Motivational"
                                                         label="Motivational"
                                                         selected='<%= (bookDetail.getType().equals("Motivational"))? "true": ""%>'/>
                                            <form:option value="Art"
                                                         label="Art"
                                                         selected='<%= (bookDetail.getType().equals("Art"))? "true": ""%>'/>
                                            <form:option value="Health"
                                                         label="Health"
                                                         selected='<%= (bookDetail.getType().equals("Health"))? "true": ""%>'/>
                                            <form:option value="Humor"
                                                         label="Humor"
                                                         selected='<%= (bookDetail.getType().equals("Humor"))? "true": ""%>'/>
                                        </form:select>
                                        </td>
                                    </tr>
                                    </form:form>
                                    </tr>
                                    <tr>
                                        <td><a class="btn btn-outline-danger" href="/sellers/books/">Cancel</a></td>
                                        <td><input type="submit" class="btn btn-outline-success" value="Submit"/></td>

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
<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
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
