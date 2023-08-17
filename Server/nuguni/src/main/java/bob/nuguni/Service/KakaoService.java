package bob.nuguni.Service;

import bob.nuguni.Repo.KakaoRepository;
import bob.nuguni.domain.KakaoProfile;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class KakaoService {

    private final KakaoRepository repository;

    @Autowired
    public KakaoService(KakaoRepository repository) {
        this.repository = repository;
    }

    public List<KakaoProfile> getKakaoList() {
        return repository.getKakaoProfiles();
    }

}
