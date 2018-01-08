package com.typewriter_java.test;

import android.content.Context;

import com.typewriter_java.model.PhoneModel;
import com.typewriter_java.model.UserModel;
import com.typewriter_java.prototype.ClothesProto;
import com.typewriter_java.prototype.HouseProto;
import com.typewriter_java.prototype.PetProto;
import com.typewriter_java.prototype.UserProto;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Test {
    public static void test(Context ctx) {

        String json = null;
        try {
            InputStream is = ctx.getAssets().open("test.json");
            int size = is.available();
            byte[] buffer = new byte[size];
            is.read(buffer);
            is.close();
            json = new String(buffer, "UTF-8").replaceAll("\n", "").replaceAll(" ", "");
        } catch (IOException e) {
            System.out.print(e);
        }

        if (json != null) {
            PhoneModel phoneModel = PhoneModel.modelWithJSON(json, null);
            System.out.print(phoneModel);
        }

        PetProto petProto = new PetProto();
        petProto.name = "mad dog";
        petProto.limbs = "4";
        petProto.color = "#979961";

        ClothesProto clothesProto = new ClothesProto();
        clothesProto.type = "jacket";
        clothesProto.price = 2799;
        clothesProto.brand = "Lee";

        HouseProto houseProto = new HouseProto();
        houseProto.area = 400;
        houseProto.isSchoolDistrict = true;
        houseProto.location = "4 Jingshan Front St, Dongcheng, Beijing, China";

        UserProto userProto = new UserProto();
        userProto.resultMessage = "rpc return valid";
        userProto.resultCode = "1000";
        userProto.success = true;
        userProto.userName = "Michael Tyson";
        userProto.favouriteMovie = "hangover2";
        userProto.favouriteSport = "boxing";
        userProto.hasMarried = true;
        userProto.educationEnum = "1";
        userProto.age = 51;
        userProto.psychologicalAge = 18;
        userProto.birthDate = new Date(1513738593);
        userProto.phone = json;
        userProto.pet = petProto;

        List<HouseProto> ownHouses = new ArrayList<>();
        ownHouses.add(houseProto);
        userProto.ownHouses = ownHouses;

        Map<String, ClothesProto> againstWall = new HashMap<>();
        againstWall.put("against wall", clothesProto);

        Map<String, Map<String, ClothesProto>> bedroomMap = new HashMap<>();
        bedroomMap.put("bedroom", againstWall);

        List<Map<String, Map<String, ClothesProto>>> bedroomList = new ArrayList<>();
        bedroomList.add(bedroomMap);

        Map<String, List<Map<String, Map<String, ClothesProto>>>> wardrobes = new HashMap<>();
        wardrobes.put("second floor", bedroomList);
        userProto.wardrobes = wardrobes;

        UserModel userModel = new UserModel(userProto, "1");
        System.out.print(userModel);
    }
}