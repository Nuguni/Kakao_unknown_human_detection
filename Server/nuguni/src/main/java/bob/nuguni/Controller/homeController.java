package bob.nuguni.Controller;

import bob.nuguni.Service.KakaoPhoneService;
import bob.nuguni.domain.KakaoProfile;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.ArrayList;

@Controller
public class homeController {

    private final KakaoPhoneService service;

    @Autowired
    public homeController(KakaoPhoneService service) {
        this.service = service;
    }

    @GetMapping("/")
    public String home() {

        ArrayList<KakaoProfile> matchProfiles = service.getMatchProfiles();
        ArrayList<KakaoProfile> ambiguousProfiles = service.getAmbiguousProfiles();
        ArrayList<KakaoProfile> noMatchProfiles = service.getNoMatchProfiles();

        System.out.println("match profiles:");
        for(KakaoProfile profile:matchProfiles)
            System.out.println(profile.getName());

        System.out.println("ambig profiles:");
        for(KakaoProfile profile:ambiguousProfiles)
            System.out.println(profile.getName());

        System.out.println("not match profiles:");
        for(KakaoProfile profile:noMatchProfiles)
            System.out.println(profile.getName());

        return "hello";

    }

}
