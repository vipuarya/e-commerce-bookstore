//package com.shashirajraja.onlinebookstore.controller;
//
//import com.shashirajraja.onlinebookstore.utility.FileUploadHelper;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.http.HttpStatus;
//import org.springframework.http.ResponseEntity;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.PostMapping;
//import org.springframework.web.bind.annotation.RequestParam;
//import org.springframework.web.bind.annotation.RestController;
//import org.springframework.web.multipart.MultipartFile;
//
//@RestController
//public class FileUploadController {
//
//    @Autowired
//    FileUploadHelper fileUploadHelper;
//
//
//    @PostMapping("/uploadBookImg")
//    public ResponseEntity<String> uploadFile(@RequestParam("bookImg") MultipartFile bookImg, Model theModel) {
//
//        try {
//            if (bookImg.isEmpty()) {
//                theModel.addAttribute("message", "File can't be empty");
//                //return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("File should not be empty");
//            } else if (!bookImg.getContentType().equals("image/jpeg")) {
//                theModel.addAttribute("message", "File should be an image(.jpg)");
//                //return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("File should be image only(.jpg)");
//            }
//            //file upload
//            boolean uploaded = fileUploadHelper.uploadFile(bookImg);
//            if(uploaded) {
//                //return ResponseEntity.ok("File is successfully uploaded");
//            }
//
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//
//        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Something went wrong! try Again");
//    }
//}
