package bob.nuguni.Service;

import bob.nuguni.Repo.KakaoRepository;
import bob.nuguni.Repo.PhoneRepository;
import bob.nuguni.domain.KakaoProfile;
import bob.nuguni.domain.PhoneContact;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class CompareService {

    private final KakaoRepository kakaoRepository;
    private final PhoneRepository phoneRepository;

    @Autowired
    public CompareService(KakaoRepository kakaoRepository, PhoneRepository phoneRepository) {
        this.kakaoRepository = kakaoRepository;
        this.phoneRepository = phoneRepository;
    }

    public List<KakaoProfile> getMatchedProfiles() {

        ArrayList<KakaoProfile> kakaoProfiles = new ArrayList<>(kakaoRepository.getKakaoProfiles());
        ArrayList<PhoneContact> phoneContacts = new ArrayList<>(phoneRepository.getContacts());

        ArrayList<KakaoProfile> compareResult = new ArrayList<>(); // 이거 람다식으로 만들도록 수정.

        for(KakaoProfile profile:kakaoProfiles) {
            System.out.println(profile.getNameByMe());
            System.out.println(profile.getNameByOther());
        }

        for(PhoneContact contact:phoneContacts) {
            System.out.println(contact.getName());
        }

        return null;
    }


}
