//
//  TabBarScreen.swift
//  Expenser
//
//  Created by Vitor Costa on 24/04/21.
//

import UIKit

final class TabBarScreen: UIView {
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension TabBarScreen: CodeView {
    func buildViewHierarchy() {
        // Add views(components)
    }
    
    func setupConstraints() {
        // Setup constraints
    }
    
    func setupAdditionalConfiguration() {
        // Additional configurations
    }
}
