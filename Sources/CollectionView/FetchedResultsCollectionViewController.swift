//
//  FetchedResultsCollectionViewController.swift
//  ToolKit
//
//  Created by Niklas Sauer on 13.06.18.
//  Copyright © 2018 SauerStudios. All rights reserved.
//

import Foundation
import CoreData

open class FetchedResultsCollectionViewController<T: NSManagedObject>: UICollectionViewController, NSFetchedResultsControllerDelegate {
    
    // MARK: - Public Properties
    public var fetchedResultsController: NSFetchedResultsController<T>!
    
    // MARK: - Private Properties
    private var blockOperations = [BlockOperation]()
    
    // MARK: UICollectionViewDataSource
    override open func numberOfSections(in collectionView: UICollectionView) -> Int {
        return fetchedResultsController.sections?.count ?? 0
    }
    
    override open func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return fetchedResultsController.sections?[section].numberOfObjects ?? 0
    }
    
    // MARK: - FetchedResultsControllerDelegate
    public func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        collectionView?.performBatchUpdates({
            for operation in self.blockOperations {
                operation.start()
            }
        }, completion: nil)
    }
    
    public func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        switch type {
        case .insert:
            blockOperations.append(BlockOperation {
                self.collectionView?.insertItems(at: [newIndexPath!])
            })
        case .delete:
            blockOperations.append(BlockOperation {
                self.collectionView?.deleteItems(at: [indexPath!])
            })
        case .update:
            blockOperations.append(BlockOperation {
                self.collectionView?.reloadItems(at: [indexPath!])
            })
        case .move:
            blockOperations.append(BlockOperation {
                self.collectionView?.moveItem(at: indexPath!, to: newIndexPath!)
            })
        }
    }
    
}
