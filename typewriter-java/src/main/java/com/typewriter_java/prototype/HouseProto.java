package com.typewriter_java.prototype;

import com.typewriter_java.annotation.RepeatableTypewriter;
import com.typewriter_java.annotation.Typewriter;
import com.typewriter_java.annotation.TypewriterOption;

@RepeatableTypewriter({
        @Typewriter(generate = "HouseModel"),
        @Typewriter(inherit = "TypewriterBaseModel"),
        @Typewriter(implement = {"Serializable"}),
        @Typewriter(TypewriterOption.constructOnly)
})
public class HouseProto {
    /**
     * 平米数
     */
    public Integer area;

    /**
     * 是否是学区房
     */
    public  Boolean isSchoolDistrict;

    /**
     * 位置
     */
    public  String location;
}