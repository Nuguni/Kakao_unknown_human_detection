package bob.nuguni.domain;

public class KakaoProfile {

    private long id;
    private String nameByMe;
    private String nameByOther;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getNameByMe() {
        return nameByMe;
    }

    public void setNameByMe(String nameByMe) {
        this.nameByMe = nameByMe;
    }

    public String getNameByOther() {
        return nameByOther;
    }

    public void setNameByOther(String nameByOther) {
        this.nameByOther = nameByOther;
    }
}
