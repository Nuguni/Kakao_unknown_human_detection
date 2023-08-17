package bob.nuguni.Service;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;

import static org.junit.jupiter.api.Assertions.*;

class KakaoPhoneServiceTest {

    private final KakaoPhoneService service;

    @Autowired
    public KakaoPhoneServiceTest(KakaoPhoneService service) {
        this.service = service;
    }

    @Test
    void getMatchProfiles() {



    }

    @Test
    void getAmbiguousProfiles() {
    }

    @Test
    void getNoMatchProfiles() {
    }

}