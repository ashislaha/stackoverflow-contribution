//
//  ViewController.swift
//  TableViewCell
//
//  Created by Ashis Laha on 04/12/17.
//  Copyright © 2017 Ashis Laha. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(CustomCell2.self, forCellReuseIdentifier: "cell")
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? CustomCell2 else { return UITableViewCell() }
        cell.model = CellModel(labelString: "set constriant by code")
        return cell
    }
}

struct CellModel {
    let labelString : String
}

class CustomCell2 : UITableViewCell {
    private let label : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .green
        label.textAlignment = .center
        return label
    }()
    
    private func addLabel() {
        addSubview(label)
        NSLayoutConstraint.activate([
            label.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.7),
            label.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
    
    var model : CellModel? {
        didSet {
            label.text = model?.labelString ?? "Test"
        }
    }
    
    // Init 
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addLabel()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

