# typewriter-Example
本repo收藏着typewriter生成的代码样例，说了太多，直接上码。

#### Swift

以下是Swift的样例，首先是JSON数据交换格式文件：

```json
{
    "generate" : "WirelessChargingModel",
    "inherit" : "TypewriterBaseModel",
    "implement" : ["Error"],
    "options" : ["constructOnly"],
    "memberVariable" : {
        "length" : {
            "type" : "String",
            "rewrittenName" : "cableLength"
        },
        "manufacturerNumber" : {
            "type" : "String",
            "flatten" : "equipment.info"
        },
        "powerSource" : {"type" : "String"}
    }
}
```

typewriter将它翻译成：

```swift
public struct WirelessChargingModel: Error, Codable {
    enum CodingKeys: String, CodingKey {
        case length = "cableLength"
        case powerSource
        case equipment
    }
    enum equipmentCodingKeys: String, CodingKey {
        case info
    }
    enum infoCodingKeys: String, CodingKey {
        case manufacturerNumber
    }
    public let length: String
    public let powerSource: String
    public let manufacturerNumber: String
    static func modelWithJson(json: Data) throws -> WirelessChargingModel {
        let model = try JSONDecoder().decode(WirelessChargingModel.self, from: json)
        return model
    }
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.length = try container.decode(String.self, forKey: .length)
        self.powerSource = try container.decode(String.self, forKey: .powerSource)
        let equipmentContainer = try container.nestedContainer(keyedBy: equipmentCodingKeys.self, forKey: .equipment)
        let infoContainer = try equipmentContainer.nestedContainer(keyedBy: infoCodingKeys.self, forKey: .info)
        self.manufacturerNumber = try infoContainer.decode(String.self, forKey: .manufacturerNumber)
    }
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(length, forKey: .length)
        try container.encode(powerSource, forKey: .powerSource)
        var equipmentContainer = container.nestedContainer(keyedBy: equipmentCodingKeys.self, forKey: .equipment)
        var infoContainer = equipmentContainer.nestedContainer(keyedBy: infoCodingKeys.self, forKey: .info)
        try infoContainer.encode(manufacturerNumber, forKey: .manufacturerNumber)
    }
}
```

#### ObjC

以下是ObjC样例，首先是JSON数据交换格式：

```json
{
    "generate" : "WirelessChargingModel",
    "inherit" : "TypewriterBaseModel",
    "implement" : ["NSObject"],
    "options" : ["constructOnly"],
    "memberVariable" : {
        "length" : {
            "type" : "String",
            "rewrittenName" : "cableLength"
        },
        "manufacturerNumber" : {
            "type" : "String",
            "flatten" : "equipment.info"
        },
        "powerSource" : {"type" : "String"}
    }
}
```

typewriter将它翻译成：

```objective-c
@interface WirelessChargingModel : TypewriterBaseModel<NSObject>
@property (nonatomic, readonly, copy) NSString *length;
@property (nonatomic, readonly, copy) NSString *powerSource;
@property (nonatomic, readonly, copy) NSString *manufacturerNumber;
+ (nullable instancetype)modelWithJSON:(id)json;
- (nullable instancetype)initWithJSON:(id)json;
@end

@implementation WirelessChargingModel
+ (nullable instancetype)modelWithJSON:(id)json
{
    return [[self alloc] initWithJSON:json];
}
- (nullable instancetype)initWithJSON:(id)json
{
    NSParameterAssert(json);
    if (!(self = [super init])) {
        return nil;
    }
    if (![self propertyMapWithJSON:json]) {
        return nil;
    }
    return self;
}
+ (NSDictionary *)customPropertyMapper
{
    return @{@"manufacturerNumber" : @"equipment.info.manufacturerNumber",
             @"length" : @"cableLength"};
}
- (void)setLength:(NSString *)length
{
    _length = length;
}
- (void)setPowerSource:(NSString *)powerSource
{
    _powerSource = powerSource;
}
- (void)setManufacturerNumber:(NSString *)manufacturerNumber
{
    _manufacturerNumber = manufacturerNumber;
}
@end
```

