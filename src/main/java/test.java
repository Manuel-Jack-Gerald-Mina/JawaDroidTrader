import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.Ad;
import com.codeup.adlister.models.Category;
import com.codeup.adlister.models.Picture;
import com.codeup.adlister.models.User;

import java.util.List;

public class test {
    public static void main(String[] args) {
/*
long test = 2L;
        Picture pic = DaoFactory.getPicturesDao().findByPictureId(test);

        System.out.println(pic.getUrl()); find pic by id works
        */
        /* find by user id
        long test = 5;
        Picture pic = DaoFactory.getPicturesDao().findByUserId(test);

        System.out.println(pic.getUrl());
        test successful.
        */

/*   List<Ad> list = DaoFactory.getAdsDao().Search("AdTitle","rifle"); // test empty with "rrrrr"

   for(Ad ad: list){
       System.out.println(ad.getTitle());
       System.out.println(ad.getPrice());
       System.out.println(ad.getDescription());
       System.out.println(ad.getId());
   } //did exactly what i wanted first try


        if(list.isEmpty()){
     System.out.println("none");
 }*/

//        Ad ad = DaoFactory.getAdsDao().findByAdId(1);
//        String[] categories = new String[]{"Armor","Droid","Live Creature"};
//        DaoFactory.getAdsDao().updateCategories(1,categories);

    }
}
