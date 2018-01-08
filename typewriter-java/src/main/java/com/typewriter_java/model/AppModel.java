//
//  AppModel.java
//  Autogenerated by typewriter
//
//  Generation Date On 2018/01/08
//  Version: 1.0.0

package com.typewriter_java.model;

import com.alibaba.fastjson.annotation.JSONField;

import java.io.Serializable;

public class AppModel extends TypewriterBaseModel implements Serializable {
    public String type;
    @JSONField(name = "company")
    public String producer;
    public static AppModel modelWithJSON(String json) {
        return AppModel.fieldsMapWithJSON(json, AppModel.class);
    }
    @Override
    public boolean equals(Object obj) {
        if (obj == this) return true;
        if (!(obj instanceof AppModel)) return false;
        AppModel other = (AppModel) obj;
        return (type != null ? type.equals(other.type) : other.type == null)
               && (producer != null ? producer.equals(other.producer) : other.producer == null);
    }
    @Override
    public int hashCode() {
        int result = super.hashCode() != 0 ? super.hashCode() : 1;
        result = result * 37 + (type != null ? type.hashCode() : 0);
        result = result * 37 + (producer != null ? producer.hashCode() : 0);
        return result;
    }
}
