<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="header.jsp"/>
        <!-- Main Content -->
        <div id="content">

            <!-- Topbar -->
            <jsp:include page="topbar.jsp">
                <jsp:param name="pageTitle" value="Inventory Books" />
            </jsp:include>
            <!-- End of Topbar -->

            <!-- Begin Page Content -->
            <div class="container-fluid">

                <!-- DataTales Example -->
                <div class="card shadow mb-4">
                    <div class="card-header py-3">
                        <h6 class="m-0 font-weight-bold text-primary">Book List</h6>
                    </div>
                    <c:if test="${message != null}">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary"><c:out value="${message}"></c:out> </h6>
                        </div>
                    </c:if>
                    <div class="card-body">
                        <div class="table-responsive">
                            <c:url var="addBookLink" value="/sellers/books/add-new-book">
                            </c:url>
                            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                <thead>
                                <tr>
                                    <th>Id</th>
                                    <th>Name</th>
                                    <th>Type</th>
                                    <th>Available</th>
                                    <th>Price</th>
                                    <th>Actions <a href="${addBookLink}"><i class="fas fa-plus" style="font-size:24px;"></i></a></th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="book" items="${books}">
                                    <!--URL for the add to cart option  -->
                                    <c:url var="editBookLink" value="/sellers/books/edit">
                                        <c:param name="bookId" value="${book.id}"/>
                                    </c:url>
                                    <c:url var="deleteBookLink" value="/sellers/books/delete">
                                        <c:param name="bookId" value="${book.id}"/>
                                    </c:url>
                                    <tr>
                                        <td><c:out value="${book.id}"/></td>
                                        <td><c:out value="${book.name}"/></td>
                                        <td><c:out value="${book.bookDetail.type}"/></td>
                                        <td><c:out value="${book.quantity}"/></td>
                                        <td><c:out value="${book.price}"/></td>

                                        <td style="color:green; text-align: center">
                                            <a href="${editBookLink}"><i class="fas fa-edit" style="font-size:24px;"></i></a>

                                            <a onclick="return confirm('Do you really want to delete the book ${book.name}?')"
                                               href="${deleteBookLink}"><i class="fas fa-trash"
                                                                           style="font-size:24px;"></i></a>

                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
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

<%--<!-- Delete Modal-->--%>
<%--<div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel1" aria-hidden="true">--%>
<%--    <div class="modal-dialog" role="document">--%>
<%--        <div class="modal-content">--%>
<%--            <div class="modal-header">--%>
<%--                <h5 class="modal-title" id="exampleModalLabel1">Are you sure?</h5>--%>
<%--                <button class="close" type="button" data-dismiss="modal" aria-label="Close">--%>
<%--                    <span aria-hidden="true">x</span>--%>
<%--                </button>--%>
<%--            </div>--%>
<%--            <div class="modal-body">You wanna delete this item.</div>--%>
<%--            <div class="modal-footer">--%>
<%--                <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>--%>
<%--                <a class="btn btn-primary">Ok</a>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>

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
