package com.typewriter_java.model;

public enum HeadPhoneBrand {
    BOSE("bose"), BEATS("beats");

    private String name;

    HeadPhoneBrand(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }

    static HeadPhoneBrand fromJSONString(String src) {
        if ("0".equals(src)) {
            return HeadPhoneBrand.BOSE;
        } else {
            return HeadPhoneBrand.BEATS;
        }
    }

    static String toJSONString(HeadPhoneBrand headPhoneBrand) {
        if (headPhoneBrand == BOSE) {
            return "0";
        } else  {
            return "1";
        }
    }
}