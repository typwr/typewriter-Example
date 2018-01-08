//
//  PhoneModel.swift
//  Autogenerated by typewriter
//
//  Generation Date On 2018/01/08
//  Version: 1.0.0

import Foundation

public struct PhoneModel: Error, Codable {
    enum CodingKeys: String, CodingKey {
        case accessory
        case apps
        case price
        case equipment
    }
    enum accessoryCodingKeys: String, CodingKey {
        case headPhone
        case charger
    }
    enum equipmentCodingKeys: String, CodingKey {
        case info
    }
    enum infoCodingKeys: String, CodingKey {
        case brand = "phoneBrand"
    }
    public var objectId: String?
    public let headPhone: [HeadPhoneModel]
    public let apps: [String: AppModel]
    public let charger: WirelessChargingModel
    public let price: String
    public let brand: PhoneBrand
    static func modelWithJson(json: Data, objectId: String?) throws -> PhoneModel {
        var model = try JSONDecoder().decode(PhoneModel.self, from: json)
        if let objectId = objectId {
            model.objectId = objectId
        }
        PhoneModel.unidirectionalDataflow(model: model, objectId: model.objectId)
        return model
    }
    public init(varModel: PhoneModelVariable) {
        objectId = varModel.objectId
        headPhone = varModel.headPhone
        apps = varModel.apps
        charger = varModel.charger
        price = varModel.price
        brand = varModel.brand
        PhoneModel.unidirectionalDataflow(model: self, objectId: varModel.objectId)
    }
    public func merge(varModel: ((inout PhoneModelVariable) -> ())) {
        var mutableModel = PhoneModelVariable(letModel: self)
        varModel(&mutableModel)
        _ = mutableModel.letModel()
    }
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let accessoryContainer = try container.nestedContainer(keyedBy: accessoryCodingKeys.self, forKey: .accessory)
        self.apps = try container.decode([String: AppModel].self, forKey: .apps)
        self.price = try container.decode(String.self, forKey: .price)
        let equipmentContainer = try container.nestedContainer(keyedBy: equipmentCodingKeys.self, forKey: .equipment)
        self.headPhone = try accessoryContainer.decode([HeadPhoneModel].self, forKey: .headPhone)
        self.charger = try accessoryContainer.decode(WirelessChargingModel.self, forKey: .charger)
        let infoContainer = try equipmentContainer.nestedContainer(keyedBy: infoCodingKeys.self, forKey: .info)
        self.brand = try infoContainer.decode(PhoneBrand.self, forKey: .brand)
    }
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        var accessoryContainer = container.nestedContainer(keyedBy: accessoryCodingKeys.self, forKey: .accessory)
        try container.encode(apps, forKey: .apps)
        try container.encode(price, forKey: .price)
        var equipmentContainer = container.nestedContainer(keyedBy: equipmentCodingKeys.self, forKey: .equipment)
        try accessoryContainer.encode(headPhone, forKey: .headPhone)
        try accessoryContainer.encode(charger, forKey: .charger)
        var infoContainer = equipmentContainer.nestedContainer(keyedBy: infoCodingKeys.self, forKey: .info)
        try infoContainer.encode(brand, forKey: .brand)
    }
}

public struct PhoneModelVariable {
    public var objectId: String?
    public var headPhone: [HeadPhoneModel]
    public var apps: [String: AppModel]
    public var charger: WirelessChargingModel
    public var price: String
    public var brand: PhoneBrand
    public init(letModel: PhoneModel) {
        objectId = letModel.objectId
        headPhone = letModel.headPhone
        apps = letModel.apps
        charger = letModel.charger
        price = letModel.price
        brand = letModel.brand
    }
    public func letModel() -> PhoneModel {
        return PhoneModel(varModel: self)
    }
}

public extension PhoneModel {
    public static func unidirectionalDataflow(model: PhoneModel, objectId: String?) {
        // unidirectional data flow
    }
}
