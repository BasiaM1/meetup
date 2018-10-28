package pl.coderslab.meetapp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.meetapp.entity.Meet;
import pl.coderslab.meetapp.entity.User;
import pl.coderslab.meetapp.repository.MeetRepository;
import pl.coderslab.meetapp.repository.UserRepository;

import javax.validation.Valid;
import javax.validation.Validator;
import java.util.ArrayList;
import java.util.List;
@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    UserRepository userRepository;

    @Autowired
    MeetRepository meetRepository;

    @Autowired
    Validator validator;

    @RequestMapping(value = ("/register"), method = RequestMethod.GET)
    public String registerForm(Model model) {
        model.addAttribute("user", new User());
        return "userRegistration";
    }

    @RequestMapping(value = ("/register"), method = RequestMethod.POST)
    public String registred(@Valid User user, BindingResult result) {
        if (result.hasErrors()) {
            return "userRegistration";
        }

        user.setEnabled(true);
        user.setPassword(BCrypt.hashpw(user.getPassword(), BCrypt.gensalt()));
        userRepository.save(user);
        return "redirect:/user/" + user.getId();
    }

    @RequestMapping(value = "/profile", method = RequestMethod.POST)
    public String showProfile(){
        User loggedIn = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        return "redirect:/user/" +loggedIn.getId();
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public String showUserProfile(@PathVariable Long id, Model model) {
        User loggedIn = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        if(!id.equals(loggedIn.getId())){
            // TODO
            throw new SecurityException("you are not the profile owner");
        }


        User userShown = userRepository.getOne(id);
        model.addAttribute("userProfile", userShown);
        List<Meet> userMeets = meetRepository.findAllByUserId(id);
        model.addAttribute("meets", userMeets);
        return "profile";
    }


    @RequestMapping(value = "/{id}/aboutUser", method = RequestMethod.GET)
    public String aboutByUser(Model model, @PathVariable Long id) {
        User user = userRepository.getOne(id);
        model.addAttribute("user", user);
        List<Meet> userMeets = meetRepository.findAllByUserId(id);
        model.addAttribute("meets", userMeets);
        return "profileVisible";
    }
    @RequestMapping(value ="/search-meets", method = RequestMethod.GET)
    public String searchMeets() {
        return "searchmeet";
    }

    @RequestMapping(value ="/search-meets", method = RequestMethod.POST)
    public String getMeetsBySearch(Model model, @RequestParam String search) {
        List<Meet> searchMeets = meetRepository.findBySearch(search);
        model.addAttribute("search", search);
        model.addAttribute("meets", searchMeets);
        return "searchmeet";
    }

    @RequestMapping(value ="/search-meetscity", method = RequestMethod.GET)
    public String searchMeetscity() {
        return "searchmeetscity";
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
    @RequestMapping(value ="/search-meetscity", method = RequestMethod.POST)
    public String getMeetsBySearchcity(Model model, @RequestParam String search1) {
        List<Meet> searchMeetscity = meetRepository.findBySearchCity(search1);
        model.addAttribute("search1", search1);
        model.addAttribute("meets1", searchMeetscity);
        return "citymeets";
    }
    @RequestMapping(value = "/all", method = RequestMethod.GET)
    public String getAllUsers(Model model) {
        List<User> users = userRepository.findAll();
        model.addAttribute("allUsers", users);
        return "allUsersmeets";
    }
    @RequestMapping(value = "/{id}/meets", method = RequestMethod.GET)
    public String getMeetsByUser(Model model, @PathVariable Long id) {
        User user = userRepository.getOne(id);
        model.addAttribute("user", user);
        List<Meet> userMeets = meetRepository.findAllByUserId(id);
        model.addAttribute("umeets", userMeets);
        return "usermeets";
    }

}


