//
//  ResultsViewController.swift
//  Millionaire
//
//  Created by Andrey on 15/12/2020.
//  Copyright © 2020 Andrey Anoshkin. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    var records: [Record] = []
    
    var tableView: UITableView = {
        let tableView = UITableView()
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    let cellID = "ResultsTableViewCell"

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .red
        view.addSubview(tableView)
        // Do any additional setup after loading the view.
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(ResultsTableViewCell.self, forCellReuseIdentifier: cellID)
        tableView.pin(to: view)
        print("Game.shared.records",Game.shared.records)
        print("Game.shared.records.count",Game.shared.records.count)
    }
}

extension ResultsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        Game.shared.records.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as? ResultsTableViewCell {
            let reversedIndex = Game.shared.records.count - indexPath.row - 1
            let record = Game.shared.records[reversedIndex]
            cell.scoreLabel.text = "\(record.score)"
            cell.dateLabel.text = record.date.description
            
            return cell
        }
        
        return UITableViewCell()
        
    }


}

