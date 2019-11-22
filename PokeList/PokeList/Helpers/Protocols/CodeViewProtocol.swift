//
//  CodeViewProtocol.swift
//  PokeList
//
//  Created by Emerson Victor on 20/11/19.
//  Copyright © 2019 emer. All rights reserved.
//

import Foundation

protocol CodeView {
    func buildViewHierarchy()
    func setupConstratins()
    func setupAdditionalConfiguration()
    func setupView()
}

extension CodeView {
    func setupView() {
        self.buildViewHierarchy()
        self.setupConstratins()
        self.setupAdditionalConfiguration()
    }
}
