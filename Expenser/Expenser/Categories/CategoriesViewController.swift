//
//  CategoriesViewController.swift
//  Expenser
//
//  Created by Vitor Costa on 25/04/21.
//

import UIKit

class CategoriesViewController: UIViewController {
    
    let screen = CategoriesScreen()
    let data = ["Food": ["Burguer", "Noodles", "Pizza", "Drinks", "Pet Food"], "Entertaintment": ["Games", "Movie"]]

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        
        view.addSubview(screen)
        
        screen.tableView.delegate = self
        screen.tableView.dataSource = self
        
        screen.snp.makeConstraints { make in
            make.left.top.right.bottom.equalToSuperview()
        }
    }
}

extension CategoriesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Array(data.values)[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "CategoriesCell") as? CategoriesCellView {
            cell.setup(category: Category(icon: UIImage(named: data[Array(data.keys)[indexPath.section]]![indexPath.row].lowercased()) ?? UIImage(),
                                          name: data[Array(data.keys)[indexPath.section]]![indexPath.row]))
            
            return cell
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = UILabel(frame: .zero)
        label.text = "      \(Array(data.keys)[section])"
        label.textColor = .lightGray
        label.backgroundColor = .white
        return label
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 35
    }
}
