package vicsinth.DsAIgn.demo;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;

@Controller
public class FileController {
    @RequestMapping(value = "/uploadFile", method = RequestMethod.POST)
    public String handleFileUpload(@RequestParam("file") MultipartFile file,
                              Model model) {
        String message="";
        if(!file.isEmpty()) {
            try {
                byte[] bytes = file.getBytes();

                // Creating the directory to store file
                String rootPath = System.getProperty("catalina.home");
                File dir = new File(rootPath + File.separator + "tmpFiles");
                if (!dir.exists())
                    dir.mkdirs();

                // Create the file on server
                File serverFile = new File(dir.getAbsolutePath()
                        + File.separator + file);
                BufferedOutputStream stream = new BufferedOutputStream(
                        new FileOutputStream(serverFile));
                stream.write(bytes);
                stream.close();

                model.addAttribute("fileName", file.toString());
                message = "You successfully uploaded file = " + file;
                System.out.println(message);
            } catch (Exception e) {
                message = "You failed to upload " + file + " => " + e.getMessage();
                System.out.println(message);
            }
        } else {
            message =  "You failed to upload " + file
                    + " because the file was empty.";
            System.out.println(message);
        }


    return "uploadFile";
    }
}