接下来是ProtocolBuffer：

```objective-c
#pragma Typewriter(generate=UserPbModel)
#pragma Typewriter(inherit=TypewriterBaseModel)
#pragma Typewriter(implement={NSObject})
#pragma Typewriter(filter={success})
#pragma Typewriter(predicateFilter=SELF CONTAINS %@ OR SELF CONTAINS %@, result, _Count)
#pragma Typewriter(immutable)
#pragma Typewriter(rewritten={Rewritten(on=userName,name=name),\
                              Rewritten(on=educationEnum,name=education,type=EducationLevel),\
                              Rewritten(on=pet,type=$ref(PetPb.pbobjc.h)),\
                              Rewritten(on=ownHousesArray,name=houses,type=$ref(HousePb.pbobjc.h)),\
                              Rewritten(on=wardrobes,type=$ref(ClothesPb.pbobjc.h))})

@interface UserPb : GPBMessage

@property(nonatomic, readwrite, copy, null_resettable) NSString *resultMessage;

@property(nonatomic, readwrite, copy, null_resettable) NSString *resultCode;

@property(nonatomic, readwrite) BOOL success;

@property(nonatomic, readwrite, copy, null_resettable) NSString *userName;

@property(nonatomic, readwrite, copy, null_resettable) NSString *favouriteSport;

@property(nonatomic, readwrite, copy, null_resettable) NSString *favouriteMovie;

@property(nonatomic, readwrite) BOOL hasMarried;

@property(nonatomic, readwrite, copy, null_resettable) NSString *educationEnum;

@property(nonatomic, readwrite) uint32_t age;

@property(nonatomic, readwrite) int32_t psychologicalAge;

@property(nonatomic, readwrite, strong, null_resettable) PetPb *pet;
/** Test to see if @c pet has been set. */
@property(nonatomic, readwrite) BOOL hasPet;

@property(nonatomic, readwrite, strong, null_resettable) NSMutableArray<HousePb*> *ownHousesArray;
/** The number of items in @c ownHousesArray without causing the array to be created. */
@property(nonatomic, readonly) NSUInteger ownHousesArray_Count;

@property(nonatomic, readwrite, strong, null_resettable) NSMutableDictionary<NSString*, ClothesPb*> *wardrobes;
/** The number of items in @c wardrobes without causing the array to be created. */
@property(nonatomic, readonly) NSUInteger wardrobes_Count;

@end
```

typewriter将它翻译成：

