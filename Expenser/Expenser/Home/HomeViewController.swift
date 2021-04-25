//
//  HomeViewController.swift
//  Expenser
//
//  Created by Vitor Costa on 20/03/21.
//

import UIKit

class HomeViewController: UIViewController {
    
    let screen = HomeScreen()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        
        view.addSubview(screen)
        
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
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? HomeCellView {
            cell.setup(product: Product(image: UIImage(named: "fly")!, value: "- $523", date: "May 12 at 9:30PM", title: "Fly to Paris"))
            
            cell.layer.shadowColor = UIColor.black.cgColor
            cell.layer.shadowOpacity = 1
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
        return 10
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 8
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        if section == 9 {
            let footerView = UIView()
            footerView.backgroundColor = UIColor.clear
            return footerView
        }
        
        return nil
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 8
    }
}
