//
//  TypeTests.swift
//  PokeListTests
//
//  Created by Emerson Victor on 12/09/19.
//  Copyright © 2019 emer. All rights reserved.
//

import XCTest
import UIKit

class TypeTests: XCTestCase {

    func testInitializer() {
        let normalType = Type(name: "Normal", color: TypeColors.normal)
        
        XCTAssertEqual(normalType.name, "Normal", "Initilized type name was incorret.")
        XCTAssertEqual(normalType.color, TypeColors.normal, "Initilized type color was incorret.")
    }

    func testJsonInitializer() {
    }
}
