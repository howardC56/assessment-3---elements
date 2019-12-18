//
//  ElementsView.swift
//  assessment 3 - elements
//
//  Created by Howard Chang on 12/14/19.
//  Copyright © 2019 Howard Chang. All rights reserved.
//

import UIKit

class ElementsView: UIView {

    lazy var tableView: UITableView = {
        let tableV = UITableView()
        tableV.rowHeight = 100
        tableV.backgroundColor = .white
        return tableV
    }()
    
    func tableViewConstraints() {
        addSubview(tableView)
        tableView.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor)
    }
    
   override init(frame: CGRect) {
    super.init(frame: UIScreen.main.bounds)
    backgroundColor = .white
    tableViewConstraints()
    tableView.register(ElementsTableViewCell.self, forCellReuseIdentifier: "ElementsTableViewCell")
    tableView.register(ElementsTableViewCell.self, forCellReuseIdentifier: "FavoritedElementsViewCell")
}
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
}

}
