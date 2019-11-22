//
//  CellActionButton.swift
//  PokeList
//
//  Created by Emerson Victor on 20/11/19.
//  Copyright © 2019 emer. All rights reserved.
//

import UIKit

final class CellActionButton: UIButton {
    // MARK: - Components
    lazy var title: UILabel = {
        let view = UILabel()
        return view
    }()
    
    // MARK: - Button state
    var pokemonIsSaved: Bool {
        didSet {
            self.layer.borderWidth = 1
            self.layer.cornerRadius = 5
            self.layer.masksToBounds = true
            
            if self.pokemonIsSaved {
                self.title.text = "REMOVE"
                self.title.textColor = .white
                self.title.font = UIFont.systemFont(ofSize: 12, weight: .bold)
                self.backgroundColor = .systemRed
                self.layer.borderColor = UIColor.systemRed.cgColor
            } else {
                self.title.text = "ADD"
                self.title.textColor = .systemBlue
                self.title.font = UIFont.systemFont(ofSize: 12, weight: .regular)
                self.backgroundColor = .clear
                self.layer.borderColor = UIColor.systemBlue.cgColor
            }
        }
    }
    
    // MARK: - Initializers
    required init(frame: CGRect = .zero, pokemonIsSaved saved: Bool) {
        self.pokemonIsSaved = saved
        super.init(frame: frame)
        defer {
            self.pokemonIsSaved = saved
            self.setupView()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CellActionButton: CodeView {
    func buildViewHierarchy() {
        self.addSubview(self.title)
    }
    
    func setupConstratins() {
        self.title.snp.makeConstraints { (make) in
            make.edges.equalToSuperview().inset(UIEdgeInsets(top: 8,
                                                             left: 16,
                                                             bottom: 8,
                                                             right: 16))
        }
    }
    
    func setupAdditionalConfiguration() {
        
    }
}
