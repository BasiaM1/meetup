package pl.coderslab.meetapp.entity;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import pl.coderslab.meetapp.entity.Meet;

import javax.persistence.*;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.List;

@Entity
@Table(name="user_meet")
public class User implements UserDetails {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NotEmpty
    private String username;

    @NotEmpty
    private String password;

    private boolean enabled;

    @NotEmpty
    @Email
    private String email;

    @NotEmpty
    public String name;

    @NotEmpty
    public String surname;

    @Size(min = 10, max = 160)
    @NotEmpty
    public String aboutme;

    @OneToMany(mappedBy = "user", cascade = CascadeType.ALL)
    private List<Meet> meets = new ArrayList<>();

    @OneToMany(mappedBy = "user", cascade = CascadeType.ALL)
    private List<Comment> comments = new ArrayList<>();

    @OneToMany(mappedBy ="receiver", cascade = CascadeType.ALL)
    private List<Message> receivedmessages = new ArrayList<>();

    @OneToMany(mappedBy ="sender", cascade = CascadeType.ALL)
    private List<Message> sentmessages = new ArrayList<>();


    public User() {
    }

    public List<Meet> getMeets() {
        return meets;
    }

    public List<Comment> getComments() {
        return comments;
    }

    public void setComments(List<Comment> comments) {
        this.comments = comments;
    }

    public void setMeets(List<Meet> meets) {
        this.meets = meets;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    @Override
    public String getUsername() {
        return username;
    }

    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    @Override
    public boolean isAccountNonLocked() {
        return true;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        return Collections.EMPTY_LIST;
    }

    @Override
    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Override
    public boolean isEnabled() {
        return enabled;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSurname() {
        return surname;
    }

    public void setSurname(String surname) {
        this.surname = surname;
    }

    public String getAboutme() {
        return aboutme;
    }

    public void setAboutme(String aboutme) {
        this.aboutme = aboutme;
    }


    public void setEnabled(boolean enabled) {
        this.enabled = enabled;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }


    public List<Message> getReceivedmessages() {
        return receivedmessages;
    }

    public void setReceivedmessages(List<Message> receivedmessages) {
        this.receivedmessages = receivedmessages;
    }

    public List<Message> getSentmessages() {
        return sentmessages;
    }

    public void setSentmessages(List<Message> sentmessages) {
        this.sentmessages = sentmessages;
    }
}