```objective-c
@interface UserPbModel : TypewriterBaseModel<NSObject>
@property (nonatomic, readwrite, copy, nullable) NSString *objectId;
@property (nonatomic, readonly, copy) NSString *name;
@property (nonatomic, readonly, copy) NSString *favouriteSport;
@property (nonatomic, readonly, copy) NSString *favouriteMovie;
@property (nonatomic, readonly, assign) BOOL hasMarried;
@property (nonatomic, readonly, assign) EducationLevel education;
@property (nonatomic, readonly, assign) UInt32 age;
@property (nonatomic, readonly, assign) SInt32 psychologicalAge;
@property (nonatomic, readonly, strong) PetPbModel *pet;
@property (nonatomic, readonly, assign) BOOL hasPet;
@property (nonatomic, readonly, strong) NSArray<HousePbModel *> *houses;
@property (nonatomic, readonly, strong) NSDictionary<NSString *, ClothesPbModel *> *wardrobes;
+ (nullable instancetype)modelWithUserPb:(UserPb *)prototype objectId:(nullable NSString *)objectId;
- (nullable instancetype)initWithUserPb:(UserPb *)prototype objectId:(nullable NSString *)objectId;
- (instancetype)initWithUserPbModelBuilder:(UserPbModelBuilder *)builder;
- (instancetype)mergeWithBlock:(void(^)(UserPbModelBuilder *builder))block;
@end

@interface UserPbModelBuilder : TypewriterBaseModel
@property (nonatomic, readwrite, copy, nullable) NSString *objectId;
@property (nonatomic, readwrite, copy) NSString *name;
@property (nonatomic, readwrite, copy) NSString *favouriteSport;
@property (nonatomic, readwrite, copy) NSString *favouriteMovie;
@property (nonatomic, readwrite, assign) BOOL hasMarried;
@property (nonatomic, readwrite, assign) EducationLevel education;
@property (nonatomic, readwrite, assign) UInt32 age;
@property (nonatomic, readwrite, assign) SInt32 psychologicalAge;
@property (nonatomic, readwrite, strong) PetPbModel *pet;
@property (nonatomic, readwrite, assign) BOOL hasPet;
@property (nonatomic, readwrite, strong) NSArray<HousePbModel *> *houses;
@property (nonatomic, readwrite, strong) NSDictionary<NSString *, ClothesPbModel *> *wardrobes;
- (instancetype)initWithUserPbModel:(UserPbModel *)model;
- (UserPbModel *)build;
@end

@interface UserPbModel (Extension)
+ (void)unidirectionalDataflow:(UserPbModel *)model objectId:(NSString *)objectId;
@end

@implementation UserPbModel
- (instancetype)init UNAVAILABLE_ATTRIBUTE
{
    NSAssert(NO, @"please use designed initializer instead!");
    return nil;
}
+ (nullable instancetype)modelWithUserPb:(UserPb *)prototype objectId:(nullable NSString *)objectId
{
    return [[self alloc] initWithUserPb:prototype objectId:objectId];
}
- (nullable instancetype)initWithUserPb:(UserPb *)prototype objectId:(nullable NSString *)objectId
{
    NSParameterAssert(prototype);
    if (!(self = [super init])) {
        return nil;
    }
    [self propertyMapWithPrototype:prototype mapping:@{@"name" : @"userName",
                                                       @"favouriteSport" : @"favouriteSport",
                                                       @"favouriteMovie" : @"favouriteMovie",
                                                       @"hasMarried" : @"hasMarried",
                                                       @"age" : @"age",
                                                       @"psychologicalAge" : @"psychologicalAge",
                                                       @"hasPet" : @"hasPet"}];
    self->_objectId = objectId;
    self->_education = [prototype.educationEnum intValue];
    self->_pet = [self transformModelFromPrototype:prototype.pet];
    self->_houses = [self transformModelFromPrototype:prototype.ownHousesArray];
    self->_wardrobes = [self transformModelFromPrototype:prototype.wardrobes];
    [UserPbModel unidirectionalDataflow:self objectId:self.objectId];
    return self;
}
- (nullable id)transformModelFromPrototype:(id)prototype
{
    if (!prototype) {
        return nil;
    }
    if ([prototype isKindOfClass:[HousePb class]]) {
        HousePbModel * model = [HousePbModel modelWithHousePb:prototype];
        return model;
    }
    if ([prototype isKindOfClass:[ClothesPb class]]) {
        ClothesPbModel * model = [ClothesPbModel modelWithClothesPb:prototype objectId:self.objectId];
        return model;
    }
    if ([prototype isKindOfClass:[PetPb class]]) {
        PetPbModel * model = [PetPbModel modelWithPetPb:prototype];
        return model;
    }
    return [super transformModelFromPrototype:prototype];
}
- (instancetype)initWithUserPbModelBuilder:(UserPbModelBuilder *)builder
{
    NSParameterAssert(builder);
    if (!(self = [super init])) {
        return self;
    }
    [self propertyMapWithPrototype:builder mapping:@{@"objectId": @"objectId",
                                                     @"name": @"name",
                                                     @"favouriteSport": @"favouriteSport",
                                                     @"favouriteMovie": @"favouriteMovie",
                                                     @"hasMarried": @"hasMarried",
                                                     @"education": @"education",
                                                     @"age": @"age",
                                                     @"psychologicalAge": @"psychologicalAge",
                                                     @"pet": @"pet",
                                                     @"hasPet": @"hasPet",
                                                     @"houses": @"houses",
                                                     @"wardrobes": @"wardrobes"}];
    [UserPbModel unidirectionalDataflow:self objectId:self.objectId];
    return self;
}
- (instancetype)mergeWithBlock:(void(^)(UserPbModelBuilder *builder))block
{
    NSParameterAssert(block);
    UserPbModelBuilder *builder = [[UserPbModelBuilder alloc] initWithUserPbModel:self];
    block(builder);
    return [builder build];
}
@end

@implementation UserPbModelBuilder
- (instancetype)initWithUserPbModel:(UserPbModel *)model
{
    NSParameterAssert(model);
    if (!(self = [super init])) {
        return self;
    }
    [self propertyMapWithPrototype:model mapping:@{@"objectId": @"objectId",
                                                   @"name": @"name",
                                                   @"favouriteSport": @"favouriteSport",
                                                   @"favouriteMovie": @"favouriteMovie",
                                                   @"hasMarried": @"hasMarried",
                                                   @"education": @"education",
                                                   @"age": @"age",
                                                   @"psychologicalAge": @"psychologicalAge",
                                                   @"pet": @"pet",
                                                   @"hasPet": @"hasPet",
                                                   @"houses": @"houses",
                                                   @"wardrobes": @"wardrobes"}];
    return self;
}
- (UserPbModel *)build
{
    return [[UserPbModel alloc] initWithUserPbModelBuilder:self];
}
@end

@implementation UserPbModel (Extension)
+ (void)unidirectionalDataflow:(UserPbModel *)model objectId:(NSString *)objectId
{
    // unidirectional data flow
}
@end
```

