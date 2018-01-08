//
//  TypewriterBaseModel.m
//  typewriter-ObjC
//
//  Created by mrriddler on 2018/1/2.
//  Copyright © 2018年 typewriter. All rights reserved.
//

#import "TypewriterBaseModel.h"
#import "YYModel.h"

@implementation TypewriterBaseModel

- (BOOL)propertyMapWithJSON:(id)json
{
    return [self yy_modelSetWithJSON:json];
}

+ (NSDictionary *)modelCustomPropertyMapper {
    return [self customPropertyMapper];
}

+ (NSDictionary *)modelContainerPropertyGenericClass {
    NSMutableDictionary *res = [NSMutableDictionary dictionary];
    if ([self arrayGenericClassMapper]) {
        [res addEntriesFromDictionary:[self arrayGenericClassMapper]];
    }
    if ([self dictionaryGenericClassMapper]) {
        [res addEntriesFromDictionary:[self dictionaryGenericClassMapper]];
    }
    return res;
}

+ (NSDictionary *)customPropertyMapper {
    return nil;
}

+ (NSDictionary *)arrayGenericClassMapper {
    return nil;
}

+ (NSDictionary *)dictionaryGenericClassMapper {
    return nil;
}

- (void)propertyMapWithPrototype:(id)prototype mapping:(NSDictionary *)mapping
{
    if (!prototype || !mapping) {
        return;
    }
    for (NSString *key in [mapping allKeys]) {
        NSString *propertyName = mapping[key];
        @try {
            id value = [prototype valueForKey:propertyName];
            if (value == nil || [value isKindOfClass:[NSNull class]]) {
                continue;
            }
            [self setValue:value forKey:key];
        }
        @catch (NSException *exception) {
            //somthing is wrong
        }
    }
}

- (id)transformModelFromPrototype:(id)prototype
{
    if(!prototype) {
        return nil;
    }
    if([prototype isKindOfClass:[NSArray class]]) {
        NSArray *castPrototype = (NSArray *)prototype;
        NSMutableArray *modelArr = [NSMutableArray array];
        for (id element in castPrototype) {
            id transformed = [self transformModelFromPrototype:element];
            if(transformed) {
                [modelArr addObject:transformed];
            }
        }
        return [modelArr copy];
    }
    if([prototype isKindOfClass:[NSDictionary class]]) {
        NSDictionary *castPrototype = (NSDictionary *)prototype;
        NSMutableDictionary *modelDic = [NSMutableDictionary dictionary];
        for (id key in castPrototype.allKeys) {
            id value = castPrototype[key];
            id transformed = [self transformModelFromPrototype:value];
            if(transformed) {
                modelDic[key] = transformed;
            }
        }
        return [modelDic copy];
    }
    return nil;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    //set undefined key
}

- (id)valueForUndefinedKey:(NSString *)key
{
    //get undefined key
    return nil;
}

@end
