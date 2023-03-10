<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*, com.shashirajraja.onlinebookstore.entity.ShoppingCart" %>
<html lang="en">

<head>

    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <title>Online Book Store</title>

    <!-- Custom fonts for this template -->
    <link href="${pageContext.request.contextPath}/vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
          type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
          rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="${pageContext.request.contextPath}/css/login-register.css" rel="stylesheet">

    <!-- Custom styles for this page -->
    <link href="${pageContext.request.contextPath}/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet"
          type="text/css">

</head>

<body id="page-top">

<!-- Page Wrapper -->
<div id="wrapper">

    <!-- Sidebar -->
    <ul class="navbar-nav bg-gradient-dark sidebar sidebar-dark accordion" id="accordionSidebar">

        <!-- Sidebar - Brand -->
        <a class="sidebar-brand d-flex align-items-center justify-content-center" href="${pageContext.request.contextPath}/customers/books">
            <div class="sidebar-brand-icon rotate-n-15">
                <i class="fas fa-laugh-wink"></i>
            </div>
            <div class="sidebar-brand-text mx-3">Book Store</div>
        </a>

        <!-- Divider -->
        <hr class="sidebar-divider my-0">
        <!-- Divider -->
        <hr class="sidebar-divider">

        <!-- Heading -->
        <div class="sidebar-heading">
            Interface
        </div>

        <!-- Nav Item - Pages Collapse Menu -->
        <li class="nav-item">
            <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo"
               aria-expanded="true" aria-controls="collapseTwo">
                <i class="fas fa-fw fa-user"></i>
                <span>Profile</span>
            </a>
            <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                <div class="bg-white py-2 collapse-inner rounded">
                    <h6 class="collapse-header">Profile:</h6>
                    <a class="collapse-item" href="${pageContext.request.contextPath}/customers/profile">View
                        Profile</a>
                    <a class="collapse-item" href="${pageContext.request.contextPath}/customers/profile/update">Update
                        Profile</a>
                </div>
            </div>
        </li>

        <!-- Nav Item - Books List -->
        <li class="nav-item">
            <a class="nav-link" href="${pageContext.request.contextPath}/customers/books">
                <i class="fas fa-fw fa-book"></i>
                <span> Books Available</span></a>
        </li>

        <li class="nav-item">
            <a class="nav-link" href="${pageContext.request.contextPath}/customers/purchased-books">
                <i class="fas fa-fw fa-book"></i>
                <span> Books Purchased</span></a>
        </li>

        <li class="nav-item">
            <a class="nav-link" href="${pageContext.request.contextPath}/sellers/books">
                <i class="fas fa-fw fa-book"></i>
                <span> Books Inventory</span></a>
        </li>

        <!-- Nav Item - Cart -->
        <li class="nav-item">
            <a class="nav-link" href="${pageContext.request.contextPath}/customers/cart">
                <i class="fas fa-fw fa-shopping-cart"></i>
                <span>Shopping Cart</span></a>
        </li>

        <!-- View Transactions History -->
        <li class="nav-item">
            <a class="nav-link" href="${pageContext.request.contextPath}/customers/transactions">
                <i class="fas fa-fw fa-shopping-cart"></i>
                <span>Transactions</span></a>
        </li>

        <!-- Divider -->
        <hr class="sidebar-divider">

        <!-- Heading -->
        <div class="sidebar-heading">
            security
        </div>

        <!-- Nav Password change -->
        <li class="nav-item">
            <a class="nav-link" href="${pageContext.request.contextPath}/customers/password">
                <i class="fas fa-fw fa-key"></i>
                <span>Change Password</span></a>
        </li>

        <!-- Nav Logout button -->
        <li class="nav-item" onClick="return confirm('Do you really want to logout?')">
            <a class="nav-link" href="${pageContext.request.contextPath}/logout">
                <i class="fas fa-fw fa-sign-out-alt"></i>
                <span>Logout</span></a>
        </li>


        <!-- Divider -->
        <hr class="sidebar-divider d-none d-md-block">

        <!-- Sidebar Toggler (Sidebar) -->
        <div class="text-center d-none d-md-inline">
            <button class="rounded-circle border-0" id="sidebarToggle"></button>
        </div>

    </ul>
    <!-- End of Sidebar -->

    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">