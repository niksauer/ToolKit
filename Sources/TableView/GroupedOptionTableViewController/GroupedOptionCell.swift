//
//  GroupedOptionCell.swift
//  RoadChat
//
//  Created by Niklas Sauer on 13.06.18.
//  Copyright © 2018 SauerStudios. All rights reserved.
//

import Foundation

protocol GroupedOptionCellDelegate: class {
    func groupedOptionCellDidChangeIsOn(_ groupedOptionCell: GroupedOptionCell)
}

class GroupedOptionCell: SwitchCell {
    
    // MARK: - Public Properties
    var delegate: GroupedOptionCellDelegate?
    
    // MARK: - Initialization
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        switchControl.addTarget(self, action: #selector(didChangeIsOn(_:)), for: .valueChanged)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    @objc private func didChangeIsOn(_ sender: UISwitch) {
        delegate?.groupedOptionCellDidChangeIsOn(self)
    }
    
}
