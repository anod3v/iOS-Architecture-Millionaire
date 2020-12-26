//
//  ResultsTableViewCell.swift
//  Millionaire
//
//  Created by Andrey on 16/12/2020.
//  Copyright © 2020 Andrey Anoshkin. All rights reserved.
//

import UIKit

class ResultsTableViewCell: UITableViewCell {
    
    var scoreLabel: UILabel = {
        let label = UILabel()
        //        label.font = Constants.Fonts.regularOfSize25
        label.numberOfLines = 1
        label.textColor = .white
        label.backgroundColor = .gray
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var dateLabel: UILabel = {
        let label = UILabel()
        //        label.font = Constants.Fonts.regularOfSize25
        label.numberOfLines = 1
        label.textColor = .white
        label.backgroundColor = .darkGray
        
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
        self.addSubview(scoreLabel)
        self.addSubview(dateLabel)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            
            scoreLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            scoreLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            scoreLabel.widthAnchor.constraint(equalToConstant: 200),
            scoreLabel.heightAnchor.constraint(equalToConstant: 50),

            dateLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            dateLabel.leadingAnchor.constraint(equalTo: scoreLabel.trailingAnchor,constant: 20),
            dateLabel.widthAnchor.constraint(equalToConstant: 200),
            dateLabel.heightAnchor.constraint(equalToConstant: 50),
   
        ])
    }
}
