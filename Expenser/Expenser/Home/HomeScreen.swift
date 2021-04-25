//
//  HomeScreen.swift
//  Expenser
//
//  Created by Vitor Costa on 20/03/21.
//

import UIKit

final class HomeScreen: UIView {
    
    let abstractView = HomeBriefView()
    let leftBox = HomeTotalView()
    let rightBox = HomeTotalView()
    
    lazy var tableView: UITableView = {
        let table = UITableView(frame: .zero)
        table.register(HomeCellView.self, forCellReuseIdentifier: "Cell")
        
        return table
    }()
    
    private lazy var gridContainer: UIStackView = {
        var stack = UIStackView(arrangedSubviews: [leftBox, rightBox])
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.spacing = 8
        return stack
    }()
    
    private lazy var verticalContainer: UIStackView = {
        var stack = UIStackView(arrangedSubviews: [abstractView, gridContainer])
        stack.axis = .vertical
        stack.distribution = .fill
        stack.spacing = 5
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
        topView.addSubview(verticalContainer)
        bottomView.addSubview(tableView)
    }
    
    func setupConstraints() {
        // Setup constraints
        topView.snp.makeConstraints { make in
            make.height.equalTo(320)
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
        }
        
        verticalContainer.snp.makeConstraints { make in
            make.topMargin.equalTo(8)
            make.left.equalTo(20)
            make.right.equalTo(-20)
            make.bottomMargin.equalTo(-60)
        }
        
        gridContainer.snp.makeConstraints { make in
            make.height.equalTo(50)
        }
        
        bottomView.snp.makeConstraints { make in
            make.top.equalTo(topView.snp_bottomMargin)
            make.left.right.bottom.equalToSuperview()
        }
        
        tableView.snp.makeConstraints { make in
            make.bottom.equalTo(0)
            make.top.equalTo(-30)
            make.left.equalTo(0)
            make.right.equalTo(0)
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
