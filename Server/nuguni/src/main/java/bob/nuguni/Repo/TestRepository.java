package bob.nuguni.Repo;

import bob.nuguni.domain.KakaoProfile;
import bob.nuguni.domain.PhoneContact;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;

// @Repository
public class TestRepository implements KakaoPhoneRepository {
    @Override
    public List<KakaoProfile> getKakaoProfiles() {
        ArrayList<KakaoProfile> res = new ArrayList<>();

        res.add(new KakaoProfile(1, "신호"));
        res.add(new KakaoProfile(2, "숙이"));
        res.add(new KakaoProfile(3, "고동환"));
        res.add(new KakaoProfile(4, "제시"));
        res.add(new KakaoProfile(5, "김두한"));

        return res;
    }

    @Override
    public List<PhoneContact> getContacts() {
        ArrayList<PhoneContact> res = new ArrayList<>();

        res.add(new PhoneContact("010-1111-1111", "여신호"));
        res.add(new PhoneContact("010-2222-2222", "이정숙"));
        res.add(new PhoneContact("010-3333-3333", "고동환"));
        res.add(new PhoneContact("010-4444-4444", "노용훈"));
        res.add(new PhoneContact("010-5555-5555", "김두한"));

        return res;
    }

}
