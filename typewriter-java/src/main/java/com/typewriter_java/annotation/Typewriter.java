package com.typewriter_java.annotation;


import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Retention(RetentionPolicy.SOURCE)
@Target({ElementType.TYPE, ElementType.METHOD, ElementType.FIELD})
public @interface Typewriter {

    TypewriterOption[] value() default {};

    String generate() default "";

    String inherit() default "";

    String[] implement() default {};

    String[] filter() default {};

    String predicateFilter() default "";

    Rewritten[] rewritten() default {};
}