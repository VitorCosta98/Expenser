//
//  CategoriesCellView.swift
//  Expenser
//
//  Created by Vitor Costa on 01/05/21.
//

import UIKit

final class CategoriesCellView: UITableViewCell {
    
    let colors: [UIColor] = [.blue, .brown, .cyan, .yellow, .purple, .magenta, .green, .gray, .orange, .red, .systemIndigo, .systemPink, .systemTeal]
    
    private lazy var roundedView: UIView = {
        let view = UIView(frame: .zero)
        return view
    }()
    
    private lazy var iconImage: UIImageView = {
        var view = UIImageView(frame: .zero)
        view.backgroundColor = .clear
        view.contentMode = .scaleAspectFill
        view.contentScaleFactor = 0.5
        return view
    }()
    
    private lazy var editImage: UIImageView = {
        var view = UIImageView(frame: .zero)
        view.backgroundColor = .clear
        view.contentMode = .scaleAspectFill
        view.contentScaleFactor = 0.5
        guard let image = UIImage(named: "next") else { return UIImageView() }
        view.image = image
        return view
    }()
    
    private lazy var title: UILabel = {
        var label = UILabel(frame: .zero)
        label.textAlignment = .center
        label.textColor = .black
        label.font = .systemFont(ofSize: 18)
        return label
    }()
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        setupView()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(category: Category) {
        iconImage.image = category.icon
        title.text = category.name
        
        roundedView.backgroundColor = colors.randomElement()?.withAlphaComponent(0.5)
    }
}

extension CategoriesCellView: CodeView {
    func buildViewHierarchy() {
        // Add views(components)
        addSubview(roundedView)
        addSubview(iconImage)
        addSubview(title)
        addSubview(editImage)
    }
    
    func setupConstraints() {
        // Setup constraints
        contentView.snp.makeConstraints { make in
            make.left.equalTo(10)
            make.top.bottom.equalTo(0)
            make.right.equalTo(-10)
        }
        
        roundedView.snp.makeConstraints { make in
            make.width.height.equalTo(50)
            make.top.equalTo(10)
            make.left.equalTo(contentView.snp.leftMargin).offset(10)
        }
        
        iconImage.snp.makeConstraints { make in
            make.width.height.equalTo(25)
            make.centerX.equalTo(roundedView.snp.centerX)
            make.centerY.equalTo(roundedView.snp.centerY)
        }
        
        title.snp.makeConstraints { make in
            make.left.equalTo(roundedView.snp.rightMargin).offset(15)
            make.centerY.equalTo(roundedView.snp.centerY)
        }
        
        editImage.snp.makeConstraints { make in
            make.height.width.equalTo(15)
            make.right.equalTo(-15)
            make.centerY.equalTo(contentView.snp.centerY)
        }
    }
    
    func setupAdditionalConfiguration() {
        // Additional configurations
        contentView.backgroundColor = .white
        
        roundedView.makeRounded(height: 50)
        iconImage.layer.masksToBounds = true
    }
}
