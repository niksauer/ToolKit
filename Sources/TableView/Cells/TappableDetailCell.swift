//
//  TappableDetailCell.swift
//  ToolKit
//
//  Created by Niklas Sauer on 13.06.18.
//  Copyright © 2018 SauerStudios. All rights reserved.
//

import Foundation

open class TappableDetailCell: DetailCell {
    
    // Mark: - Public Properties
    public var firstDetailValue: String?
    public var secondDetailValue: String?
    
    public var showsFirstDetailValue = true {
        didSet {
            if showsFirstDetailValue {
                detailLabel.text = firstDetailValue
            } else {
                detailLabel.text = secondDetailValue
            }
        }
    }
    
    // Mark: - Initialization
    override public init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
