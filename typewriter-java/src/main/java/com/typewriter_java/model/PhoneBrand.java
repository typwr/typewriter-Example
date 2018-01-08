package com.typewriter_java.model;

public enum PhoneBrand {
    XIAOMI("小米"), APPLE("苹果"), HUAWEI("华为");

    private String name;

    PhoneBrand(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }

    static PhoneBrand fromJSONString(String src) {
        if ("0".equals(src)) {
            return PhoneBrand.XIAOMI;
        } else if ("1".equals(src)) {
            return PhoneBrand.APPLE;
        } else {
            return PhoneBrand.HUAWEI;
        }
    }

    static String toJSONString(PhoneBrand phoneBrand) {
        if (phoneBrand == XIAOMI) {
            return "0";
        } else if (phoneBrand == APPLE) {
            return "1";
        } else {
            return "2";
        }
    }
}