#### Java

以下是Java的样例，独特的一点是与JSON相关的Annotation需要生成后手动标记添加，首先是JSON数据交换格式文件：

```json
{
    "generate" : "WirelessChargingModel",
    "inherit" : "TypewriterBaseModel",
    "implement" : ["Serializable"],
    "options" : ["constructOnly"],
    "memberVariable" : {
        "length" : {
            "type" : "String",
            "rewrittenName" : "cableLength",
            "annotation" : "@JSONField(name = \"cableLength\")"
        },
        "manufacturerNumber" : {
            "type" : "String",
            "flatten" : "equipment.info"
        },
        "powerSource" : {"type" : "String"}
    }
}
```

typewriter将它翻译成：

```java
public class WirelessChargingModel extends TypewriterBaseModel implements Serializable {
    @JSONField(name = "cableLength")
    public final String length;
    public final String powerSource;
    public final String manufacturerNumber;
    public static WirelessChargingModel modelWithJSON(String json) {
        return WirelessChargingModel.fieldsMapWithJSON(json, WirelessChargingModel.class);
    }
    @JSONCreator
    public WirelessChargingModel(@JSONField(name = "powerSource") String powerSource,
                                 @JSONField(name = "cableLength") String length,
                                 @JSONField(name = "manufacturerNumber") String manufacturerNumber) {
        this.length = length;
        this.powerSource = powerSource;
        this.manufacturerNumber = manufacturerNumber;
    }
    @SuppressWarnings("unused")
    public static Map<String, String> customFieldsMapper() {
        Map<String, String> mapper = new HashMap<>();
        mapper.put("manufacturerNumber", "equipment.info.manufacturerNumber");
        return mapper;
    }
    @Override
    public boolean equals(Object obj) {
        if (obj == this) return true;
        if (!(obj instanceof WirelessChargingModel)) return false;
        WirelessChargingModel other = (WirelessChargingModel) obj;
        return (length != null ? length.equals(other.length) : other.length == null)
               && (powerSource != null ? powerSource.equals(other.powerSource) : other.powerSource == null)
               && (manufacturerNumber != null ? manufacturerNumber.equals(other.manufacturerNumber) : other.manufacturerNumber == null);
    }
    @Override
    public int hashCode() {
        int result = super.hashCode() != 0 ? super.hashCode() : 1;
        result = result * 37 + (length != null ? length.hashCode() : 0);
        result = result * 37 + (powerSource != null ? powerSource.hashCode() : 0);
        result = result * 37 + (manufacturerNumber != null ? manufacturerNumber.hashCode() : 0);
        return result;
    }
}
```

