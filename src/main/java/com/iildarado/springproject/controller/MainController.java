package com.iildarado.springproject.controller;

import com.iildarado.springproject.domain.Course;
import com.iildarado.springproject.domain.Message;
import com.iildarado.springproject.domain.User;
import com.iildarado.springproject.repos.CourseRepo;
import com.iildarado.springproject.repos.MessageRepo;
import com.iildarado.springproject.repos.UserRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.Map;
import java.util.UUID;

@Controller
public class MainController {

    @Autowired
    private MessageRepo messageRepo;

    @Autowired
    private CourseRepo courseRepo;

    @Autowired
    private UserRepo userRepo;

    @Value("${upload.path}")
    private String uploadPath;

    @GetMapping("/")
    public String greeting (Map<String, Object> model) {

        Iterable<Course> courses =  courseRepo.findAll();

        model.put("courses", courses);;

        return "index";
    }

    @GetMapping("/main")
    public String main(@RequestParam(required = false, defaultValue = "") String filter,
                       @AuthenticationPrincipal User user,
                       Model model){
        Iterable<Message> messages =  messageRepo.findAll();

        if (filter != null && !filter.isEmpty())
            messages =  messageRepo.findByTag(filter);
        else
            messages = messageRepo.findAll();

        model.addAttribute("messages", messages);
        model.addAttribute("filter", filter);
        model.addAttribute("author", user.getUsername());
        return "main";
    }

    @PostMapping("/main")
    public String addMessage(
            @AuthenticationPrincipal User user,
            @RequestParam String text,
            @RequestParam String tag, Map<String, Object> model,
            @RequestParam("file") MultipartFile file) throws IOException {
        Message message = new Message(text, tag, user);

        if (file != null && !file.getOriginalFilename().isEmpty()) {
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists())
                uploadDir.mkdir();
            String uuidFile =  UUID.randomUUID().toString();
            String resultFilename = uuidFile + "." + file.getOriginalFilename();
            file.transferTo(new File(uploadPath + "/" + resultFilename));
            message.setFilename(resultFilename);
        }

        messageRepo.save(message);
        User author = userRepo.findByFirstname(user.getFirstname());

        Iterable<Message> messages =  messageRepo.findAll();
        model.put("messages", messages);
        model.put("author", author.getUsername());
        return "main";
    }
}
