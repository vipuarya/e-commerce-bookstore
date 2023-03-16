package com.shashirajraja.onlinebookstore.controller;

import java.util.Objects;
import java.util.Set;

import javax.servlet.http.HttpSession;

import com.shashirajraja.onlinebookstore.entity.*;
import com.shashirajraja.onlinebookstore.utility.FileUploadHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.shashirajraja.onlinebookstore.forms.entity.ChangePassword;
import com.shashirajraja.onlinebookstore.forms.entity.CustomerData;
import com.shashirajraja.onlinebookstore.service.BookService;
import com.shashirajraja.onlinebookstore.service.BookUserService;
import com.shashirajraja.onlinebookstore.service.CustomerService;
import com.shashirajraja.onlinebookstore.service.ShoppingCartService;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping("/sellers")
public class SellerController {

    @Autowired
    private BookService theBookService;

    @Autowired
    private BookUserService theBookUserService;

    @Autowired
    private CustomerService theCustomerService;

    @Autowired
    private CurrentSession currentSession;

    @Autowired
    private ShoppingCartService theShoppingCartService;

    @Autowired
    private FileUploadHelper fileUploadHelper;

    @GetMapping("")
    public String customerHome(Model theModel) {

        return viewBooks(theModel);
    }

    @GetMapping("/profile")
    public String profileView(Model theModel, HttpSession session) {
        CustomerData theData = new CustomerData(currentSession.getUser().getCustomer());
        theModel.addAttribute("customerData", theData);
        return "customer-profile-view";
    }

    @GetMapping("/profile/update")
    public String profileEdit(Model theModel) {
        CustomerData theData = new CustomerData(currentSession.getUser().getCustomer());
        theModel.addAttribute("customerData", theData);
        String message = null;
        theModel.addAttribute("message", message);
        return "customer-profile-update";
    }

    @PostMapping("/profile/update/process")
    public String processProfileEdit(@ModelAttribute("customerData") CustomerData customerData, Model theModel) {
        String message = theCustomerService.updateCustomer(customerData);
        theModel.addAttribute("message", message);
        CustomerData theData = new CustomerData(currentSession.getUser().getCustomer());
        theModel.addAttribute("customerData", theData);
        return "customer-profile-update";
    }

    @GetMapping("/password")
    public String changePassword(Model theModel) {
        String username = currentSession.getUser().getUsername();

        ChangePassword changePassword = new ChangePassword(username);

        theModel.addAttribute("changePassword", changePassword);

        String message = null;
        theModel.addAttribute("message", message);

        return "customer-password-update";
    }


    @PostMapping("/password/change")
    public String processChangePassword(@ModelAttribute("changePassword") ChangePassword changePassword, Model theModel) {
        String message = theCustomerService.updatePassword(changePassword);
        theModel.addAttribute("message", message);
        return "customer-password-update";
    }

	/*public String getUsername() {
		Authentication loggedInUser = SecurityContextHolder.getContext().getAuthentication();
		String username = loggedInUser.getName();
		return username;
	}*/

    @GetMapping("/books/add-new-book")
    public String addNewBook(Model theModel) {
        Book book = new Book();
        BookDetail bookDetail = new BookDetail();
        theModel.addAttribute("book", book);
        theModel.addAttribute("bookDetail", bookDetail);
        return "seller-book-add";
    }

    @PostMapping("/books/add")
    @ResponseStatus(HttpStatus.CREATED)
    public String addNewBook(@ModelAttribute("book") Book book, @ModelAttribute("bookDetail") BookDetail bookDetail, @ModelAttribute("bookImg") MultipartFile bookImg, Model theModel) {
        boolean invalid = false;
        invalid = isInvalid(book, theModel, invalid);
        if(invalid) {
            theModel.addAttribute("book", book);
            theModel.addAttribute("bookDetail", bookDetail);
            return "seller-book-add";
        }
        if(book.getQuantity() == 0) bookDetail.setSold(1);
        book.setBookDetail(bookDetail);

        //check for valid book img
        boolean imageValid = validBookImg(bookImg, theModel);

        if (!imageValid) {
            return "seller-book-add";
        }

        //String fileName = fileUploadHelper.uploadFile(bookImg);
//        String msg = "";
//        if(fileName.eqauls("")) {
        //msg = "Unable to load book img, please try again latter. Although"
//        }
        theModel.addAttribute("message", theBookService.addBook(book)); //msg + addBook msg
        theModel.addAttribute("books", theBookService.getNonDeletedBooks());
        return "seller-books-list";
    }


    @GetMapping("/books")
    public String viewBooks(Model theModel) {

        Set<Book> books = theBookService.getNonDeletedBooks();
        theModel.addAttribute("books", books);
        return "seller-books-list";
    }

    @GetMapping("/books/edit")
    public String getBookById(@RequestParam("bookId") int id, Model theModel) {
        Book book = theBookService.getBookById(id);
        theModel.addAttribute("book", book);
        theModel.addAttribute("bookDetail", book.getBookDetail() != null ? book.getBookDetail() : new BookDetail());
        return "seller-book-edit";
    }

    /**
     * AC: 5) Update a book.
     */

    @PostMapping("/books/update")
    @ResponseStatus(HttpStatus.OK)
    public String updateBook(@ModelAttribute("book") Book book, @ModelAttribute("bookDetail") BookDetail bookDetail, Model theModel) {
        boolean invalid = false;
        invalid = isInvalid(book, theModel, invalid);

        if(invalid) {
            theModel.addAttribute("book", book);
            theModel.addAttribute("bookDetail", bookDetail);
            return "seller-book-edit";
        }
        if(book.getQuantity()>0) bookDetail.setSold(0);
        book.setBookDetail(bookDetail);
        theBookService.updateBook(book);
        theModel.addAttribute("books", theBookService.getNonDeletedBooks());
        return "seller-books-list";
    }

    private boolean isInvalid(Book book, Model theModel, boolean invalid) {
        theModel.addAttribute("message", "");
        if (book.getPrice() <= 0) {
            invalid = true;
            theModel.addAttribute("message", "Price should be greater than zero");
        }
        if (book.getQuantity() < 0) {
            invalid = true;
            String message = theModel.getAttribute("message") != "" ? theModel.getAttribute("message") + "and Quantity should not be negative" : "Quantity should not be negative";
            theModel.addAttribute("message", message);
        }
        return invalid;
    }

    public boolean validBookImg(MultipartFile bookImg, Model theModel) {
        if (bookImg.isEmpty()) {
            theModel.addAttribute("message", "File can't be empty");
            return false;
        } else if (!Objects.equals(bookImg.getContentType(), "image/jpeg")) {
            theModel.addAttribute("message", "File should be an image(.jpg)");
            return false;
        }
        return true;
    }

    @GetMapping("/books/delete")
    public String deleteBookById(@RequestParam("bookId") int id, Model theModel) {
        Book book = theBookService.getBookById(id);
        if (book != null) {
            book.setDeleted(true);
            theBookService.updateBook(book);
            theModel.addAttribute("message", "Book " + book.getName() + " deletion is successful");
        } else {
            theModel.addAttribute("message", "Book deletion is unsuccessful");
        }
        theModel.addAttribute("books", theBookService.getNonDeletedBooks());
        return "seller-books-list";
    }


    @GetMapping("/books/search")
    public String searchBooks(@RequestParam("name") String search, Model theModel) {
        Set<Book> books = null;
        books = theBookService.searchBooks(search);
        theModel.addAttribute("books", books);
        System.out.println(search);
        return "seller-books-list";
    }
}
