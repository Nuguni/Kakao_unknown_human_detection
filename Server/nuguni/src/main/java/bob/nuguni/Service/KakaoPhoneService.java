package bob.nuguni.Service;

import bob.nuguni.Repo.KakaoPhoneRepository;
import bob.nuguni.domain.KakaoProfile;
import bob.nuguni.domain.PhoneContact;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

// @Service
public class KakaoPhoneService {

    private final KakaoPhoneRepository repository;

    private static ArrayList<KakaoProfile> match_profiles = new ArrayList<>();
    private static ArrayList<KakaoProfile> ambiguous_profiles = new ArrayList<>();
    private static ArrayList<KakaoProfile> nomatch_profiles = new ArrayList<>();


    @Autowired
    public KakaoPhoneService(KakaoPhoneRepository repository) {
        this.repository = repository;
        sortKakaoProfiles(this.repository);
    }

    public List<KakaoProfile> getKakaoList() {
        return repository.getKakaoProfiles();
    }

    public List<PhoneContact> getContactList() {
        return repository.getContacts();
    }

    public ArrayList<KakaoProfile> getMatchProfiles() {
        return match_profiles;
    }

    public ArrayList<KakaoProfile> getAmbiguousProfiles() {
        return ambiguous_profiles;
    }

    public ArrayList<KakaoProfile> getNoMatchProfiles() {
        return nomatch_profiles;
    }


    public static void sortKakaoProfiles(KakaoPhoneRepository repository) {
        System.out.println("sortKakaoProfiles called");

        ArrayList<KakaoProfile> kakaoProfiles = new ArrayList<>(repository.getKakaoProfiles());
        ArrayList<PhoneContact> phoneContacts = new ArrayList<>(repository.getContacts());

        // 기준에 따라 kakao 프로필을 분류
        for(KakaoProfile profile: kakaoProfiles) {
            boolean isMatch = false;
            boolean isAmbig = false;

            String kakaoName = profile.getName();

            for(PhoneContact phone: phoneContacts) {
                String phoneName = phone.getName();

                if(kakaoName.equals(phoneName)) {
                    isMatch = true;
                    break;
                }
                else if (isOneCharMatch(kakaoName, phoneName)) {
                    isAmbig = true;

                }

            }

            // 프로필 필터링
            if(isMatch)
                match_profiles.add(profile);
            else if (isAmbig)
                ambiguous_profiles.add(profile);
            else
                nomatch_profiles.add(profile);

        }

    }


    private static boolean isOneCharMatch(String str1, String str2) {
//        if (str1.length() != str2.length()) {
//            return false;
//        }
//        int diffCount = 0;
        // int length = Math.min(str1.length(), str2.length());
        for(int i=0 ; i<str1.length() ; i++) {
            for(int j=0 ; j<str2.length() ; j++) {
                if (str1.charAt(i) == str2.charAt(j))
                    return true;
            }
        }
        return false;
        // return diffCount == 1;
    }


}
