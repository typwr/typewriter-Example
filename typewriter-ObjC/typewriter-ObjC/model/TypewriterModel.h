//
//  TypewriterModel.h
//  typewriter-ObjC
//
//  Created by mrriddler on 2018/1/2.
//  Copyright © 2018年 typewriter. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol TypewriterModel

+ (NSDictionary *)customPropertyMapper;

+ (NSDictionary *)arrayGenericClassMapper;

+ (NSDictionary *)dictionaryGenericClassMapper;

- (BOOL)propertyMapWithJSON:(id)json;

- (void)propertyMapWithPrototype:(id)prototype mapping:(NSDictionary *)mapping;

- (nullable id)transformModelFromPrototype:(id)prototype;

@end

NS_ASSUME_NONNULL_END
