//
//  ElementsTableViewCell.swift
//  assessment 3 - elements
//
//  Created by Howard Chang on 12/14/19.
//  Copyright © 2019 Howard Chang. All rights reserved.
//

import UIKit

class ElementsTableViewCell: UITableViewCell {

    lazy var elementNameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.font = .boldSystemFont(ofSize: 18)
        nameLabel.textAlignment = .center
        nameLabel.adjustsFontSizeToFitWidth = true
        nameLabel.numberOfLines = 0
        return nameLabel
    }()
    
    lazy var elementDescriptionLabel: UILabel = {
        let descriptionLabel = UILabel()
        descriptionLabel.font = .boldSystemFont(ofSize: 16)
        descriptionLabel.textAlignment = .center
        descriptionLabel.adjustsFontSizeToFitWidth = true
        descriptionLabel.numberOfLines = 0
        return descriptionLabel
    }()
    
    lazy var elementImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 10
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super .init(style: style, reuseIdentifier: reuseIdentifier)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func commonInit() {
        elementImageViewConstraints()
        elementNameLabelConstraints()
        elementDescriptionLabelConstraints()
        backgroundColor = .white
    }
    
    private func elementImageViewConstraints() {
        addSubview(elementImageView)
        elementImageView.translatesAutoresizingMaskIntoConstraints = false
        elementImageView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        elementImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        elementImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12).isActive = true
        elementImageView.widthAnchor.constraint(equalTo: elementImageView.heightAnchor, multiplier: 16/9).isActive = true
    }
    
    private func elementNameLabelConstraints() {
        addSubview(elementNameLabel)
        elementNameLabel.anchor(top: topAnchor, left: elementImageView.rightAnchor, right: rightAnchor, paddingTop: 20, paddingLeft: 10, paddingRight: 8)
    }
    
    private func elementDescriptionLabelConstraints() {
        addSubview(elementDescriptionLabel)
        elementDescriptionLabel.anchor(top: elementNameLabel.bottomAnchor, left: elementNameLabel.leftAnchor, right: elementNameLabel.rightAnchor, paddingTop: 8)
    }
    
    func configureCell(element: Element) {
        elementNameLabel.text = element.name
        let elementMassString = String(element.atomicMass)
        elementDescriptionLabel.text = "Symbol: \(element.symbol) \n Atomic Mass: \(elementMassString)"
        var elementNumberString = String(element.number)
        while elementNumberString.count != 3 {
            elementNumberString.insert("0", at: elementNumberString.startIndex)
        }
        let imageURL = "http://www.theodoregray.com/periodictable/Tiles/\(elementNumberString)/s7.JPG"
        elementImageView.getImage(with: imageURL) { [weak self] (result) in
            DispatchQueue.main.async {
                switch result {
                case .failure:
                    self?.elementImageView.image = UIImage(systemName: "exclamationmark.triangle")
                case .success(let image):
                    self?.elementImageView.image = image
                }
            }
        }
    }
}
