//
//  UIViewExtension.swift
//  PokeList
//
//  Created by Emerson Victor on 23/11/19.
//  Copyright © 2019 emer. All rights reserved.
//

import UIKit

extension UIView {
    func hide() {
        self.alpha = 0
        self.isHidden = true
    }
    
    func show() {
        self.isHidden = false
        self.alpha = 1
    }
}
