//
//  ElementDetailView.swift
//  assessment 3 - elements
//
//  Created by Howard Chang on 12/16/19.
//  Copyright © 2019 Howard Chang. All rights reserved.
//

import UIKit

final class ElementDetailView: UIView {

    lazy var elementImageView: UIImageView = {
        let elementView = UIImageView()
        elementView.clipsToBounds = true
        elementView.layer.cornerRadius = 10
        return elementView
    }()
    
    lazy var elementSymbolLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.textAlignment = .center
        nameLabel.font = .boldSystemFont(ofSize: 18)
        nameLabel.adjustsFontSizeToFitWidth = true
        nameLabel.numberOfLines = 0
        return nameLabel
    }()
    
    lazy var elementNumberLabel: UILabel = {
        let numberLabel = UILabel()
        numberLabel.font = .boldSystemFont(ofSize: 18)
        numberLabel.adjustsFontSizeToFitWidth = true
        numberLabel.numberOfLines = 0
        return numberLabel
    }()
    
    lazy var elementWeightLabel: UILabel = {
        let weightLabel = UILabel()
        weightLabel.font = .boldSystemFont(ofSize: 18)
        weightLabel.adjustsFontSizeToFitWidth = true
        weightLabel.numberOfLines = 0
        return weightLabel
    }()
    
    lazy var elementMeltLabel: UILabel = {
        let MeltLabel = UILabel()
        MeltLabel.font = .boldSystemFont(ofSize: 18)
        MeltLabel.adjustsFontSizeToFitWidth = true
        MeltLabel.numberOfLines = 0
        return MeltLabel
    }()
    
    lazy var elementBoilLabel: UILabel = {
           let boilLabel = UILabel()
           boilLabel.font = .boldSystemFont(ofSize: 18)
           boilLabel.adjustsFontSizeToFitWidth = true
           boilLabel.numberOfLines = 0
           return boilLabel
       }()
    
    lazy var elementDiscoveredLabel: UILabel = {
        let discoverLabel = UILabel()
        discoverLabel.font = .boldSystemFont(ofSize: 18)
        discoverLabel.adjustsFontSizeToFitWidth = true
        discoverLabel.numberOfLines = 0
        return discoverLabel
    }()
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        backgroundColor = .white
        commonInit()
    }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
    }
    
    private func commonInit() {
        backgroundColor = .white
        elementViewConstraints()
        elementSymbolLabelConstraints()
        elementNumberLabelConstraints()
        elementWeightLabelConstraints()
        elementMeltLabelConstraints()
        elementBoilLabelConstraints()
        elementDiscoverLabelConstraints()
    }
    
    private func elementViewConstraints() {
        addSubview(elementImageView)
        elementImageView.anchor(top: topAnchor, left: leftAnchor, right: rightAnchor, paddingTop: 100, paddingLeft: 10, paddingRight: 10, height: 200)
    }
    
    private func elementSymbolLabelConstraints() {
        addSubview(elementSymbolLabel)
        elementSymbolLabel.anchor(top: elementImageView.bottomAnchor, left: elementImageView.leftAnchor, right: elementImageView.rightAnchor, paddingTop: 50)
    }
    
    private func elementNumberLabelConstraints() {
        addSubview(elementNumberLabel)
        elementNumberLabel.anchor(top: elementSymbolLabel.bottomAnchor, left: elementSymbolLabel.leftAnchor, right: elementSymbolLabel.rightAnchor, paddingTop: 10)
    }
    
    private func elementWeightLabelConstraints() {
        addSubview(elementWeightLabel)
        elementWeightLabel.anchor(top: elementNumberLabel.bottomAnchor, left: elementNumberLabel.leftAnchor, right: elementNumberLabel.rightAnchor, paddingTop: 10)
    }
    
    private func elementMeltLabelConstraints() {
        addSubview(elementMeltLabel)
        elementMeltLabel.anchor(top: elementWeightLabel.bottomAnchor, left: elementWeightLabel.leftAnchor, right: elementWeightLabel.rightAnchor, paddingTop: 10)
    }
    
    private func elementBoilLabelConstraints() {
        addSubview(elementBoilLabel)
        elementBoilLabel.anchor(top: elementMeltLabel.bottomAnchor, left: elementMeltLabel.leftAnchor, right: elementMeltLabel.rightAnchor, paddingTop: 10)
    }
    
    private func elementDiscoverLabelConstraints() {
        addSubview(elementDiscoveredLabel)
        elementDiscoveredLabel.anchor(top: elementBoilLabel.bottomAnchor, left: elementBoilLabel.leftAnchor, right: elementBoilLabel.rightAnchor, paddingTop: 10)
    }

}
