//
//  TappableDetailCell.swift
//  ToolKit
//
//  Created by Niklas Sauer on 13.06.18.
//  Copyright © 2018 SauerStudios. All rights reserved.
//

import Foundation

class TappableDetailCell: DetailCell {
    
    // Mark: - Public Properties
    var firstDetailValue: String?
    var secondDetailValue: String?
    
    var showsFirstDetailValue = true {
        didSet {
            if showsFirstDetailValue {
                detailLabel.text = firstDetailValue
            } else {
                detailLabel.text = secondDetailValue
            }
        }
    }
    
    // Mark: - Initialization
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
