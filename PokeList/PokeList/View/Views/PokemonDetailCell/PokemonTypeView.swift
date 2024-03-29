//
//  PokemonTypeView.swift
//  PokeList
//
//  Created by Emerson Victor on 21/11/19.
//  Copyright © 2019 emer. All rights reserved.
//

import UIKit

final class PokemonTypeView: UILabel {
    
    // MARK: - Initializers
    required init(frame: CGRect = .zero, type: PokemonType) {
        super.init(frame: frame)
        self.backgroundColor = UIColor(named: "\(type.rawValue)Type")
        self.layer.cornerRadius = 8
        self.layer.masksToBounds = true
        self.font = UIFont.systemFont(ofSize: 8, weight: .bold)
        self.textAlignment = .center
        self.textColor = .white
        self.text = type.rawValue.uppercased()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
