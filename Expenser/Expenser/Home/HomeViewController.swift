//
//  HomeViewController.swift
//  Expenser
//
//  Created by Vitor Costa on 20/03/21.
//

import UIKit

class HomeViewController: UIViewController {
    
    let screen = HomeScreen()
    let data = ["Fly To Paris", "Groceries", "Salary + Bonus", "Clothes", "Home Rent"]
    let values = [-470, -179, 1265, -523, -754]
    let icons = ["fly", "groceries", "wallet", "clothes", "home rent"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(screen)
        
        screen.briefView.setup(title: "CURRENT BALANCE", value: "\(values.reduce(0, +))", date: "\(Date().month) \(Date().year)")
        
        let income = values.map { value in
            return value > 0 ? value : 0
        }
        
        let expense = values.map { value in
            return value < 0 ? value : 0
        }
        
        screen.leftBox.setup(title: "INCOME", value: "\(income.reduce(0, +))", icon: UIImage(named: "arrow-green")!)
        screen.rightBox.setup(title: "EXPENSE", value: "\(expense.reduce(0, +))", icon: UIImage(named: "arrow-red")!)
        
        screen.snp.makeConstraints { make in
            make.left.top.right.bottom.equalToSuperview()
        }
        
        screen.tableView.delegate = self
        screen.tableView.dataSource = self
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "HomeCell", for: indexPath) as? HomeCellView {
            cell.setup(product: Product(image: UIImage(named: icons[indexPath.section])!,
                                        value: "\(values[indexPath.section])",
                                        date: "May \(Int.random(in: 1 ... 28)) at \(Int.random(in: 1 ... 12)):\(Int.random(in: 1 ... 60))\(["A", "P"].randomElement() ?? "")M",
                                        title: data[indexPath.section]))
            
            cell.layer.shadowColor = UIColor.black.cgColor
            cell.layer.shadowOpacity = 0.2
            cell.layer.shadowOffset = .zero
            cell.layer.shadowRadius = 10
            
            cell.layer.shadowPath = UIBezierPath(rect: cell.bounds).cgPath
            cell.layer.shouldRasterize = true
            cell.layer.rasterizationScale = UIScreen.main.scale
            
            return cell
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    // Settings to cell's spacing
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.clear
        return headerView
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 8
    }
}
