//
//  FetchedResultsTableViewController.swift
//  ToolKit
//
//  Created by Niklas Sauer on 13.06.18.
//  Copyright © 2018 SauerStudios. All rights reserved.
//

import Foundation
import UIKit
import CoreData

open class FetchedResultsTableViewController<T: NSManagedObject>: UITableViewController, NSFetchedResultsControllerDelegate {
    
    // MARK: - Public Properties
    public var fetchedResultsController: NSFetchedResultsController<T>!
    
    // MARK: - TableView DataSource
    override open func numberOfSections(in tableView: UITableView) -> Int {
        return fetchedResultsController.sections?.count ?? 0
    }
    
    override open func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fetchedResultsController.sections?[section].numberOfObjects ?? 0
    }
    
    override open func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if let sections = fetchedResultsController.sections, sections.count > 0 {
            return sections[section].name
        } else {
            return nil
        }
    }
    
    override open func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return fetchedResultsController.sectionIndexTitles
    }
    
    override open func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
        return fetchedResultsController.section(forSectionIndexTitle: title, at: index)
    }
    
    // MARK: - FetchedResultsController Delegate
    public func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.beginUpdates()
    }
    
    public func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange sectionInfo: NSFetchedResultsSectionInfo, atSectionIndex sectionIndex: Int, for type: NSFetchedResultsChangeType) {
        switch type {
        case .insert:
            tableView.insertSections([sectionIndex], with: .fade)
        case .delete:
            tableView.deleteSections([sectionIndex], with: .fade)
        default:
            break
        }
    }
    
    public func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        switch type {
        case .insert:
            tableView.insertRows(at: [newIndexPath!], with: .fade)
        case .delete:
            tableView.deleteRows(at: [indexPath!], with: .fade)
        case .update:
            tableView.reloadRows(at: [indexPath!], with: .fade)
        case .move:
            tableView.moveRow(at: indexPath!, to: newIndexPath!)
        }
    }
    
    public func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.endUpdates()
    }
    
}
