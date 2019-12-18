//
//  FavoritesViewController.swift
//  assessment 3 - elements
//
//  Created by Howard Chang on 12/14/19.
//  Copyright © 2019 Howard Chang. All rights reserved.
//

import UIKit

final class FavoritesViewController: UIViewController {
    
    private var favoritedElements = [Element]() {
        didSet {
            DispatchQueue.main.async {
                self.favoritesView.tableView.reloadData()
            }
        }
    }
    
    private var apiElements = [Element]()
    
    let favoritesView = ElementsView()
    
    private var postedElements = [PostedElement]()
    
    private func getElements() {
        GetPostElementsAPI.manager.fetchElementsJson { [weak self] (result) in
            DispatchQueue.main.async {
                switch result {
                case .failure(let appError):
                    print(appError)
                case .success(let fetchedElements):
                    self?.apiElements = fetchedElements
                }
            }
        }
    }
    
    private func addElementToUi() {
        for each in postedElements {
            for ele in apiElements {
                if each.elementName == ele.name {
                    if !favoritedElements.contains(ele) {
                        favoritedElements.append(ele)
                    }
                }
            }
        }
    }
    
    private var refreshControl: UIRefreshControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(favoritesView)
        favoritesView.tableView.delegate = self
        favoritesView.tableView.dataSource = self
        getElements()
        loadFavoriteElements()
        configureRefreshControl()
        title = "Favorites"
    }
    
    
    private func configureRefreshControl() {
        refreshControl = UIRefreshControl()
        favoritesView.tableView.refreshControl = refreshControl
        refreshControl.addTarget(self, action: #selector(loadFavoriteElements), for: .valueChanged)
    }
    
    @objc
    private func loadFavoriteElements() {
        GetPostElementsAPI.manager.fetchPostedElementsJson { [weak self] (result) in
            DispatchQueue.main.async {
                switch result {
                case .failure(let appError):
                    self?.showAlert(title: "App Error", message: "\(appError)")
                case .success(let elements):
                    self?.postedElements = elements.filter{ $0.favoritedBy == "Howard" }
                }
                self?.addElementToUi()
                self?.refreshControl.endRefreshing()
            }
        }
    }
}

extension FavoritesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        favoritedElements.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let selectedCell = favoritedElements[indexPath.row]
        if let cell = tableView.dequeueReusableCell(withIdentifier: "FavoritedElementsViewCell", for: indexPath) as? ElementsTableViewCell {
            cell.configureCell(element: selectedCell)
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedCell = favoritedElements[indexPath.row]
        let viewController = ElementDetailsViewController()
        viewController.selectedElement = selectedCell
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}


