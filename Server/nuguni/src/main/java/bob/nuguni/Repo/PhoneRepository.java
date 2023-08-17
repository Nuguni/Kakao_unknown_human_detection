package bob.nuguni.Repo;

import bob.nuguni.domain.PhoneContact;

import java.util.List;

public interface PhoneRepository {

    List<PhoneContact> getContacts();

}
