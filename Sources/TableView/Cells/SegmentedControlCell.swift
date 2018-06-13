//
//  SegmentedControlCell.swift
//  ToolKit
//
//  Created by Niklas Sauer on 13.06.18.
//  Copyright © 2018 SauerStudios. All rights reserved.
//

import Foundation

public class SegmentedControlCell: UITableViewCell {
    
    // MARK: - Views
    public let segmentedControl = UISegmentedControl()
    
    // MARK: - Initialization
    override public init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .none
        backgroundColor = UIColor.clear
        
        contentView.addSubview(segmentedControl)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Customization
    override public func layoutSubviews() {
        super.layoutSubviews()
        
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            segmentedControl.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor),
            segmentedControl.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor),
            segmentedControl.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
    
    // MARK: - Public Methods
    public func setup(segments: [String], selectedSegment: Int) {
        segmentedControl.removeAllSegments()
        
        for (index, segmentTitle) in segments.enumerated() {
            segmentedControl.insertSegment(withTitle: segmentTitle, at: index, animated: false)
        }
        
        segmentedControl.selectedSegmentIndex = selectedSegment
    }
    
}
