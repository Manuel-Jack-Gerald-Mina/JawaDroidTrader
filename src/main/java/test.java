import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.Ad;
import com.codeup.adlister.models.User;

public class test {
    public static void main(String[] args) {
        User user = DaoFactory.getUsersDao().findByUsername("mina");
        System.out.println(user.getUsername());

    }

}
