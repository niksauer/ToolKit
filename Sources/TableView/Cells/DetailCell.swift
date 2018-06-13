//
//  DetailCell.swift
//  ToolKit
//
//  Created by Niklas Sauer on 13.06.18.
//  Copyright © 2018 SauerStudios. All rights reserved.
//

import Foundation
import UIKit

open class DetailCell: UITableViewCell {
    
    // Mark: - Views
    public let label = UILabel()
    public let detailLabel = UILabel()
    
    // Mark: - Initialization
    override public init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        detailLabel.textColor = UIColor(red: 142/255, green: 142/255, blue: 147/255, alpha: 1)
        
        contentView.addSubview(label)
        contentView.addSubview(detailLabel)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Mark: - Customization
    override open func layoutSubviews() {
        super.layoutSubviews()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        detailLabel.translatesAutoresizingMaskIntoConstraints = false
        detailLabel.setContentCompressionResistancePriority(UILayoutPriority(rawValue: 760), for: .horizontal)
        detailLabel.setContentHuggingPriority(UILayoutPriority(rawValue: 760), for: .horizontal)
        
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor),
            label.trailingAnchor.constraint(equalTo: detailLabel.leadingAnchor, constant: -8),
            label.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
        
        let detailLabelTrailingConstraint: NSLayoutConstraint
        
        if accessoryType != .none {
            detailLabelTrailingConstraint = detailLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        } else {
            detailLabelTrailingConstraint = detailLabel.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor)
        }
        
        NSLayoutConstraint.activate([
            detailLabel.centerYAnchor.constraint(equalTo: label.centerYAnchor),
            detailLabelTrailingConstraint
        ])
    }
    
}
