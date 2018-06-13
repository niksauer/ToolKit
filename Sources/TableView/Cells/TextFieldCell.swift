//
//  TextFieldCell.swift
//  ToolKit
//
//  Created by Niklas Sauer on 13.06.18.
//  Copyright © 2018 SauerStudios. All rights reserved.
//

import Foundation
import UIKit

public class TextFieldCell: UITableViewCell {
    
    // MARK: - Views
    public let textField = UITextField()
    
    // MARK: - Public Properties
    public var isEnabled: Bool = true {
        didSet {
            if isEnabled {
                textField.isUserInteractionEnabled = true
                textField.clearButtonMode = isEnabledClearButtonMode
            } else {
                textField.isUserInteractionEnabled = false
                textField.clearButtonMode = .never
            }
        }
    }
    
    public var isEnabledClearButtonMode: UITextFieldViewMode = .whileEditing {
        didSet {
            isEnabled = { isEnabled }()
        }
    }
    
    // MARK: - Initialization
    override public init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .none
        
        contentView.addSubview(textField)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Customization
    override public func layoutSubviews() {
        super.layoutSubviews()
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            textField.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor),
            textField.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor),
            textField.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
    
}
