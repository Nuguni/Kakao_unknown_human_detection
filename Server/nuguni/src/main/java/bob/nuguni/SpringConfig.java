package bob.nuguni;

import bob.nuguni.Repo.KakaoPhoneRepository;
import bob.nuguni.Repo.TestRepository;
import bob.nuguni.Service.KakaoPhoneService;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class SpringConfig {

    @Bean
    public KakaoPhoneRepository kakaoPhoneRepository() {
        return new TestRepository();
    }

    @Bean
    public KakaoPhoneService kakaoPhoneService() {
        return new KakaoPhoneService(kakaoPhoneRepository());
    }

}
