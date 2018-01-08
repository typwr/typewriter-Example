//
//  ClothesProto.h
//  typewriter-ObjC
//
//  Created by mrriddler on 2017/12/22.
//  Copyright © 2017年 typewriter. All rights reserved.
//

#import <Foundation/Foundation.h>

#pragma Typewriter(generate=ClothesModel)
#pragma Typewriter(inherit=TypewriterBaseModel)
#pragma Typewriter(implement={NSObject})
#pragma Typewriter({commentOut,unidirectionDataflow})

@interface ClothesProto : NSObject

/*
 *  衣服类型
 */
@property (nonatomic, strong) NSString *type;

/*
 *  价格
 */
@property (nonatomic, assign) UInt32 price;

/*
 *  品牌
 */
@property (nonatomic, strong) NSString *brand;

@end
