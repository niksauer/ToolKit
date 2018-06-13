//
//  SwitchCell.swift
//  ToolKit
//
//  Created by Niklas Sauer on 13.06.18.
//  Copyright © 2018 SauerStudios. All rights reserved.
//

import Foundation
import UIKit

class SwitchCell: UITableViewCell {
    
    // MARK: - Views
    let label = UILabel()
    let switchControl = UISwitch()
    
    // MARK: - Initialization
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .none
        
        contentView.addSubview(label)
        contentView.addSubview(switchControl)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Customization
    override func layoutSubviews() {
        super.layoutSubviews()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        switchControl.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor),
            label.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            label.trailingAnchor.constraint(equalTo: switchControl.leadingAnchor, constant: 8)
        ])
        
        NSLayoutConstraint.activate([
            switchControl.centerYAnchor.constraint(equalTo: label.centerYAnchor),
            switchControl.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor)
        ])
    }
    
}