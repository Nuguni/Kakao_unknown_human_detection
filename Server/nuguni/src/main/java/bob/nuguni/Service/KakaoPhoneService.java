package bob.nuguni.Service;

import bob.nuguni.Repo.KakaoPhoneRepository;
//import bob.nuguni.domain.KakaoProfile;
//import bob.nuguni.domain.PhoneContact;
import bob.nuguni.domain.KakaoProfile;
import bob.nuguni.domain.PhoneContact;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class KakaoPhoneService {

    private final KakaoPhoneRepository repository;

    private List<KakaoProfile> match_profiles;
    private List<KakaoProfile> ambiguous_profiles;
    private List<KakaoProfile> nomatch_profiles;

    @Autowired
    public KakaoPhoneService(KakaoPhoneRepository repository) {
        this.repository = repository;
    }

    public List<KakaoProfile> getKakaoList() {
        return repository.getKakaoProfiles();
    }

    public List<PhoneContact> getContactList(List<PhoneContact> contacts) {
        return repository.getContacts(contacts);
    }

    public List<KakaoProfile> getMatchProfiles(List<PhoneContact> contacts) {
        if (match_profiles == null) {
            sortKakaoProfiles(contacts);
        }
        return match_profiles;
    }

    public List<KakaoProfile> getAmbiguousProfiles(List<PhoneContact> contacts) {
        if (ambiguous_profiles == null) {
            sortKakaoProfiles(contacts);
        }
        return ambiguous_profiles;
    }

    public List<KakaoProfile> getNoMatchProfiles(List<PhoneContact> contacts) {
        if (nomatch_profiles == null) {
            sortKakaoProfiles(contacts);
        }
        return nomatch_profiles;
    }

    private void sortKakaoProfiles(List<PhoneContact> contacts) {
        System.out.println("sortKakaoProfiles called");

        match_profiles = new ArrayList<>();
        ambiguous_profiles = new ArrayList<>();
        nomatch_profiles = new ArrayList<>();

        List<KakaoProfile> kakaoProfiles = repository.getKakaoProfiles();
        List<PhoneContact> phoneContacts = repository.getContacts(contacts);

        for (KakaoProfile profile : kakaoProfiles) {
            boolean isMatch = false;
            boolean isAmbig = false;
            String kakaoName = profile.getName();

            for (PhoneContact phone : phoneContacts) {
                String phoneName = phone.getName();

                if (kakaoName.equals(phoneName)) {
                    isMatch = true;
                    break;
                } else if (isOneCharMatch(kakaoName, phoneName)) {
                    isAmbig = true;
                }
            }

            if (isMatch) {
                match_profiles.add(profile);
            } else if (isAmbig) {
                ambiguous_profiles.add(profile);
            } else {
                nomatch_profiles.add(profile);
            }
        }
    }

    private boolean isOneCharMatch(String str1, String str2) {
        for (int i = 0; i < str1.length(); i++) {
            for (int j = 0; j < str2.length(); j++) {
                if (str1.charAt(i) == str2.charAt(j)) {
                    return true;
                }
            }
        }
        return false;
    }
}
