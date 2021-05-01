//
//  TotalView.swift
//  Expenser
//
//  Created by Vitor Costa on 20/03/21.
//

import UIKit

final class HomeTotalView: UIView {
    
    private lazy var iconImage: UIImageView = {
        var view = UIImageView(frame: .zero)
        view.backgroundColor = .white
        view.contentMode = .scaleToFill
        view.layer.masksToBounds = true
        return view
    }()
    
    private lazy var clearImage: UIImageView = {
        var view = UIImageView(frame: .zero)
        view.backgroundColor = .clear
        return view
    }()
    
    private lazy var title: UILabel = {
        var label = UILabel(frame: .zero)
        label.textColor = .lightGray
        label.font = .preferredFont(forTextStyle: .callout)
        return label
    }()
    
    private lazy var value: UILabel = {
        var label = UILabel(frame: .zero)
        label.textColor = .white
        label.font = .systemFont(ofSize: 20)
        return label
    }()
    
    private lazy var verticalContainer: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [title, value])
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.spacing = 5
        return stack
    }()
    
    private lazy var imageContainer: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [iconImage, clearImage])
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.spacing = 5
        return stack
    }()
    
    private lazy var horizontalContainer: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [imageContainer, verticalContainer])
        stack.axis = .horizontal
        stack.distribution = .fill
        stack.spacing = 8
        return stack
    }()
    
    func setup(title: String, value: String, icon: UIImage) {
        self.title.text = title
        self.value.text = value
        self.iconImage.image = icon
    }
    
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
        iconImage.snp.makeConstraints { make in
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
        iconImage.makeRounded(height: 20)
    }
}
