// Generated by the protocol buffer compiler.  DO NOT EDIT!
// source: PetPb.proto

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

 #import "PetPb.pbobjc.h"
// @@protoc_insertion_point(imports)

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"

#pragma mark - PetPbRoot

@implementation PetPbRoot

// No extensions in the file and no imports, so no need to generate
// +extensionRegistry.

@end

#pragma mark - PetPbRoot_FileDescriptor

static GPBFileDescriptor *PetPbRoot_FileDescriptor(void) {
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

#pragma mark - PetPb

@implementation PetPb

@dynamic success;
@dynamic name;
@dynamic limbs;
@dynamic color;

typedef struct PetPb__storage_ {
  uint32_t _has_storage_[1];
  NSString *name;
  NSString *limbs;
  NSString *color;
} PetPb__storage_;

// This method is threadsafe because it is initially called
// in +initialize for each subclass.
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "success",
        .dataTypeSpecific.className = NULL,
        .number = PetPb_FieldNumber_Success,
        .hasIndex = 0,
        .offset = 1,  // Stored in _has_storage_ to save space.
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeBool,
      },
      {
        .name = "name",
        .dataTypeSpecific.className = NULL,
        .number = PetPb_FieldNumber_Name,
        .hasIndex = 2,
        .offset = (uint32_t)offsetof(PetPb__storage_, name),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "limbs",
        .dataTypeSpecific.className = NULL,
        .number = PetPb_FieldNumber_Limbs,
        .hasIndex = 3,
        .offset = (uint32_t)offsetof(PetPb__storage_, limbs),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "color",
        .dataTypeSpecific.className = NULL,
        .number = PetPb_FieldNumber_Color,
        .hasIndex = 4,
        .offset = (uint32_t)offsetof(PetPb__storage_, color),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[PetPb class]
                                     rootClass:[PetPbRoot class]
                                          file:PetPbRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(PetPb__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end


#pragma clang diagnostic pop

// @@protoc_insertion_point(global_scope)