接下来是wire：

```java
@RepeatableTypewriter({
        @Typewriter(generate = "UserPbModel"),
        @Typewriter(inherit = "TypewriterBaseModel"),
        @Typewriter(implement = {"Serializable"}),
        @Typewriter(filter = {"success"}),
        @Typewriter(predicateFilter = "SELF CONTAINS %@, result"),
        @Typewriter(TypewriterOption.immutable),
        @Typewriter(rewritten = {@Rewritten(on = "userName", name = "name"),
                @Rewritten(on = "educationEnum", name = "education", type = "EducationLevel"),
                @Rewritten(on = "pet", type = "$ref(PetPb.java)"),
                @Rewritten(on = "ownHouses", name = "houses", type = "$ref(HousePb.java)"),
                @Rewritten(on = "wardrobes", type = "$ref(ClothesPb.java)")})
})
public final class UserPb extends Message<UserPb, UserPb.Builder> {
  public static final ProtoAdapter<UserPb> ADAPTER = new ProtoAdapter_UserPb();

  private static final long serialVersionUID = 0L;

  public static final String DEFAULT_RESULTMESSAGE = "";

  public static final String DEFAULT_RESULTCODE = "";

  public static final Boolean DEFAULT_SUCCESS = false;

  public static final String DEFAULT_USERNAME = "";

  public static final String DEFAULT_FAVOURITESPORT = "";

  public static final String DEFAULT_FAVOURITEMOVIE = "";

  public static final Boolean DEFAULT_HASMARRIED = false;

  public static final String DEFAULT_EDUCATIONENUM = "";

  public static final Integer DEFAULT_AGE = 0;

  public static final Integer DEFAULT_PSYCHOLOGICALAGE = 0;

  @WireField(
      tag = 1,
      adapter = "com.squareup.wire.ProtoAdapter#STRING"
  )
  public final String resultMessage;

  @WireField(
      tag = 2,
      adapter = "com.squareup.wire.ProtoAdapter#STRING"
  )
  public final String resultCode;

  @WireField(
      tag = 3,
      adapter = "com.squareup.wire.ProtoAdapter#BOOL"
  )
  public final Boolean success;

  @WireField(
      tag = 4,
      adapter = "com.squareup.wire.ProtoAdapter#STRING"
  )
  public final String userName;

  @WireField(
      tag = 5,
      adapter = "com.squareup.wire.ProtoAdapter#STRING"
  )
  public final String favouriteSport;

  @WireField(
      tag = 6,
      adapter = "com.squareup.wire.ProtoAdapter#STRING"
  )
  public final String favouriteMovie;

  @WireField(
      tag = 7,
      adapter = "com.squareup.wire.ProtoAdapter#BOOL"
  )
  public final Boolean hasMarried;

  @WireField(
      tag = 8,
      adapter = "com.squareup.wire.ProtoAdapter#STRING"
  )
  public final String educationEnum;

  @WireField(
      tag = 9,
      adapter = "com.squareup.wire.ProtoAdapter#UINT32"
  )
  public final Integer age;

  @WireField(
      tag = 10,
      adapter = "com.squareup.wire.ProtoAdapter#SINT32"
  )
  public final Integer psychologicalAge;

  @WireField(
      tag = 11,
      adapter = "PetPb#ADAPTER"
  )
  public final PetPb pet;

  @WireField(
      tag = 12,
      adapter = "HousePb#ADAPTER",
      label = WireField.Label.REPEATED
  )
  public final List<HousePb> ownHouses;

  @WireField(
      tag = 13,
      keyAdapter = "com.squareup.wire.ProtoAdapter#STRING",
      adapter = "ClothesPb#ADAPTER"
  )
  public final Map<String, ClothesPb> wardrobes;
  ...
  }
...
```

