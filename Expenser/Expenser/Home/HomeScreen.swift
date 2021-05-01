//
//  HomeScreen.swift
//  Expenser
//
//  Created by Vitor Costa on 20/03/21.
//

import UIKit

final class HomeScreen: UIView {
    
    let briefView = HomeBriefView()
    let leftBox = HomeTotalView()
    let rightBox = HomeTotalView()
    
    lazy var tableView: UITableView = {
        let table = UITableView(frame: .zero)
        table.register(HomeCellView.self, forCellReuseIdentifier: "HomeCell")
        return table
    }()
    
    private lazy var gridContainer: UIStackView = {
        var stack = UIStackView(arrangedSubviews: [leftBox, rightBox])
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.spacing = 8
        return stack
    }()
    
    private lazy var topView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = .purple
        return view
    }()
    
    private lazy var bottomView: UIView = {
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

extension HomeScreen: CodeView {
    func buildViewHierarchy() {
        // Add views(components)
        addSubview(topView)
        addSubview(bottomView)
        topView.addSubview(briefView)
        topView.addSubview(gridContainer)
        bottomView.addSubview(tableView)
    }
    
    func setupConstraints() {
        // Setup constraints
        topView.snp.makeConstraints { make in
            make.height.equalTo(330)
            make.top.left.right.equalToSuperview()
        }
        
        briefView.snp.makeConstraints { make in
            make.height.equalTo(200)
            make.top.equalTo(self.snp.top).offset(8)
            make.centerX.equalTo(self.snp.centerX)
        }
        
        gridContainer.snp.makeConstraints { make in
            make.top.equalTo(briefView.snp.bottom)
            make.left.equalTo(10)
            make.right.equalTo(-10)
            make.height.equalTo(50)
        }
        
        bottomView.snp.makeConstraints { make in
            make.top.equalTo(topView.snp_bottomMargin)
            make.left.right.bottom.equalToSuperview()
        }
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(-30)
            make.left.bottom.right.equalTo(0)
        }
    }
    
    func setupAdditionalConfiguration() {
        // Additional configurations
        topView.backgroundColor = .purple
        bottomView.backgroundColor = .white
        tableView.backgroundColor = .clear
        tableView.separatorColor = .clear
        backgroundColor = .white
    }
}
