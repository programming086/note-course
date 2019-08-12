//
//  EmployeesViewController.swift
//  Database
//
//  Created by Brovko Roman on 8/12/19.
//  Copyright © 2019 Roman Brovko. All rights reserved.
//

import UIKit
import CoreData

class EmployeesViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var organization: Organization!
    
    fileprivate let CellIdentifier = "EmployeeCellIdentifier"
    private var fetchedResultsController: NSFetchedResultsController<Employee>!

    override func viewDidLoad() {
        super.viewDidLoad()

        title = organization.name
        
        setupFetchedResultsController(for: organization.managedObjectContext!)
        
        do {
            try fetchedResultsController.performFetch()
        } catch {
            print(error)
        }
    }
    

    @IBAction func addEmployee(_ sender: Any) {
        guard let context = organization.managedObjectContext else { return }
        
        let employee = NSEntityDescription.insertNewObject(forEntityName: "Employee", into: context) as! Employee
        
        employee.name = "Konstantin"
        employee.lastName = "Snegov"
        employee.birthDate = Date()
        employee.position = "iOS Developer"
        employee.salary = 300
        
        organization.addToEmployees(employee)
        
        do {
            try context.save()
        } catch {
            print(error)
        }
    }
    
    func setupFetchedResultsController(for context: NSManagedObjectContext) {
        let sortDescriptor = NSSortDescriptor(key: "lastName", ascending: true)
        let request = NSFetchRequest<Employee>(entityName: "Employee")
        request.sortDescriptors = [sortDescriptor]
        
        let predicate = NSPredicate(format: "department = %@", organization)
        request.predicate = predicate
        
        fetchedResultsController = NSFetchedResultsController(fetchRequest: request, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
        fetchedResultsController?.delegate = self
    }
    
}

// MARK: - NSFetchedResultsControllerDelegate
extension EmployeesViewController: NSFetchedResultsControllerDelegate {
    
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

// MARK: - UITableViewDataSource
extension EmployeesViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        guard let sections = fetchedResultsController?.sections else { return 0 }
        
        return sections.count

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let sections = fetchedResultsController?.sections else { return 0 }
        
        return sections[section].numberOfObjects
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier, for: indexPath)
        
        guard let employee = fetchedResultsController?.object(at: indexPath) else { return cell }
        
        cell.textLabel?.text = employee.lastName! + employee.name!
        cell.detailTextLabel?.text = "\(employee.salary) \(employee.position ?? "")"
        
        return cell
    }

}