typewriter将它翻译成：

```java
public class UserPbModel extends TypewriterBaseModel implements Serializable {
    public String objectId;
    public final String name;
    public final String favouriteSport;
    public final String favouriteMovie;
    public final boolean hasMarried;
    public final EducationLevel education;
    public final int age;
    public final int psychologicalAge;
    public final PetPbModel pet;
    public final List<HousePbModel> houses;
    public final Map<String, ClothesPbModel> wardrobes;
    @SuppressWarnings("unchecked")
    public UserPbModel(UserPb prototype, String objectId) {
        this.objectId = objectId;
        this.name = prototype.userName;
        this.favouriteSport = prototype.favouriteSport;
        this.favouriteMovie = prototype.favouriteMovie;
        this.hasMarried = prototype.hasMarried;
        this.age = prototype.age;
        this.psychologicalAge = prototype.psychologicalAge;
        this.education = EducationLevel.fromJSONString(prototype.educationEnum);
        this.pet = (PetPbModel)transformModelFromPrototype(prototype.pet);
        this.houses = (List<HousePbModel>)transformModelFromPrototype(prototype.ownHouses);
        this.wardrobes = (Map<String, ClothesPbModel>)transformModelFromPrototype(prototype.wardrobes);
        UserPbModel.unidirectionalDataflow(this, this.objectId);
    }
    public Object transformModelFromPrototype(Object prototype) {
        if (prototype == null) {
            return null;
        }
        if (prototype instanceof ClothesPb) {
            return new ClothesPbModel((ClothesPb)prototype, this.objectId);
        }
        if (prototype instanceof HousePb) {
            return new HousePbModel((HousePb)prototype);
        }
        if (prototype instanceof PetPb) {
            return new PetPbModel((PetPb)prototype);
        }
        return super.transformModelFromPrototype(prototype);
    }
    public UserPbModel(String objectId,
                       String name,
                       String favouriteSport,
                       String favouriteMovie,
                       boolean hasMarried,
                       EducationLevel education,
                       int age,
                       int psychologicalAge,
                       PetPbModel pet,
                       List<HousePbModel> houses,
                       Map<String, ClothesPbModel> wardrobes) {
        this.objectId = objectId;
        this.name = name;
        this.favouriteSport = favouriteSport;
        this.favouriteMovie = favouriteMovie;
        this.hasMarried = hasMarried;
        this.education = education;
        this.age = age;
        this.psychologicalAge = psychologicalAge;
        this.pet = pet;
        this.houses = houses;
        this.wardrobes = wardrobes;
        UserPbModel.unidirectionalDataflow(this, this.objectId);
    }
    public Builder builder() {
        Builder builder = new Builder();
        builder.objectId = objectId;
        builder.name = name;
        builder.favouriteSport = favouriteSport;
        builder.favouriteMovie = favouriteMovie;
        builder.hasMarried = hasMarried;
        builder.education = education;
        builder.age = age;
        builder.psychologicalAge = psychologicalAge;
        builder.pet = pet;
        builder.houses = houses;
        builder.wardrobes = wardrobes;
        return builder;
    }
    public static void unidirectionalDataflow(UserPbModel model, String objectId) {
        // unidirectional data flow
    }
    @Override
    public boolean equals(Object obj) {
        if (obj == this) return true;
        if (!(obj instanceof UserPbModel)) return false;
        UserPbModel other = (UserPbModel) obj;
        return (objectId != null ? objectId.equals(other.objectId) : other.objectId == null)
               && (name != null ? name.equals(other.name) : other.name == null)
               && (favouriteSport != null ? favouriteSport.equals(other.favouriteSport) : other.favouriteSport == null)
               && (favouriteMovie != null ? favouriteMovie.equals(other.favouriteMovie) : other.favouriteMovie == null)
               && Boolean.compare(hasMarried, other.hasMarried) == 1
               && (education != null ? education.equals(other.education) : other.education == null)
               && Integer.compare(age, other.age) == 1
               && Integer.compare(psychologicalAge, other.psychologicalAge) == 1
               && (pet != null ? pet.equals(other.pet) : other.pet == null)
               && (houses != null ? houses.equals(other.houses) : other.houses == null)
               && (wardrobes != null ? wardrobes.equals(other.wardrobes) : other.wardrobes == null);
    }
    @Override
    public int hashCode() {
        int result = super.hashCode() != 0 ? super.hashCode() : 1;
        result = result * 37 + (objectId != null ? objectId.hashCode() : 0);
        result = result * 37 + (name != null ? name.hashCode() : 0);
        result = result * 37 + (favouriteSport != null ? favouriteSport.hashCode() : 0);
        result = result * 37 + (favouriteMovie != null ? favouriteMovie.hashCode() : 0);
        result = result * 37 + Boolean.valueOf(hasMarried).hashCode();
        result = result * 37 + (education != null ? education.hashCode() : 0);
        result = result * 37 + Integer.valueOf(age).hashCode();
        result = result * 37 + Integer.valueOf(psychologicalAge).hashCode();
        result = result * 37 + (pet != null ? pet.hashCode() : 0);
        result = result * 37 + (houses != null ? houses.hashCode() : 0);
        result = result * 37 + (wardrobes != null ? wardrobes.hashCode() : 0);
        return result;
    }
    public class Builder {
        public String objectId;
        public String name;
        public String favouriteSport;
        public String favouriteMovie;
        public boolean hasMarried;
        public EducationLevel education;
        public int age;
        public int psychologicalAge;
        public PetPbModel pet;
        public List<HousePbModel> houses;
        public Map<String, ClothesPbModel> wardrobes;
        public Builder objectId(String objectId) {
            this.objectId = objectId;
            return this;
        }
        public Builder name(String name) {
            this.name = name;
            return this;
        }
        public Builder favouriteSport(String favouriteSport) {
            this.favouriteSport = favouriteSport;
            return this;
        }
        public Builder favouriteMovie(String favouriteMovie) {
            this.favouriteMovie = favouriteMovie;
            return this;
        }
        public Builder hasMarried(boolean hasMarried) {
            this.hasMarried = hasMarried;
            return this;
        }
        public Builder education(EducationLevel education) {
            this.education = education;
            return this;
        }
        public Builder age(int age) {
            this.age = age;
            return this;
        }
        public Builder psychologicalAge(int psychologicalAge) {
            this.psychologicalAge = psychologicalAge;
            return this;
        }
        public Builder pet(PetPbModel pet) {
            this.pet = pet;
            return this;
        }
        public Builder houses(List<HousePbModel> houses) {
            this.houses = houses;
            return this;
        }
        public Builder wardrobes(Map<String, ClothesPbModel> wardrobes) {
            this.wardrobes = wardrobes;
            return this;
        }
        public UserPbModel build() {
            return new UserPbModel(objectId,
                                   name,
                                   favouriteSport,
                                   favouriteMovie,
                                   hasMarried,
                                   education,
                                   age,
                                   psychologicalAge,
                                   pet,
                                   houses,
                                   wardrobes);
        }
    }
}
```

