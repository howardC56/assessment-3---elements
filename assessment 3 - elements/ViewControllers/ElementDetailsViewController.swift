//
//  ElementDetailsViewController.swift
//  assessment 3 - elements
//
//  Created by Howard Chang on 12/14/19.
//  Copyright © 2019 Howard Chang. All rights reserved.
//

import UIKit

class ElementDetailsViewController: UIViewController {
    
    var selectedElement: Element!
    var elementDetailView = ElementDetailView()
    var postedElements = [PostedElement]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(elementDetailView)
        setupNavigationBar()
        labelTexts()
        loadPostedElements()
    }
    
    private func loadPostedElements() {
        GetPostElementsAPI.manager.fetchPostedElementsJson { [weak self] (result) in
            DispatchQueue.main.async {
                switch result {
                case .failure(let appError):
                    self?.showAlert(title: "App Error", message: "\(appError)")
                case .success(let elements):
                    self?.postedElements = elements.filter{ $0.favoritedBy == "Howard" }
                }
            }
        }
    }
    
    private func setupNavigationBar() {
        title = selectedElement.name
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "heart"), style: .plain, target: self, action: #selector(addToFavorites))
    }
    
    @objc func addToFavorites(sender: UIBarButtonItem) {
        sender.isEnabled = false
        var duplicate = false
        let elementToPost = PostedElement(favoritedBy: "Howard", elementName: selectedElement.name, elementSymbol: selectedElement.symbol)
        for each in postedElements {
            if each.elementName == selectedElement.name {
                duplicate = true
            }
        }
        if duplicate == true {
            showAlert(title: "Duplicate", message: "Already Favorited")
        } else {
            GetPostElementsAPI.manager.postElement(element: elementToPost) { [weak self] (result) in
                DispatchQueue.main.async {
                    sender.isEnabled = true
                    switch result {
                    case .failure(let appError):
                        print(appError)
                    case .success:
                        self?.showAlert(title: "success", message: "cool")
                    }
                }
            }
        }
        loadPostedElements()
    }
    
    private func labelTexts() {
        elementDetailView.elementSymbolLabel.text = "Symbol: \(selectedElement.symbol)"
        elementDetailView.elementNumberLabel.text = "Number: \(selectedElement.number)"
        elementDetailView.elementWeightLabel.text = "Atomic Mass: \(selectedElement.atomicMass)"
        if selectedElement.boil == nil {
            elementDetailView.elementBoilLabel.text = "Boiling Point Unknown"
        } else {
            elementDetailView.elementBoilLabel.text = "Boiling Point: \(selectedElement.boil ?? 0)"
        }
        if selectedElement.melt == nil {
            elementDetailView.elementMeltLabel.text = "Melting Point Unknown"
        } else {
            elementDetailView.elementMeltLabel.text = "Melting Point: \(selectedElement.melt ?? 0)"
        }
        elementDetailView.elementDiscoveredLabel.text = "Discovered by: \(selectedElement.discovered ?? "Unknown")"
        let urlImageString = "http://images-of-elements.com/\(selectedElement.name.lowercased()).jpg"
        elementDetailView.elementImageView.getImage(with: urlImageString) { [weak self] (result) in
            DispatchQueue.main.async {
                switch result {
                case .failure:
                    self?.elementDetailView.elementImageView.image = UIImage(systemName: "exclamationmark.triangle")
                case .success(let image):
                    self?.elementDetailView.elementImageView.image = image
                }
            }
        }
    }
    
}
