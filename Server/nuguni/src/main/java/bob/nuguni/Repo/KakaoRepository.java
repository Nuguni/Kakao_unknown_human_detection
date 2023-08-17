package bob.nuguni.Repo;

import bob.nuguni.domain.KakaoProfile;
import org.springframework.stereotype.Repository;

import java.util.List;

public interface KakaoRepository {
    List<KakaoProfile> getKakaoProfiles();

}
