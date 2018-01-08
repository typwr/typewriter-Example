// Generated by the protocol buffer compiler.  DO NOT EDIT!
// source: ClothesPb.proto

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

 #import "ClothesPb.pbobjc.h"
// @@protoc_insertion_point(imports)

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"

#pragma mark - ClothesPbRoot

@implementation ClothesPbRoot

// No extensions in the file and no imports, so no need to generate
// +extensionRegistry.

@end

#pragma mark - ClothesPbRoot_FileDescriptor

static GPBFileDescriptor *ClothesPbRoot_FileDescriptor(void) {
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

#pragma mark - ClothesPb

@implementation ClothesPb

@dynamic type;
@dynamic price;
@dynamic brand;

typedef struct ClothesPb__storage_ {
  uint32_t _has_storage_[1];
  uint32_t price;
  NSString *type;
  NSString *brand;
} ClothesPb__storage_;

// This method is threadsafe because it is initially called
// in +initialize for each subclass.
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "type",
        .dataTypeSpecific.className = NULL,
        .number = ClothesPb_FieldNumber_Type,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(ClothesPb__storage_, type),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "price",
        .dataTypeSpecific.className = NULL,
        .number = ClothesPb_FieldNumber_Price,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(ClothesPb__storage_, price),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeUInt32,
      },
      {
        .name = "brand",
        .dataTypeSpecific.className = NULL,
        .number = ClothesPb_FieldNumber_Brand,
        .hasIndex = 2,
        .offset = (uint32_t)offsetof(ClothesPb__storage_, brand),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeString,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[ClothesPb class]
                                     rootClass:[ClothesPbRoot class]
                                          file:ClothesPbRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(ClothesPb__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    NSAssert(descriptor == nil, @"Startup recursed!");
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end


#pragma clang diagnostic pop

// @@protoc_insertion_point(global_scope)
