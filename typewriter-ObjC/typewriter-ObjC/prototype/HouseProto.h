//
//  HouseProto.h
//  typewriter-ObjC
//
//  Created by mrriddler on 2017/12/22.
//  Copyright © 2017年 typewriter. All rights reserved.
//

#import <Foundation/Foundation.h>

#pragma Typewriter(generate=HouseModel)
#pragma Typewriter(inherit=TypewriterBaseModel)
#pragma Typewriter(implement={NSObject})
#pragma Typewriter(constructOnly)

@interface HouseProto : NSObject

/*
 *  平米数
 */
@property (nonatomic, assign) UInt32 area;

/*
 *  是否学区房
 */
@property (nonatomic, assign) BOOL isSchoolDistrict;

/*
 *  位置
 */
@property (nonatomic, strong) NSString *location;

@end
