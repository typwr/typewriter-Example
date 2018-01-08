//
//  WirelessChargingModel.swift
//  Autogenerated by typewriter
//
//  Generation Date On 2018/01/08
//  Version: 1.0.0

import Foundation

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
