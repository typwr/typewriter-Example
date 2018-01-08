//
//  UserProto.h
//  typewriter-ObjC
//
//  Created by mrriddler on 2017/12/22.
//  Copyright © 2017年 typewriter. All rights reserved.
//

#import <Foundation/Foundation.h>

@class PetProto;
@class HouseProto;
@class ClothesProto;

#pragma Typewriter(generate=UserModel)
#pragma Typewriter(inherit=TypewriterBaseModel)
#pragma Typewriter(implement={NSObject})
#pragma Typewriter(filter={success,userInfo})
#pragma Typewriter(predicateFilter=SELF CONTAINS %@, result)
#pragma Typewriter(immutable)
#pragma Typewriter(rewritten={Rewritten(on=userName,name=name),\
                              Rewritten(on=educationEnum,name=education,type=EducationLevel),\
                              Rewritten(on=phone,type=$ref(PhoneModel.json)),\
                              Rewritten(on=pet,type=$ref(PetProto.h)),\
                              Rewritten(on=ownHouses,name=houses,type=$ref(HouseProto.h)),\
                              Rewritten(on=wardrobes,type=$ref(ClothesProto.h))})

@interface UserProto : NSObject

@property (nonatomic, strong) NSString *resultMessage;

@property (nonatomic, strong) NSString *resultCode;

@property (nonatomic, assign) BOOL success;

@property (nonatomic, strong) NSDictionary *userInfo;

@property (nonatomic, strong) NSString *userName;

@property (nonatomic, strong)NSString* favouriteSport;

@property (nonatomic, strong) NSString * favouriteMovie ;

@property (nonatomic, assign) BOOL hasMarried;

@property (nonatomic, strong) NSString *educationEnum;

@property (nonatomic, assign) UInt32 age;

@property (nonatomic, assign)SInt32  psychologicalAge ;

@property (nonatomic, strong) NSDate *birthDate;

@property (nonatomic, strong) NSString *phone;

@property (nonatomic, strong) PetProto *pet;

@property (nonatomic, strong) NSArray<HouseProto *> *ownHouses;

@property (nonatomic, strong) NSDictionary<NSString *, NSArray<NSDictionary<NSString *, NSDictionary<NSString *, ClothesProto *> *> *> *> *wardrobes;

@end
