package bob.nuguni.Repo;

import bob.nuguni.domain.KakaoProfile;
import bob.nuguni.domain.PhoneContact;

import java.util.ArrayList;
import java.util.List;

// @Repository
public class TestRepository implements KakaoPhoneRepository {
    @Override
    public List<KakaoProfile> getKakaoProfiles() {
        ArrayList<KakaoProfile> res = new ArrayList<>();

        res.add(new KakaoProfile(2939412,"0000001","진소정","image1.jpeg" ));
        res.add(new KakaoProfile(3856843,"0000002","권정태","image2.jpeg" ));
        res.add(new KakaoProfile(7121233,"0000003","이현우","image3.jpeg" ));
        res.add(new KakaoProfile(6334562,"0000004","여신호","image4.jpeg" ));
        res.add(new KakaoProfile(10002472,"0000005","황제현","image5.jpeg" ));
        res.add(new KakaoProfile(3887210,"0000006","송진우","image6.jpeg" ));
        res.add(new KakaoProfile(8802542,"0000007","박민용","image7.jpeg" ));
        res.add(new KakaoProfile(1293556,"0000008","한결같은남자CG","image8.jpeg" ));
        res.add(new KakaoProfile(3000212,"0000009","조규상","image9.jpeg" ));
        res.add(new KakaoProfile(9004728,"0000010","이제훈","image10.jpeg" ));
        res.add(new KakaoProfile(131246,"0000011","진영","image11.jpeg" ));
        res.add(new KakaoProfile(2436476,"0000012","이제훈","image12.jpeg" ));
        res.add(new KakaoProfile(13542728,"0000013","진현준","image13.jpeg" ));
        res.add(new KakaoProfile(1123556,"0000014","Piy","image14.jpeg" ));
        res.add(new KakaoProfile(5234552,"0000015","찬호형","image15.jpeg" ));
        res.add(new KakaoProfile(4969432,"0000016","주찬","image16.jpeg" ));
        res.add(new KakaoProfile(1293859,"0000017","진하형_뱃져","image17.jpeg" ));
        res.add(new KakaoProfile(3495849,"0000018","찬의","image18.jpeg" ));
        res.add(new KakaoProfile(603962,"0000019","최보현","image19.jpeg" ));
        res.add(new KakaoProfile(3050313,"0000020","창서","image20.jpeg" ));
        res.add(new KakaoProfile(3959313,"0000021","최상민","image21.jpeg" ));
        res.add(new KakaoProfile(4431452,"0000022","최세윤","image22.jpeg" ));
        res.add(new KakaoProfile(9004728,"0000023","최승준","image23.jpeg" ));
        res.add(new KakaoProfile(3040692,"0000024","코인_이주화","image24.jpeg" ));
        res.add(new KakaoProfile(123553,"0000025","태주","image25.jpeg" ));
        res.add(new KakaoProfile(3634864,"0000026","표예나","image26.jpeg" ));
        res.add(new KakaoProfile(123553,"0000027","하동훈","image27.jpeg" ));
        res.add(new KakaoProfile(2634363,"0000028","김혜영","image28.jpeg" ));
        res.add(new KakaoProfile(3905031,"0000029","한상익","image29.jpeg" ));
        res.add(new KakaoProfile(4646421,"0000030","해준","image30.jpeg" ));
        res.add(new KakaoProfile(9395905,"0000031","노형준","image31.jpeg" ));
        res.add(new KakaoProfile(9131222,"0000032","황재선","image32.jpeg" ));
        res.add(new KakaoProfile(6434353,"0000033","하석호","image33.jpeg" ));
        res.add(new KakaoProfile(1315165,"0000034","세윤아범","image34.jpeg" ));



        return res;
    }

    @Override
    public List<PhoneContact> getContacts() {
        return null;
    }


    @Override
    public List<PhoneContact> getContacts(List<PhoneContact> inputList) {
        List<PhoneContact> res = new ArrayList<>();

        for (PhoneContact contact : inputList) {
            res.add(new PhoneContact(contact.getPhoneNumber(), contact.getName()));
        }

        return res;
    }

}
