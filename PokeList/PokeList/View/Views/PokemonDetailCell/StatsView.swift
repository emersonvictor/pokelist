//
//  StatsView.swift
//  PokeList
//
//  Created by Emerson Victor on 22/11/19.
//  Copyright © 2019 emer. All rights reserved.
//

import UIKit

final class StatsView: UIView {
    
    // MARK: - Components
    lazy var title: UILabel = {
        let view = UILabel(frame: .zero)
        view.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        view.textColor = .secondaryLabel
        view.textAlignment = .right
        return view
    }()
    
    lazy var stats: UIProgressView = {
        let view = UIProgressView(progressViewStyle: .bar)
        view.layer.cornerRadius = 7
        view.layer.masksToBounds = true
        view.backgroundColor = .systemGray6
        view.progressTintColor = .systemBlue
        view.subviews.forEach { (subview) in
            subview.layer.cornerRadius = 7
            subview.layer.masksToBounds = true
        }
        return view
    }()
    
    // MARK: - Stacks
    lazy var contentContainer: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 8
        return stack
    }()
    
    // MARK: - Initializer
    required init(frame: CGRect = .zero,
                  title: String,
                  totalValue: Float,
                  progressValue: Float) {
        super.init(frame: frame)
        self.setProgress(withValue: progressValue/totalValue)
        self.title.text = title
        
        self.setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Set progress
    func setProgress(withValue value: Float) {
        self.stats.setProgress(value, animated: true)
    }
}

extension StatsView: CodeView {
    func buildViewHierarchy() {
        // Set content container
        self.contentContainer.addArrangedSubview(self.title)
        self.contentContainer.addArrangedSubview(self.stats)
        
        // Add container to view
        self.addSubview(self.contentContainer)
    }
    
    func setupConstratins() {
        // Content container
        self.contentContainer.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        // Stats progress view
        self.stats.snp.makeConstraints { (make) in
            make.height.equalTo(12)
            make.width.equalToSuperview().multipliedBy(0.78)
        }
    }
    
    func setupAdditionalConfiguration() {
    }
}
