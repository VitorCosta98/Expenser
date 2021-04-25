//
//  TabBarViewController.swift
//  Expenser
//
//  Created by Vitor Costa on 24/04/21.
//

import UIKit

class TabBarViewController: UITabBarController {
    
    let homeViewController = HomeViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let homeNavigationController = UINavigationController(rootViewController: homeViewController)
        homeNavigationController.tabBarItem.title = "Home"
        homeNavigationController.tabBarItem.image = UIImage(named: "home")
        
        let addViewController = UIViewController()
        addViewController.view.backgroundColor = .yellow
        addViewController.title = "Add"
        addViewController.navigationController?.navigationBar.isHidden = true
        
        let addNavigationController = UINavigationController(rootViewController: addViewController)
        addNavigationController.tabBarItem.image = UIImage(named: "add")
        
        let categoryViewController = UIViewController()
        categoryViewController.view.backgroundColor = .red
        categoryViewController.title = "Categories"
        categoryViewController.navigationController?.navigationBar.isHidden = true
        
        let categoryNavigationController = UINavigationController(rootViewController: categoryViewController)
        categoryNavigationController.title = "Category"
        categoryNavigationController.tabBarItem.image = UIImage(named: "categories")
        
        viewControllers = [homeNavigationController, addNavigationController, categoryNavigationController]
    }
}
