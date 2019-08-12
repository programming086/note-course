//
//  OrganizationsViewController.swift
//  Database
//
//  Created by Brovko Roman on 8/12/19.
//  Copyright © 2019 Roman Brovko. All rights reserved.
//

import UIKit
import CoreData

class OrganizationsViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    fileprivate let employeesSegueIdentifier = "employees"
    
    var backgroundContext: NSManagedObjectContext!
    var context: NSManagedObjectContext! {
        didSet {
            setupFetchedResultsController(for: context)
            fetchData()
        }
    }
    
    fileprivate let CellIdentifier = "OrganizationCellIdentifier"
    
    private var fetchedResultsController: NSFetchedResultsController<Organization>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.refreshControl = UIRefreshControl()
        
        tableView.refreshControl?.beginRefreshing()
        
        NotificationCenter.default.addObserver(self, selector: #selector(managedObjectContextDidSave(notification:)), name: NSNotification.Name.NSManagedObjectContextDidSave, object: nil)
    }
    
    @objc func managedObjectContextDidSave(notification: Notification) {
        context.perform {
            self.context.mergeChanges(fromContextDidSave: notification)
        }
    }

    @IBAction func addOrganization(_ sender: UIBarButtonItem) {
//        guard let context = context else { return }
//
//        guard let organization = NSEntityDescription.insertNewObject(forEntityName: "Organization", into: context) as? Organization else { return }
//
//        organization.name = "Yandex"
//
//        do {
//            try context.save()
//        } catch {
//            print(error)
//        }
        
        DispatchQueue.global(qos: .userInitiated).async { [weak self] in
            guard let `self` = self else { return }
            let organization = Organization(context: self.backgroundContext)
            organization.name = "Yandex Music"
            
            self.backgroundContext.performAndWait {
                do {
                    try self.backgroundContext.save()
                } catch {
                    print(error)
                }
            }
        }
    }
    
    func fetchData() {
        tableView.refreshControl?.endRefreshing()
        
        do {
            try fetchedResultsController?.performFetch()
        } catch {
            print(error)
        }
        
        tableView.reloadData()
    }
    
    func setupFetchedResultsController(for context: NSManagedObjectContext) {
        let sortDescriptor = NSSortDescriptor(key: "name", ascending: true)
        let request = NSFetchRequest<Organization>(entityName: "Organization")
        request.sortDescriptors = [sortDescriptor]
        
        fetchedResultsController = NSFetchedResultsController(fetchRequest: request, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
        fetchedResultsController?.delegate = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == employeesSegueIdentifier,
            let vc = segue.destination as? EmployeesViewController,
            let indexPath = tableView.indexPathForSelectedRow {
            vc.organization = fetchedResultsController?.object(at: indexPath)
        }
    }
}

// MARK: - UITableViewDataSource
extension OrganizationsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let sections = fetchedResultsController?.sections else { return 0 }
        
        return sections[section].numberOfObjects
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier, for: indexPath)
        
        guard let organization = fetchedResultsController?.object(at: indexPath) else { return cell }
        
        cell.textLabel?.text = organization.name
        cell.detailTextLabel?.text = "Employees \(organization.employees?.count ?? 0)"
        
        return cell
    }
    
}

// MARK: - NSFetchedResultsControllerDelegate
extension OrganizationsViewController: NSFetchedResultsControllerDelegate {
    
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.beginUpdates()
    }
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        switch type {
        case .insert:
            tableView.insertRows(at: [newIndexPath!], with: .automatic)
        case .update:
            tableView.reloadRows(at: [indexPath!], with: .automatic)
        case .move:
            tableView.deleteRows(at: [indexPath!], with: .automatic)
            tableView.insertRows(at: [newIndexPath!], with: .automatic)
        case .delete:
            tableView.deleteRows(at: [indexPath!], with: .automatic)
        @unknown default:
            fatalError()
        }
    }
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.endUpdates()
    }
    
}
