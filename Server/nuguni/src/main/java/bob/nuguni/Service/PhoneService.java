package bob.nuguni.Service;

import bob.nuguni.Repo.PhoneRepository;
import bob.nuguni.domain.PhoneContact;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PhoneService {

    private final PhoneRepository repository;

    @Autowired
    public PhoneService(PhoneRepository repository) {
        this.repository = repository;
    }

    public List<PhoneContact> getContactList() {
        return repository.getContacts();
    }

}
