//
//  TableView.swift
//  Expenser
//
//  Created by Vitor Costa on 21/03/21.
//

import UIKit

final class HomeTableView: UITableView {
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension HomeTableView: CodeView {
    func buildViewHierarchy() {
        // Add views(components)
    }
    
    func setupConstraints() {
        // Setup constraints
        self.snp.makeConstraints { make in
            make.top.bottom.equalTo(0)
            make.left.right.equalTo(10)
        }
    }
    
    func setupAdditionalConfiguration() {
        // Additional configurations
    }
}
