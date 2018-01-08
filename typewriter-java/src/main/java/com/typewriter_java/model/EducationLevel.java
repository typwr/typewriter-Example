package com.typewriter_java.model;

public enum EducationLevel {
    EDUCATIONPRIMARYSCHOOLLEVEL("小学"), EDUCATIONJUNIORHIGHSCHOOLLEVEL("初中"), EDUCATIONSENIORSCHOOLLEVEL("高中"), EDUCATIONUNIVERSITYLEVEL("大学");

    private String name;

    EducationLevel(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }

    static EducationLevel fromJSONString(String src) {
        if ("0".equals(src)) {
            return EducationLevel.EDUCATIONPRIMARYSCHOOLLEVEL;
        } else if ("1".equals(src)) {
            return EducationLevel.EDUCATIONJUNIORHIGHSCHOOLLEVEL;
        } else if ("2".equals(src)) {
            return EducationLevel.EDUCATIONSENIORSCHOOLLEVEL;
        } else {
            return EducationLevel.EDUCATIONUNIVERSITYLEVEL;
        }
    }

    static String toJSONString(EducationLevel educationLevel) {
        if (educationLevel == EDUCATIONPRIMARYSCHOOLLEVEL) {
            return "0";
        } else if (educationLevel == EDUCATIONJUNIORHIGHSCHOOLLEVEL) {
            return "1";
        } else if (educationLevel == EDUCATIONSENIORSCHOOLLEVEL) {
            return "2";
        } else {
            return "3";
        }
    }
}