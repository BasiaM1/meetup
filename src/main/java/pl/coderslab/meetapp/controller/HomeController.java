package pl.coderslab.meetapp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.coderslab.meetapp.repository.CommentRepository;
import pl.coderslab.meetapp.repository.MeetRepository;
import pl.coderslab.meetapp.repository.UserRepository;
import pl.coderslab.meetapp.entity.Meet;
import pl.coderslab.meetapp.entity.User;
import pl.coderslab.meetapp.repository.CommentRepository;
import pl.coderslab.meetapp.repository.MeetRepository;
import pl.coderslab.meetapp.repository.UserRepository;
import pl.coderslab.meetapp.utils.MeetByDateComparator;

import java.util.Collections;
import java.util.List;

@Controller
public class HomeController {


    @RequestMapping({"/home", "/"})
    public String welcomePage() {

        return "index";
    }


}
