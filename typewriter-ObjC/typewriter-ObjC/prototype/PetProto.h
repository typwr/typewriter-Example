//
//  PetProto.h
//  typewriter-ObjC
//
//  Created by mrriddler on 2017/12/22.
//  Copyright © 2017年 typewriter. All rights reserved.
//

#import <Foundation/Foundation.h>

#pragma Typewriter(generate=PetModel)
#pragma Typewriter(inherit=TypewriterBaseModel)
#pragma Typewriter(implement={NSObject})
#pragma Typewriter(initializerPreprocess)
#pragma Typewriter(filter=success)
#pragma Typewriter(rewritten=Rewritten(on=limbs,type=UInt32))

@interface PetProto : NSObject

@property (nonatomic, assign) BOOL success;

@property (nonatomic, strong) NSString *name;

@property (nonatomic, strong) NSString *limbs;

@property (nonatomic, strong) NSString *color;

@end
