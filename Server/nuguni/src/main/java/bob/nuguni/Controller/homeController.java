package bob.nuguni.Controller;

import bob.nuguni.Service.KakaoPhoneService;
import bob.nuguni.domain.KakaoProfile;
import bob.nuguni.domain.PhoneContact;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class homeController {

    private final KakaoPhoneService service;

    @Autowired
    public homeController(KakaoPhoneService service) {
        this.service = service;
    }

    @GetMapping("/")
    public String home() {

/*        ArrayList<KakaoProfile> matchProfiles = (ArrayList<KakaoProfile>) service.getMatchProfiles();
        ArrayList<KakaoProfile> ambiguousProfiles = (ArrayList<KakaoProfile>) service.getAmbiguousProfiles();
        ArrayList<KakaoProfile> noMatchProfiles = (ArrayList<KakaoProfile>) service.getNoMatchProfiles();

        System.out.println("match profiles:");
        for(KakaoProfile profile:matchProfiles)
            System.out.println(profile.getName());

        System.out.println("ambig profiles:");
        for(KakaoProfile profile:ambiguousProfiles)
            System.out.println(profile.getName());

        System.out.println("not match profiles:");
        for(KakaoProfile profile:noMatchProfiles)
            System.out.println(profile.getName());*/

        return "hello";

    }

    @PostMapping("/contacts")
    public ResponseEntity<Map<String, Object>> receiveContacts(@RequestBody List<PhoneContact> contacts) {
        // Now use the contacts list
        List<PhoneContact> receivedContacts = service.getContactList(contacts);



        ArrayList<KakaoProfile> matchProfiles = (ArrayList<KakaoProfile>) service.getMatchProfiles(receivedContacts);
        ArrayList<KakaoProfile> ambiguousProfiles = (ArrayList<KakaoProfile>) service.getAmbiguousProfiles(receivedContacts);
        ArrayList<KakaoProfile> noMatchProfiles = (ArrayList<KakaoProfile>) service.getNoMatchProfiles(receivedContacts);

        System.out.println("match profiles:");
        for(KakaoProfile profile:matchProfiles)
            System.out.println(profile.getName());

        System.out.println("ambig profiles:");
        for(KakaoProfile profile:ambiguousProfiles)
            System.out.println(profile.getName());

        System.out.println("not match profiles:");
        for(KakaoProfile profile:noMatchProfiles)
            System.out.println(profile.getName());
        // Do something with receivedContacts...
        // ... for instance, you could print them:
        for (PhoneContact contact : receivedContacts) {
            System.out.println(contact.getName() + " : " + contact.getPhoneNumber());
        }
        Map<String, Object> response = new HashMap<>();
        response.put("matchProfiles", matchProfiles);
        response.put("ambiguousProfiles", ambiguousProfiles);
        response.put("noMatchProfiles", noMatchProfiles);
        response.put("receivedContacts", receivedContacts);

        return new ResponseEntity<>(response, HttpStatus.OK);
    }

}
