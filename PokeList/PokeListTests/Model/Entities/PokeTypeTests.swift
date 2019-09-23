//
//  TypeTests.swift
//  PokeListTests
//
//  Created by Emerson Victor on 12/09/19.
//  Copyright © 2019 emer. All rights reserved.
//

import XCTest
import UIKit

class PoekTypeTests: XCTestCase {

    // MARK: - Initializer
    func testInitializer() {
        for type in TypeColor.types.keys {
            let typeObject = PokeType(name: type)
            
            XCTAssertEqual(typeObject.name, type, "Initilized type name was incorret.")
            XCTAssertEqual(typeObject.color, TypeColor.types[type], "Initilized type color was incorret.")
        }
    }
}
