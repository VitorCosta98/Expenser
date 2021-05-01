//
//  CategoriesScreen.swift
//  Expenser
//
//  Created by Vitor Costa on 25/04/21.
//

import UIKit

final class CategoriesScreen: UIView {
    
    private lazy var title: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.textColor = .white
        label.text = "Categories"
        return label
    }()
    
    private lazy var searchBar: UISearchBar = {
        let search = UISearchBar(frame: .zero)
        search.searchTextField.backgroundColor = .white
        search.searchTextField.textColor = .gray
        search.placeholder = "Search categories"
        search.backgroundImage = UIImage()
        search.isTranslucent = true
        return search
    }()
    
    lazy var tableView: UITableView = {
        let table = UITableView(frame: .zero)
        table.register(CategoriesCellView.self, forCellReuseIdentifier: "CategoriesCell")
        return table
    }()
    
    private lazy var topView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = .purple
        return view
    }()
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CategoriesScreen: CodeView {
    func buildViewHierarchy() {
        // Add views(components)
        addSubview(topView)
        addSubview(tableView)
        topView.addSubview(title)
        topView.addSubview(searchBar)
    }
    
    func setupConstraints() {
        // Setup constraints
        topView.snp.makeConstraints { make in
            make.height.equalTo(170)
            make.top.left.right.equalToSuperview()
        }
        
        title.snp.makeConstraints { make in
            make.topMargin.equalTo(self.safeAreaInsets.top).offset(20)
            make.left.equalTo(self.safeAreaInsets.left).offset(10)
        }
        
        searchBar.snp.makeConstraints { make in
            make.top.equalTo(title.snp.bottom).offset(8)
            make.left.right.equalTo(0)
        }
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(topView.snp.bottom).offset(8)
            make.left.bottom.right.equalTo(0)
        }
    }
    
    func setupAdditionalConfiguration() {
        // Additional configurations
        self.backgroundColor = .white
        
        tableView.backgroundColor = .clear
        tableView.separatorColor = .clear
        
        topView.backgroundColor = .purple
        
        searchBar.backgroundColor = topView.backgroundColor
    }
}
