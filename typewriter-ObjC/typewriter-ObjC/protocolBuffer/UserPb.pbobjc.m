// Generated by the protocol buffer compiler.  DO NOT EDIT!
// source: UserPb.proto

// This CPP symbol can be defined to use imports that match up to the framework
// imports needed when using CocoaPods.
#if !defined(GPB_USE_PROTOBUF_FRAMEWORK_IMPORTS)
 #define GPB_USE_PROTOBUF_FRAMEWORK_IMPORTS 0
#endif

#if GPB_USE_PROTOBUF_FRAMEWORK_IMPORTS
 #import <Protobuf/GPBProtocolBuffers_RuntimeSupport.h>
#else
 #import "GPBProtocolBuffers_RuntimeSupport.h"
#endif

 #import "UserPb.pbobjc.h"
 #import "HousePb.pbobjc.h"
 #import "PetPb.pbobjc.h"
 #import "ClothesPb.pbobjc.h"
// @@protoc_insertion_point(imports)

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"

#pragma mark - UserPbRoot

@implementation UserPbRoot

// No extensions in the file and none of the imports (direct or indirect)
// defined extensions, so no need to generate +extensionRegistry.

@end

#pragma mark - UserPbRoot_FileDescriptor

static GPBFileDescriptor *UserPbRoot_FileDescriptor(void) {
  // This is called by +initialize so there is no need to worry
  // about thread safety of the singleton.
  static GPBFileDescriptor *descriptor = NULL;
  if (!descriptor) {
    GPB_DEBUG_CHECK_RUNTIME_VERSIONS();
    descriptor = [[GPBFileDescriptor alloc] initWithPackage:@""
                                                     syntax:GPBFileSyntaxProto3];
  }
  return descriptor;
}

#pragma mark - UserPb

@implementation UserPb

@dynamic resultMessage;
@dynamic resultCode;
@dynamic success;
@dynamic userName;
@dynamic favouriteSport;
@dynamic favouriteMovie;
@dynamic hasMarried;
@dynamic educationEnum;
@dynamic age;
@dynamic psychologicalAge;
@dynamic hasPet, pet;
@dynamic ownHousesArray, ownHousesArray_Count;
@dynamic wardrobes, wardrobes_Count;

typedef struct UserPb__storage_ {
  uint32_t _has_storage_[1];
  uint32_t age;
  int32_t psychologicalAge;
  NSString *resultMessage;
  NSString *resultCode;
  NSString *userName;
  NSString *favouriteSport;
  NSString *favouriteMovie;
  NSString *educationEnum;
  PetPb *pet;
  NSMutableArray *ownHousesArray;
  NSMutableDictionary *wardrobes;
} UserPb__storage_;

