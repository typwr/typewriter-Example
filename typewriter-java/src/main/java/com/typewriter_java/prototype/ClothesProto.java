package com.typewriter_java.prototype;

import com.typewriter_java.annotation.RepeatableTypewriter;
import com.typewriter_java.annotation.Typewriter;
import com.typewriter_java.annotation.TypewriterOption;

@RepeatableTypewriter({
        @Typewriter(generate = "ClothesModel"),
        @Typewriter(inherit = "TypewriterBaseModel"),
        @Typewriter(implement = {"Serializable"}),
        @Typewriter({TypewriterOption.commentOut, TypewriterOption.unidirectionDataflow})
})
public class ClothesProto {
    /**
     * 衣服类型
     */
    public String type;

    /**
     * 价格
     */
    public Integer price;

    /**
     * 品牌
     */
    public String brand;
}