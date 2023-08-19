package bob.nuguni.Repo;

import bob.nuguni.domain.KakaoProfile;
import bob.nuguni.domain.PhoneContact;

import java.util.List;

public interface KakaoPhoneRepository {

    List<KakaoProfile> getKakaoProfiles();
    List<PhoneContact> getContacts();


    List<PhoneContact> getContacts(List<PhoneContact> inputList);
}
