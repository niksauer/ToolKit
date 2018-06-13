//
//  PickerViewCell.swift
//  ToolKit
//
//  Created by Niklas Sauer on 13.06.18.
//  Copyright © 2018 SauerStudios. All rights reserved.
//

import Foundation

public class PickerViewCell: UITableViewCell {
    
    // MARK: - Views
    public let pickerView = UIPickerView()
    
    // MARK: - Initialization
    override public init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(pickerView)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Customization
    override public func layoutSubviews() {
        super.layoutSubviews()
        
        pickerView.translatesAutoresizingMaskIntoConstraints = false
        pickerView.pin(to: contentView)
    }
    
}
