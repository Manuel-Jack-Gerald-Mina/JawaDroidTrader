import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.Ad;
import com.codeup.adlister.models.User;

public class test {
    public static void main(String[] args) {
        String userid= "1";
        long id = Long.parseLong(userid);
        User user = DaoFactory.getUsersDao().findByUserId(id);
        System.out.println(user.getUsername());

    }

}
