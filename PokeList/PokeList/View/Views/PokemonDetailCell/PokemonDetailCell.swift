//
//  PokemonDetailCell.swift
//  PokeList
//
//  Created by Emerson Victor on 20/11/19.
//  Copyright © 2019 emer. All rights reserved.
//

import UIKit

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
    
    lazy var primaryType: PokemonTypeView = {
        let view = PokemonTypeView(type: .normal)
        return view
    }()
    
    lazy var secondaryType: PokemonTypeView? = {
        let view = PokemonTypeView(type: .poison)
        return view
    }()
    
    lazy var actionButtton: CellActionButton = {
        let button = CellActionButton(pokemonIsSaved: false)
        button.addTarget(self,
                         action: #selector(didTouchActionButton),
                         for: .touchUpInside)
        return button
    }()
    
    lazy var hpProgress: StatsView = {
        let view = StatsView(title: "HP", totalValue: 255, progressValue: 0)
        return view
    }()
    
    lazy var attackProgress: StatsView = {
        let view = StatsView(title: "ATTACK", totalValue: 190, progressValue: 0)
        return view
    }()
    
    lazy var defenseProgress: StatsView = {
        let view = StatsView(title: "DEFENSE", totalValue: 230, progressValue: 0)
        return view
    }()
    
    // MARK: - Stacks
    lazy var cellContainer: UIStackView = {
        let stack = UIStackView(frame: .zero)
        stack.axis = .vertical
        stack.spacing = 20
        stack.distribution = .fill
        return stack
    }()
    
    lazy var pokemonContainer: UIStackView = {
        let stack = UIStackView(frame: .zero)
        stack.axis = .horizontal
        stack.spacing = 16
        stack.alignment = .center
        stack.distribution = .fill
        return stack
    }()
    
    lazy var infoContainer: UIStackView = {
        let stack = UIStackView(frame: .zero)
        stack.axis = .vertical
        stack.spacing = 4
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
    
    lazy var statsContainer: UIStackView = {
        let stack = UIStackView(frame: .zero)
        stack.axis = .vertical
        stack.spacing = 10
        return stack
    }()
    
    // MARK: - Delegate
    var buttonDelegate: ActionButtonDelegate?
    
    // MARK: - Cell state
    var isExpanded = false {
        didSet {
            if self.isExpanded {
                // HP label
                UIView.animate(withDuration: 0.3) {
                    self.hp.alpha = 0
                    self.hp.isHidden = true
                    self.infoContainer.layoutIfNeeded()
                }
                
                UIView.animate(withDuration: 0.5,
                               delay: 0.2,
                               options: .transitionFlipFromTop,
                               animations: {
                    self.hpProgress.show()
                }) { (_) in
                    UIView.animate(withDuration: 0.4) {
                        self.hpProgress.setProgress(withValue: 60/255)
                    }
                }
                
                UIView.animate(withDuration: 0.5,
                               delay: 0.4,
                               options: .transitionFlipFromTop,
                               animations: {
                    self.attackProgress.show()
                }) { (_) in
                    UIView.animate(withDuration: 0.4) {
                        self.attackProgress.setProgress(withValue: 60/190)
                    }
                }
                
                UIView.animate(withDuration: 0.5,
                               delay: 0.6,
                               options: .transitionFlipFromTop,
                               animations: {
                    self.defenseProgress.show()
                }) { (_) in
                    UIView.animate(withDuration: 0.4) {
                        self.defenseProgress.setProgress(withValue: 60/230)
                    }
                }
            } else {
                UIView.animate(withDuration: 0.5,
                               delay: 0,
                               options: .beginFromCurrentState,
                               animations: {
                    self.hpProgress.hide()
                    self.attackProgress.hide()
                    self.defenseProgress.hide()
                }) { (_) in
                    self.hpProgress.setProgress(withValue: 0)
                    self.attackProgress.setProgress(withValue: 0)
                    self.defenseProgress.setProgress(withValue: 0)
                }
                
                UIView.animate(withDuration: 0.3,
                               delay: 0.2,
                               options: .beginFromCurrentState,
                               animations: {
                    self.hp.isHidden = false
                    self.hp.alpha = 1
                }, completion: nil)
            }
        }
    }
    
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
        self.pokemonContainer.addArrangedSubview(self.pokemonImage)
        self.pokemonContainer.addArrangedSubview(self.infoContainer)
        self.pokemonContainer.addArrangedSubview(self.actionButtton)
        // Set info container
        self.infoContainer.addArrangedSubview(self.hp)
        self.infoContainer.addArrangedSubview(self.name)
        self.infoContainer.addArrangedSubview(self.typeContainer)
        // Set type container
        self.typeContainer.addArrangedSubview(self.primaryType)
        if let secondaryType = self.secondaryType {
            self.typeContainer.addArrangedSubview(secondaryType)
        }
        // Set stats container
        self.statsContainer.addArrangedSubview(self.hpProgress)
        self.statsContainer.addArrangedSubview(self.attackProgress)
        self.statsContainer.addArrangedSubview(self.defenseProgress)
        // Set cell container
        self.cellContainer.addArrangedSubview(self.pokemonContainer)
        self.cellContainer.addArrangedSubview(self.statsContainer)
        // Add container to view
        self.contentView.addSubview(self.cellContainer)
    }
    
    func setupConstratins() {
        // Cell container
        self.cellContainer.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(16)
            make.right.equalToSuperview().inset(16)
            make.left.equalToSuperview().offset(16)
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
        self.hpProgress.hide()
        self.attackProgress.hide()
        self.defenseProgress.hide()
    }
}
