//
//  PokemonDetailCell.swift
//  PokeList
//
//  Created by Emerson Victor on 20/11/19.
//  Copyright © 2019 emer. All rights reserved.
//

import UIKit
import SnapKit

final class PokemonDetailCell: UITableViewCell {

    // MARK: - Components
    lazy var pokemonImage: UIImageView = {
        let view = UIImageView(image: UIImage(named: "ditto"))
        view.backgroundColor = .systemGray6
        view.layer.cornerRadius = 15
        view.layer.masksToBounds = true
        return view
    }()
    
    lazy var name: UILabel = {
        let view = UILabel(frame: .zero)
        view.text = "Ditto"
        view.textColor = .label
        view.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        return view
    }()
    
    lazy var hp: UILabel = {
        let view = UILabel(frame: .zero)
        view.text = "48 HP"
        view.textColor = .secondaryLabel
        view.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        return view
    }()
    
    lazy var actionButtton: CellActionButton = {
        let button = CellActionButton(pokemonIsSaved: false)
        button.addTarget(self,
                         action: #selector(didTouchActionButton),
                         for: .touchUpInside)
        return button
    }()
    
    lazy var primaryType: PokemonTypeView = {
        let view = PokemonTypeView(type: .normal)
        return view
    }()
    
    lazy var secondaryType: PokemonTypeView? = {
        let view = PokemonTypeView(type: .poison)
        return view
    }()
    
    // MARK: - Stacks
    lazy var cellContainer: UIStackView = {
        let stack = UIStackView(frame: .zero)
        stack.axis = .horizontal
        stack.spacing = 16
        stack.alignment = .center
        return stack
    }()
    
    lazy var infoContainer: UIStackView = {
        let stack = UIStackView(frame: .zero)
        stack.axis = .vertical
        stack.spacing = 8
        stack.alignment = .leading
        return stack
    }()
    
    lazy var typeContainer: UIStackView = {
        let stack = UIStackView(frame: .zero)
        stack.axis = .horizontal
        stack.spacing = 8
        stack.alignment = .leading
        return stack
    }()
    
    // MARK: - Delegate
    var buttonDelegate: ActionButtonDelegate?
    
    // MARK: - Initializers
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Cell button action
    @objc func didTouchActionButton() {
        self.actionButtton.pokemonIsSaved = !self.actionButtton.pokemonIsSaved
        // TODO: - Update pokelist
    }
}

// MARK: - Setup interface
extension PokemonDetailCell: CodeView {
    func buildViewHierarchy() {
        // Set cell container
        self.cellContainer.addArrangedSubview(self.pokemonImage)
        self.cellContainer.addArrangedSubview(self.infoContainer)
        self.cellContainer.addArrangedSubview(self.actionButtton)
        // Set info container
        self.infoContainer.addArrangedSubview(self.hp)
        self.infoContainer.addArrangedSubview(self.name)
        self.infoContainer.addArrangedSubview(self.typeContainer)
        // Set type container
        self.typeContainer.addArrangedSubview(self.primaryType)
        if let secondaryType = self.secondaryType {
            self.typeContainer.addArrangedSubview(secondaryType)
        }
        // Add view
        self.contentView.addSubview(cellContainer)
    }
    
    func setupConstratins() {
        // Cell container
        self.cellContainer.snp.makeConstraints { (make) in
            make.edges.equalToSuperview().inset(UIEdgeInsets(top: 16,
                                                             left: 16,
                                                             bottom: 16,
                                                             right: 16))
            make.centerY.equalToSuperview()
        }
        
        // Pokemon image
        self.pokemonImage.snp.makeConstraints { (make) in
            make.width.equalTo(64)
            make.height.equalTo(64)
        }
        
        // Pokemon type labels
        self.primaryType.snp.makeConstraints { (make) in
            make.width.equalTo(64)
            make.height.equalTo(16)
        }
        
        if let secondaryType = self.secondaryType {
            secondaryType.snp.makeConstraints { (make) in
                make.width.equalTo(64)
                make.height.equalTo(16)
            }
        }
        
        // Cell action button
        self.actionButtton.snp.makeConstraints { (make) in
            make.width.greaterThanOrEqualTo(54)
            make.height.equalTo(24)
        }
    }
    
    func setupAdditionalConfiguration() {
        self.selectionStyle = .none
    }
}
