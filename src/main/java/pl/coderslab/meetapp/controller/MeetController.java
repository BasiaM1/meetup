package pl.coderslab.meetapp.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.meetapp.entity.Comment;
import pl.coderslab.meetapp.entity.Meet;
import pl.coderslab.meetapp.entity.User;
import pl.coderslab.meetapp.repository.CommentRepository;
import pl.coderslab.meetapp.repository.MeetRepository;
import pl.coderslab.meetapp.repository.UserRepository;
import pl.coderslab.meetapp.utils.MeetByDateComparator;

import javax.validation.Valid;
import javax.validation.Validator;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/meet")
public class MeetController {

    @Autowired
    UserRepository userRepository;

    @Autowired
    MeetRepository meetRepository;

    @Autowired
    CommentRepository commentRepository;

    @Autowired
    Validator validator;

    //adding event
    @RequestMapping(value="/add", method = RequestMethod.GET) // /meet/add?userId=1
    public String showAddMeetForm(Model model, @RequestParam("userId") Long userId) { // TODO automativ strong 2 long conversion
        Meet m = new Meet();
        m.setUser(userRepository.findById(userId).get());
        model.addAttribute("meet", m);
        return "meetForm";
    }

    @ModelAttribute ("cityItems")
    public List<String> city() {
        List<String> city = new ArrayList<String>();

        city.add("Warszawa");
        city.add("Poznan");
        city.add("Torun");
        city.add("Bydgoszcz");
        city.add("Krakow");
        city.add("Katowice");
        city.add("Gdansk");
        city.add("Sopot");
        city.add("Gdynia");
        city.add("Zabrze");
        city.add("Lublin");
        city.add("Lodz");
        city.add("Rzeszow");
        city.add("Wroclaw");
        city.add("Szczecin");
        city.add("Bialystok");
        city.add("Olsztyn");
        return city;
    }

    @ModelAttribute ("categoryItems")
    public List<String> category() {
        List<String> category = new ArrayList<String>();

        category.add("Technologie");
        category.add("Zdrowie");
        category.add("Sport i fitness");
        category.add("Nauka");
        category.add("Fotografia");
        category.add("Rodzina");
        category.add("Jedzenie i picie");
        category.add("Muzyka");
        category.add("Film");
        category.add("Sztuka");
        category.add("Hobby");
        category.add("Zwierzeta");
        category.add("Moda i uroda");
        category.add("Spoleczne");
        return category;
    }

    @RequestMapping(value="/add", method = RequestMethod.POST)
    public String saveMeet(@Valid Meet meet, BindingResult result, Model model) {

        if (result.hasErrors()) {
            return "meetForm";
        }
        meet.setCreated(new Date());
        meetRepository.save(meet);
        return "redirect:/user/" + meet.getUser().getId() ;
    }

    //all events
    @ModelAttribute("/all")
    public List<Meet> getAllMeets() {
        List<Meet> meetList= meetRepository.findAll();
        return meetList;
    }

    //editing events
    @RequestMapping(value = "/edit/{id}", method = RequestMethod.GET)
    public String editMeet(Model model, @PathVariable Long id) {

        Meet meet = meetRepository.getOne(id);
        model.addAttribute("meet", meet);
        return "meetForm";
    }

    @RequestMapping(value = "/edit/{id}", method = RequestMethod.POST)
    public String editMeetPost(@Valid Meet meet, BindingResult result) {

        if (result.hasErrors()) {
            return "meetForm";
        }
        meet.setCreated(new Date());
        meetRepository.save(meet);
        return "redirect:/user/" + meet.getUser().getId();
    }

    //deleting events
    @RequestMapping(value="/delete/{id}", method=RequestMethod.GET)
    public String deleteMeet(@PathVariable Long id) {
        Meet deleteMeet = meetRepository.getOne(id);

        User loggedIn = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        if(!deleteMeet.getUser().getId().equals(loggedIn.getId())){
            throw new SecurityException("you are not a meet owner");
        }

        Long userId = deleteMeet.getUser().getId();
        meetRepository.delete(deleteMeet);
        return "redirect:/user/" + userId;
    }

    //comments to the event
    @RequestMapping(value = "/{id}/comment", method = RequestMethod.GET)
    public String commentPrepare(Model model, @PathVariable Long id){

        model.addAttribute("comment", new Comment());
        return "commentForm";
    }

    @RequestMapping(value = "/{meetId}/comment", method = RequestMethod.POST)
    public String comment(@ModelAttribute Comment comment, @PathVariable Long meetId) {
        User commentingUser = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();

        comment.setUser(commentingUser);
        comment.setMeet(meetRepository.getOne(meetId));
        comment.setCreated(new Date());

        commentRepository.save(comment);

        return "redirect:/";
    }

      //all events
    @RequestMapping(value = "/all", method = RequestMethod.GET)
    public String getAllUsers(Model model) {
        List<Meet> meets = meetRepository.findAll();
        model.addAttribute("allMeets", meets);
        return "allmeets";
    }

//    //events by city
//    @RequestMapping(value = "/{city}", method = RequestMethod.GET)
//    public String getMeetsByCity(Model model, @PathVariable String city) {
//
//        List<Meet> cityMeets = meetRepository.findAllByCity(city);
//        model.addAttribute("cmeets", cityMeets);
//        return "citymeets";
//    }

    //all events and users
    @RequestMapping(value = "/allm", method = RequestMethod.GET)
    public String getAllMeets(Model model) {
        List<User> users = userRepository.findAll();
        model.addAttribute("allUsers", users);
        List<Meet> userMeets = meetRepository.findAll();

        Collections.sort(userMeets, new MeetByDateComparator());

        model.addAttribute("allMeets2", userMeets);

        return "allmeets2";
    }
}
