package com.typewriter_java.prototype;

import com.typewriter_java.annotation.RepeatableTypewriter;
import com.typewriter_java.annotation.Rewritten;
import com.typewriter_java.annotation.Typewriter;
import com.typewriter_java.annotation.TypewriterOption;

@RepeatableTypewriter({
        @Typewriter(generate = "PetModel"),
        @Typewriter(inherit = "TypewriterBaseModel"),
        @Typewriter(implement = {"Serializable"}),
        @Typewriter(TypewriterOption.initializerPreprocess),
        @Typewriter(filter = "success"),
        @Typewriter(rewritten = @Rewritten(on = "limbs", type = "UInt32"))
})
public class PetProto {
    public Boolean success;

    public String name;

    public String limbs;

    public String color;
}