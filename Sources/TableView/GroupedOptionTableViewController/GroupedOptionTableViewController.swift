//
//  GroupedOptionTableViewController.swift
//  RoadChat
//
//  Created by Niklas Sauer on 16.04.18.
//  Copyright © 2018 Niklas Sauer. All rights reserved.
//

import UIKit

open class GroupedOptionTableViewController: UITableViewController, GroupedOptionCellDelegate {
    
    // MARK: - Public Types
    public struct Option: Equatable {
        public let name: String
        public var isEnabled: Bool
        
        public init(name: String, isEnabled: Bool) {
            self.name = name
            self.isEnabled = isEnabled
        }
    }
    
    public class GroupedOption: Equatable {
        // MARK: - Public Properties
        public var option: Option
        public let section: Int
        public let row: Int
        
        // MARK: - Initialization
        public init(_ option: Option, section: Int, row: Int) {
            self.option = option
            self.section = section
            self.row = row
        }
        
        // MARK: - Equatable
        public static func == (lhs: GroupedOptionTableViewController.GroupedOption, rhs: GroupedOptionTableViewController.GroupedOption) -> Bool {
            return lhs.option == rhs.option && lhs.section == rhs.section && lhs.row == rhs.row
        }
    }
    
    // MARK: - Public Properties
    public var options: [GroupedOption]
    
    // MARK: - Initialization
    public init(options: [GroupedOption]) {
        self.options = options
        
        super.init(style: .grouped)
        
        tableView.allowsSelection = false
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Customization
    override open func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(GroupedOptionCell.self, forCellReuseIdentifier: "GroupedOptionCell")
    }
    
    // MARK: - Public Methods
    public func groupedOption(for cell: GroupedOptionCell) -> GroupedOption? {
        guard let indexPath = tableView.indexPath(for: cell), let groupedOption = options.first(where: { $0.section == indexPath.section && $0.row == indexPath.row }) else {
            return nil
        }
        
        return groupedOption
    }
    
    // MARK: - GroupedOptionCell Delegate
    open func groupedOptionCellDidChangeIsOn(_ groupedOptionCell: GroupedOptionCell) {
        guard let indexPath = tableView.indexPath(for: groupedOptionCell), let groupedOption = options.first(where: { $0.section == indexPath.section && $0.row == indexPath.row }) else {
            return
        }
        
        groupedOption.option.isEnabled = groupedOptionCell.switchControl.isOn
    }
    
    // MARK: - TableView DataSource
    override open func numberOfSections(in tableView: UITableView) -> Int {
        return Set(options.map { $0.section}).count
    }
    
    override open func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return options.filter { $0.section == section }.count
    }
    
    override open func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let option = options.first(where: { $0.section == indexPath.section && $0.row == indexPath.row })?.option else {
            fatalError()
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "GroupedOptionCell", for: indexPath) as! GroupedOptionCell
        cell.label.text = option.name
        cell.switchControl.isOn = option.isEnabled
        cell.delegate = self
        return cell
    }
    
}
