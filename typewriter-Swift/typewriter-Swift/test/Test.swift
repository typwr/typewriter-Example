//
//  Test.swift
//  typewriter-Swift
//
//  Created by mrriddler on 2017/12/25.
//  Copyright © 2017年 typewriter. All rights reserved.
//

import Foundation

struct Test {
    static func test() {
        do {
            var jsonStr = try String(contentsOf: Bundle.main.bundleURL.appendingPathComponent("test.json"), encoding: .utf8)
            jsonStr = jsonStr.replacingOccurrences(of: "\n", with: "").replacingOccurrences(of: " ", with: "")
            let jsonData = jsonStr.data(using: .utf8)
            let phone = try PhoneModel.modelWithJson(json: jsonData!, objectId: "1")
            print(phone)
        } catch let e as NSError {
            print(e)
        } catch {
        }
    }
}
