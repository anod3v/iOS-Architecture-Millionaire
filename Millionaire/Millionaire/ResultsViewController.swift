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
        let table = UITableView(frame: .zero, style: .grouped)
        table.backgroundColor = .blue
        
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    let cellID = "ResultsTableViewCell"

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .red
        // Do any additional setup after loading the view.
//        tableView.dataSource = self
//        tableView.delegate = self
        tableView.register(ResultsTableViewCell.self, forCellReuseIdentifier: cellID)
    }
}

//extension ResultsViewController: UITableViewDelegate, UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        records.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        <#code#>
//    }
//
//
//}

