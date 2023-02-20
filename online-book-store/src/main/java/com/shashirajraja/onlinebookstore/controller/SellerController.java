package com.shashirajraja.onlinebookstore.controller;

import java.util.Set;

import javax.servlet.http.HttpSession;

import com.shashirajraja.onlinebookstore.entity.*;
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
    public String addNewBook(@ModelAttribute("book") Book book, @ModelAttribute("bookDetail") BookDetail bookDetail, Model theModel) {
        if (book.getPrice() <= 0 || book.getQuantity() <= 0) {
            theModel.addAttribute("message", "Price/Quantity should be greater than zero");
            theModel.addAttribute("book", book);
            theModel.addAttribute("bookDetail", bookDetail);
            return "seller-book-add";
        }
        book.setBookDetail(bookDetail);
        theModel.addAttribute("message", theBookService.addBook(book));
        theModel.addAttribute("books", theBookService.getAllBooks());
        return "seller-books-list";
    }


    @GetMapping("/books")
    public String viewBooks(Model theModel) {

        Set<Book> books = theBookService.getAllBooks();
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
        book.setBookDetail(bookDetail);
        if (book.getPrice() <= 0 || book.getQuantity() <= 0) {
            theModel.addAttribute("message", "Price/Quantity should be greater than zero");
            theModel.addAttribute("book", book);
            theModel.addAttribute("bookDetail", bookDetail);
            return "seller-book-add";
        }
        theBookService.updateBook(book);
        theModel.addAttribute("books", theBookService.getAllBooks());
        return "seller-books-list";
    }

    @GetMapping("/books/delete")
    public String deleteBookById(@RequestParam("bookId") int id, Model theModel) {
        try {
            theModel.addAttribute("message", theBookService.removeBookById(id));
        }catch (Exception e) {
            theModel.addAttribute("message", "Not able to delete: Book is preset in cart of some user");
        }

        theModel.addAttribute("books", theBookService.getAllBooks());
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
