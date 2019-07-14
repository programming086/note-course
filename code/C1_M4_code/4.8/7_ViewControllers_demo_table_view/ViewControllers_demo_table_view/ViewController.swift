//
//  ViewController.swift
//  ViewControllers_demo_table_view
//
//  Created by Andrew Solovey on 15.07.2018.
//  Copyright © 2018 Andrew Solovey. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var categories = RecipeCategory.allRecipes
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: "RecipeTableViewCell", bundle: nil),
                           forCellReuseIdentifier: "recipe")
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories[section].recipes.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let recipe = categories[indexPath.section].recipes[indexPath.row]
        print("Did tap recipe with title: \(recipe.title)")
        // showRecipeDetailsViewController(recipe)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "recipe", for: indexPath) as! RecipeTableViewCell
        let recipe = categories[indexPath.section].recipes[indexPath.row]
        cell.recipeTitleLabel?.text = recipe.title
        cell.recipeIngredientsLabel?.text = recipe.ingresients
        cell.iconImageView?.image = recipe.photo
        
        tableView.beginUpdates()
        let indexPaths = [IndexPath(row: 1, section: 0),
                          IndexPath(row: 5, section: 0)]
        tableView.insertRows(at: indexPaths, with: .fade)
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return categories[section].title
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        categories[indexPath.section].recipes.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .left)
    }
}
