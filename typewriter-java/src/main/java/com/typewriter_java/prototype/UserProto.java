package com.typewriter_java.prototype;

import com.typewriter_java.annotation.Rewritten;
import com.typewriter_java.annotation.RepeatableTypewriter;
import com.typewriter_java.annotation.Typewriter;
import com.typewriter_java.annotation.TypewriterOption;

import java.util.Date;
import java.util.List;
import java.util.Map;

@RepeatableTypewriter({
        @Typewriter(generate = "UserModel"),
        @Typewriter(inherit = "TypewriterBaseModel"),
        @Typewriter(implement = {"Serializable"}),
        @Typewriter(filter = {"success","userInfo"}),
        @Typewriter(predicateFilter = "SELF CONTAINS %@, result"),
        @Typewriter(TypewriterOption.immutable),
        @Typewriter(rewritten = {@Rewritten(on = "userName", name = "name"),
                @Rewritten(on = "educationEnum", name = "education", type = "EducationLevel"),
                @Rewritten(on = "phone", type = "$ref(PhoneModel.json)"),
                @Rewritten(on = "pet", type = "$ref(PetProto.java)"),
                @Rewritten(on = "ownHouses", name = "houses", type = "$ref(HouseProto.java)"),
                @Rewritten(on = "wardrobes", type = "$ref(ClothesProto.java)")})
})
public class UserProto {
    public String resultMessage;

    public String resultCode;

    public Boolean success;

    public Map userInfo;

    public String userName;

    public String favouriteSport;

    public String favouriteMovie;

    public Boolean hasMarried ;

    public String educationEnum;

    public Integer age;

    public Integer psychologicalAge;

    public Date birthDate;

    public String phone;

    public PetProto pet;

    public List<HouseProto> ownHouses;

    public Map<String, List<Map<String, Map<String, ClothesProto>>>> wardrobes;
}