// This method is threadsafe because it is initially called
// in +initialize for each subclass.
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "resultMessage",
        .dataTypeSpecific.className = NULL,
        .number = UserPb_FieldNumber_ResultMessage,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(UserPb__storage_, resultMessage),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldTextFormatNameCustom),
        .dataType = GPBDataTypeString,
      },
      {
        .name = "resultCode",
        .dataTypeSpecific.className = NULL,
        .number = UserPb_FieldNumber_ResultCode,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(UserPb__storage_, resultCode),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldTextFormatNameCustom),
        .dataType = GPBDataTypeString,
      },
      {
        .name = "success",
        .dataTypeSpecific.className = NULL,
        .number = UserPb_FieldNumber_Success,
        .hasIndex = 2,
        .offset = 3,  // Stored in _has_storage_ to save space.
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeBool,
      },
      {
        .name = "userName",
        .dataTypeSpecific.className = NULL,
        .number = UserPb_FieldNumber_UserName,
        .hasIndex = 4,
        .offset = (uint32_t)offsetof(UserPb__storage_, userName),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldTextFormatNameCustom),
        .dataType = GPBDataTypeString,
      },
      {
        .name = "favouriteSport",
        .dataTypeSpecific.className = NULL,
        .number = UserPb_FieldNumber_FavouriteSport,
        .hasIndex = 5,
        .offset = (uint32_t)offsetof(UserPb__storage_, favouriteSport),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldTextFormatNameCustom),
        .dataType = GPBDataTypeString,
      },
      {
        .name = "favouriteMovie",
        .dataTypeSpecific.className = NULL,
        .number = UserPb_FieldNumber_FavouriteMovie,
        .hasIndex = 6,
        .offset = (uint32_t)offsetof(UserPb__storage_, favouriteMovie),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldTextFormatNameCustom),
        .dataType = GPBDataTypeString,
      },
      {
        .name = "hasMarried",
        .dataTypeSpecific.className = NULL,
        .number = UserPb_FieldNumber_HasMarried,
        .hasIndex = 7,
        .offset = 8,  // Stored in _has_storage_ to save space.
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldTextFormatNameCustom),
        .dataType = GPBDataTypeBool,
      },
      {
        .name = "educationEnum",
        .dataTypeSpecific.className = NULL,
        .number = UserPb_FieldNumber_EducationEnum,
        .hasIndex = 9,
        .offset = (uint32_t)offsetof(UserPb__storage_, educationEnum),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldTextFormatNameCustom),
        .dataType = GPBDataTypeString,
      },
      {
        .name = "age",
        .dataTypeSpecific.className = NULL,
        .number = UserPb_FieldNumber_Age,
        .hasIndex = 10,
        .offset = (uint32_t)offsetof(UserPb__storage_, age),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeUInt32,
      },
      {
        .name = "psychologicalAge",
        .dataTypeSpecific.className = NULL,
        .number = UserPb_FieldNumber_PsychologicalAge,
        .hasIndex = 11,
        .offset = (uint32_t)offsetof(UserPb__storage_, psychologicalAge),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldTextFormatNameCustom),
        .dataType = GPBDataTypeSInt32,
      },
      {
        .name = "pet",
        .dataTypeSpecific.className = GPBStringifySymbol(PetPb),
        .number = UserPb_FieldNumber_Pet,
        .hasIndex = 12,
        .offset = (uint32_t)offsetof(UserPb__storage_, pet),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeMessage,
      },
      {
        .name = "ownHousesArray",
        .dataTypeSpecific.className = GPBStringifySymbol(HousePb),
        .number = UserPb_FieldNumber_OwnHousesArray,
        .hasIndex = GPBNoHasBit,
        .offset = (uint32_t)offsetof(UserPb__storage_, ownHousesArray),
        .flags = (GPBFieldFlags)(GPBFieldRepeated | GPBFieldTextFormatNameCustom),
        .dataType = GPBDataTypeMessage,
      },
      {
        .name = "wardrobes",
        .dataTypeSpecific.className = GPBStringifySymbol(ClothesPb),
        .number = UserPb_FieldNumber_Wardrobes,
        .hasIndex = GPBNoHasBit,
        .offset = (uint32_t)offsetof(UserPb__storage_, wardrobes),
        .flags = GPBFieldMapKeyString,
        .dataType = GPBDataTypeMessage,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[UserPb class]
                                     rootClass:[UserPbRoot class]
                                          file:UserPbRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(UserPb__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
#if !GPBOBJC_SKIP_MESSAGE_TEXTFORMAT_EXTRAS
    static const char *extraTextFormatInfo =
        "\t\001\r\000\002\n\000\004\010\000\005\016\000\006\016\000\007\n\000\010\r\000\n\020\000\014\000ownHouses\000";
    [localDescriptor setupExtraTextInfo:extraTextFormatInfo];
#endif  // !GPBOBJC_SKIP_MESSAGE_TEXTFORMAT_EXTRAS
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end


#pragma clang diagnostic pop

// @@protoc_insertion_point(global_scope)