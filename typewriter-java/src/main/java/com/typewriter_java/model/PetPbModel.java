//
//  PetPbModel.java
//  Autogenerated by typewriter
//
//  Generation Date On 2018/01/08
//  Version: 1.0.0

package com.typewriter_java.model;

import com.typewriter_java.protocolBuffer.PetPb;

import java.io.Serializable;

public class PetPbModel extends TypewriterBaseModel implements Serializable {
    public String name;
    public int limbs;
    public String color;
    @SuppressWarnings("unchecked")
    public PetPbModel(PetPb prototype) {
        PetPb preprocess = initializerPreprocess(prototype);
        this.name = preprocess.name;
        this.color = preprocess.color;
        this.limbs = Integer.parseInt(preprocess.limbs);
    }
    public PetPb initializerPreprocess(PetPb preprocess) {
        return preprocess;
    }
    @Override
    public boolean equals(Object obj) {
        if (obj == this) return true;
        if (!(obj instanceof PetPbModel)) return false;
        PetPbModel other = (PetPbModel) obj;
        return (name != null ? name.equals(other.name) : other.name == null)
               && Integer.compare(limbs, other.limbs) == 1
               && (color != null ? color.equals(other.color) : other.color == null);
    }
    @Override
    public int hashCode() {
        int result = super.hashCode() != 0 ? super.hashCode() : 1;
        result = result * 37 + (name != null ? name.hashCode() : 0);
        result = result * 37 + Integer.valueOf(limbs).hashCode();
        result = result * 37 + (color != null ? color.hashCode() : 0);
        return result;
    }
}
