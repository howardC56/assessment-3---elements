//
//  ViewController.swift
//  assessment 3 - elements
//
//  Created by Howard Chang on 12/14/19.
//  Copyright © 2019 Howard Chang. All rights reserved.
//

import UIKit

final class ElementsViewController: UIViewController {
    
    private var elements = [Element]() {
        didSet {
            elementsView.tableView.reloadData()
        }
    }
    
    let elementsView = ElementsView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(elementsView)
        elementsView.tableView.delegate = self
        elementsView.tableView.dataSource = self
        title = "Elements"
        getElements()
    }
    
    private func getElements() {
        GetPostElementsAPI.manager.fetchElementsJson { [weak self] (result) in
            DispatchQueue.main.async {
                switch result {
                case .failure(let appError):
                    print(appError)
                case .success(let fetchedElements):
                    self?.elements = fetchedElements
                }
            }
        }
    }
}


extension ElementsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        elements.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let selectedCell = elements[indexPath.row]
        if let cell = tableView.dequeueReusableCell(withIdentifier: "ElementsTableViewCell", for: indexPath) as? ElementsTableViewCell {
            cell.configureCell(element: selectedCell)
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedCell = elements[indexPath.row]
        let viewController = ElementDetailsViewController()
        viewController.selectedElement = selectedCell
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}





