package bob.nuguni.domain;

public class KakaoProfile {

    private long id;
    private String uuid;
    private String name;
    private String profile_thumbnail_image;


    public KakaoProfile(long id, String uuid, String name, String profile_thumbnail_image) {
        this.id = id;
        this.uuid=uuid;
        this.name = name;
        this.profile_thumbnail_image=profile_thumbnail_image;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

}
