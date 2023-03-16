package com.shashirajraja.onlinebookstore.utility;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.Date;

@Component
public class FileUploadHelper {
    //could be replace with Actual path
    public final String UPLOAD_DIR = "D:\\New folder\\e-commerce-bookstore\\online-book-store\\src\\main\\resources\\static\\img";

    public  String uploadFile(MultipartFile multipartFile) {
        String fileName = "";
        try {
            //read
            InputStream is = multipartFile.getInputStream();
            byte data[]= new byte[is.available()];
            is.read(data);

            //write
            SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yy HH-mm-ss");
            Date date = new Date();

            fileName = dateFormat.format(date);
            FileOutputStream fileOutputStream = new FileOutputStream(UPLOAD_DIR+ File.separator+fileName+".jpg");
            fileOutputStream.write(data);

            is.close();
            fileOutputStream.flush();


            //below line is doing above steps only
            //Files.copy(multipartFile.getInputStream(), Paths.get(UPLOAD_DIR+File.separator+fileName) ,StandardCopyOption.REPLACE_EXISTING);


        }catch (Exception e) {
            fileName = "";
            e.printStackTrace();
        }
        return fileName;
    }
}
