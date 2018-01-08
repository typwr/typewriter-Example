package com.typewriter_java.model;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONPath;

import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class TypewriterBaseModel {

    public static <T> T fieldsMapWithJSON(String json, Class<T> clazz) {
        if (json == null || clazz == null) {
            return null;
        }

        try {
            Method customMapperMethod = clazz.getMethod("customFieldsMapper");
            Object customMapper = customMapperMethod.invoke(null);
            if (!(customMapper instanceof Map)) {
                return JSON.parseObject(json, clazz);
            }
            @SuppressWarnings("unchecked")
            Map<String, String> castMapper = (Map)customMapper;
            com.alibaba.fastjson.JSONObject jsonObj = com.alibaba.fastjson.JSONObject.parseObject(json);
            for (Map.Entry<String, String> entry : castMapper.entrySet()) {
                String customPath = "$." + entry.getKey();
                String originalPath = "$." + entry.getValue();
                if (JSONPath.contains(jsonObj, originalPath)) {
                    JSONPath.set(jsonObj, customPath, JSONPath.eval(jsonObj, originalPath));
                    JSONPath.remove(jsonObj, originalPath);
                }
            }

            json = jsonObj.toJSONString();
            return JSON.parseObject(json, clazz);
        } catch (NoSuchMethodException e) {
            return JSON.parseObject(json, clazz);
        } catch (IllegalAccessException e) {
            return JSON.parseObject(json, clazz);
        } catch (java.lang.reflect.InvocationTargetException e) {
            return JSON.parseObject(json, clazz);
        } catch (Exception e) {
            return null;
        }
    }

    Object transformModelFromPrototype(Object prototype) {
        if (prototype == null) {
            return null;
        }
        if (prototype instanceof List) {
            @SuppressWarnings("unchecked")
            List<Object> castPrototype = (List)prototype;
            List<Object> modelArr = new ArrayList<>();
            for (Object element : castPrototype) {
                Object transformed = transformModelFromPrototype(element);
                if (transformed != null) {
                    modelArr.add(transformed);
                }
            }
            return modelArr;
        }
        if (prototype instanceof Map) {
            @SuppressWarnings("unchecked")
            Map<Object, Object> castPrototype = (Map)prototype;
            Map<Object, Object> modelMap = new HashMap<>();
            for (Map.Entry<Object, Object> entry : castPrototype.entrySet()) {
                Object transformed = transformModelFromPrototype(entry.getValue());
                if (transformed != null) {
                    modelMap.put(entry.getKey(), transformed);
                }
            }
            return modelMap;
        }

        return null;
    }
}