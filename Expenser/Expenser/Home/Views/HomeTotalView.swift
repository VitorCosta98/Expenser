//
//  TotalView.swift
//  Expenser
//
//  Created by Vitor Costa on 20/03/21.
//

import UIKit

final class HomeTotalView: UIView {
    
    let image: UIImageView = {
        var view = UIImageView(frame: .zero)
        guard let image = UIImage(named: "arrow-green") else { return view }
        view.image = image
        view.backgroundColor = .white
        view.contentMode = .scaleToFill
        view.layer.cornerRadius = 10
        view.layer.masksToBounds = true
        return view
    }()
    
    let clearImage: UIImageView = {
        var view = UIImageView(frame: .zero)
        view.backgroundColor = .clear
        return view
    }()
    
    lazy var title: UILabel = {
        var label = UILabel(frame: .zero)
        label.textColor = .lightGray
        label.font = .preferredFont(forTextStyle: .callout)
        label.text = "INCOME"
        return label
    }()
    
    lazy var value: UILabel = {
        var label = UILabel(frame: .zero)
        label.textColor = .white
        label.font = .systemFont(ofSize: 20)
        label.text = "42,500"
        return label
    }()
    
    lazy var verticalContainer: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [title, value])
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.spacing = 5
        return stack
    }()
    
    lazy var imageContainer: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [image, clearImage])
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.spacing = 5
        return stack
    }()
    
    lazy var horizontalContainer: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [imageContainer, verticalContainer])
        stack.axis = .horizontal
        stack.distribution = .fill
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

extension HomeTotalView: CodeView {
    func buildViewHierarchy() {
        // Add views(components)
        addSubview(horizontalContainer)
    }
    
    func setupConstraints() {
        // Setup constraints
        image.snp.makeConstraints { make in
            make.height.width.equalTo(20)
            make.left.equalTo(40)
        }
        
        horizontalContainer.snp.makeConstraints { make in
            make.left.top.bottom.right.equalToSuperview()
        }
        
        verticalContainer.snp.makeConstraints { make in
            make.height.equalToSuperview()
        }
    }
    
    func setupAdditionalConfiguration() {
        // Additional configurations
    }
}
