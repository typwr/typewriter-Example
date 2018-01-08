//
//  Test.m
//  typewriter-ObjC
//
//  Created by mrriddler on 2017/12/20.
//  Copyright © 2017年 typewriter. All rights reserved.
//

#import "Test.h"
#import "PetProto.h"
#import "HouseProto.h"
#import "ClothesProto.h"
#import "UserProto.h"
#import "PetModel.h"
#import "HouseModel.h"
#import "ClothesModel.h"
#import "UserModel.h"
#import "PhoneModel.h"

@implementation Test

+ (void)test
{
    NSString *jsonStr = [NSString stringWithContentsOfURL:[[NSBundle mainBundle].bundleURL URLByAppendingPathComponent:@"test.json"] encoding:NSUTF8StringEncoding error:nil];
    jsonStr = [[jsonStr stringByReplacingOccurrencesOfString:@"\n" withString:@""] stringByReplacingOccurrencesOfString:@" " withString:@""];
    
    PhoneModel *phoneModel = [PhoneModel modelWithJSON:jsonStr objectId:@"100"];
    NSLog(@"%@", phoneModel);

    PetProto *petProto = [[PetProto alloc] init];
    petProto.name = @"mad dog";
    petProto.limbs = @"4";
    petProto.color = @"#979961";
    
    ClothesProto *clothesProto = [[ClothesProto alloc] init];
    clothesProto.type = @"jacket";
    clothesProto.price = 2799;
    clothesProto.brand = @"Lee";
    
    HouseProto *houseProto = [[HouseProto alloc] init];
    houseProto.area = 400;
    houseProto.isSchoolDistrict = YES;
    houseProto.location = @"4 Jingshan Front St, Dongcheng, Beijing, China";
    
    UserProto *userProto = [[UserProto alloc] init];
    userProto.resultMessage = @"rpc return valid";
    userProto.resultCode = @"1000";
    userProto.success = YES;
    userProto.userInfo = @{@"sign" : @"valid"};
    userProto.userName = @"Michael Tyson";
    userProto.favouriteMovie = @"hangover2";
    userProto.favouriteSport = @"boxing";
    userProto.hasMarried = YES;
    userProto.educationEnum = @"1";
    userProto.age = 51;
    userProto.psychologicalAge = 18;
    userProto.birthDate = [NSDate dateWithTimeIntervalSince1970:1513738593];
    userProto.phone = jsonStr;
    userProto.pet = petProto;
    userProto.ownHouses = @[houseProto];
    userProto.wardrobes = @{@"second floor" : @[@{@"bedroom" : @{@"against wall" : clothesProto}}]};
    
    UserModel *userModel = [UserModel modelWithUserProto:userProto objectId:@"1"];
    NSLog(@"%@", userModel);
}

@end
