//
//  TabBarViewController.swift
//  Expenser
//
//  Created by Vitor Costa on 24/04/21.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        
        // Configurations to HomeViewController
        let homeViewController = HomeViewController()
        let homeNavigationController = UINavigationController(rootViewController: homeViewController)
        homeNavigationController.tabBarItem.title = "Home"
        homeNavigationController.tabBarItem.image = UIImage(named: "home")
        homeNavigationController.navigationBar.isHidden = true
        
        // Configurations to AddViewController
        let addViewController = UIViewController()
        addViewController.view.backgroundColor = .yellow
        
        let addNavigationController = UINavigationController(rootViewController: addViewController)
        addNavigationController.tabBarItem.title = "Add"
        addNavigationController.tabBarItem.image = UIImage(named: "add")
        addNavigationController.navigationBar.isHidden = true
        
        // Configurations to CategoriesViewController
        let categoryViewController = CategoriesViewController()
        let categoryNavigationController = UINavigationController(rootViewController: categoryViewController)
        categoryNavigationController.title = "Category"
        categoryNavigationController.tabBarItem.image = UIImage(named: "categories")
        categoryNavigationController.navigationBar.isHidden = true
        
        // Add ViewControllers to TabBarViewController
        viewControllers = [homeNavigationController, addNavigationController, categoryNavigationController]
    }
}
