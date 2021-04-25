//
//  AbstractView.swift
//  Expenser
//
//  Created by Vitor Costa on 20/03/21.
//

import UIKit

final class HomeBriefView: UIView {
    
    lazy var title: UILabel = {
        var label = UILabel(frame: .zero)
        label.textColor = .lightGray
        label.textAlignment = .center
        label.font = .preferredFont(forTextStyle: .callout)
        label.text = "CURRENT BALANCE"
        return label
    }()
    
    lazy var balance: UILabel = {
        var label = UILabel(frame: .zero)
        label.textColor = .white
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 60.0)
        label.text = "32,465"
        return label
    }()
    
    lazy var month: UILabel = {
        var label = UILabel(frame: .zero)
        label.textColor = .white
        label.textAlignment = .center
        label.font = .preferredFont(forTextStyle: .body)
        label.text = "March 2021"
        return label
    }()
    
    lazy var textContainer: UIStackView = {
        let stack = UIStackView(frame: .zero)
        stack.axis = .vertical
        stack.distribution = .fillProportionally
        stack.spacing = 8
        return stack
    }()
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension HomeBriefView: CodeView {
    func buildViewHierarchy() {
        // Add views(components)
        textContainer.addArrangedSubview(title)
        textContainer.addArrangedSubview(balance)
        textContainer.addArrangedSubview(month)
        addSubview(textContainer)
    }
    
    func setupConstraints() {
        // Setup constraints
        textContainer.snp.makeConstraints { make in
            make.topMargin.equalTo(8)
            make.leftMargin.equalTo(20)
            make.rightMargin.equalTo(-20)
        }
    }
    
    func setupAdditionalConfiguration() {
        // Additional configurations
    }
}
