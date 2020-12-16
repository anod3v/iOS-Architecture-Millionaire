//
//  ResultsTableViewCell.swift
//  Millionaire
//
//  Created by Andrey on 16/12/2020.
//  Copyright © 2020 Andrey Anoshkin. All rights reserved.
//

import UIKit

class ResultsTableViewCell: UITableViewCell {
    
    var userNameLabel: UILabel = {
        let label = UILabel()
        //        label.font = Constants.Fonts.regularOfSize25
        label.numberOfLines = 1
        label.textColor = .white
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var resultLabel: UILabel = {
        let label = UILabel()
        //        label.font = Constants.Fonts.regularOfSize25
        label.numberOfLines = 1
        label.textColor = .white
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
//        showMoreButton.addTarget(self, action: #selector(showMoreText), for: .touchUpInside)
        addViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addViews() {
        self.addSubview(userNameLabel)
        self.addSubview(resultLabel)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            
            userNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            userNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            userNameLabel.heightAnchor.constraint(equalToConstant: 50),

            resultLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            resultLabel.leadingAnchor.constraint(equalTo: userNameLabel.trailingAnchor,constant: 20),
            resultLabel.heightAnchor.constraint(equalToConstant: 50),
   
        ])
    }
}
