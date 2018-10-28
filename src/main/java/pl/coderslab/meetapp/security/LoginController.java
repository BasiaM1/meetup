package pl.coderslab.meetapp.security;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import pl.coderslab.meetapp.entity.User;

@Controller
public class LoginController {

    //nie do konca dziala logowanie - nie chce przejsc po zalogowaniu do profilu
    @RequestMapping(value = ("/login"), method = RequestMethod.GET)
    public String loginForm(Model model) {
        model.addAttribute("user", new User());
        return "login";
    }

    //tu musi byc jeszcze sprawdzenie czy ten użytkownik jest już zarejestrowany w bazie za pomoca zmiennej enabled
   /* @RequestMapping(value = ("/login"), method = RequestMethod.POST)
    public String logged(@Valid User user, BindingResult result) {
        if (result.hasErrors()) {
            return "login";
        }
        userRepository.getOne(user.getId());
        return "redirect:/user/" + user.getId();
    }*/
}
