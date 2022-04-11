import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.Ad;

public class test {
    public static void main(String[] args) {
        Ad ad = DaoFactory.getAdsDao().findByAdId(3L);
        DaoFactory.getAdsDao().deleteAd(ad);
    }
}
