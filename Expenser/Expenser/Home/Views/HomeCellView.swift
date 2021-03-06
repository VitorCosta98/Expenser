//
//  CellView.swift
//  Expenser
//
//  Created by Vitor Costa on 21/03/21.
//

import UIKit

final class HomeCellView: UITableViewCell {
    
    let colors: [UIColor] = [.blue, .brown, .cyan, .yellow, .purple, .magenta, .green, .gray, .orange, .red, .systemIndigo, .systemPink, .systemTeal]
    
    private lazy var roundedView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = UIColor.yellow.withAlphaComponent(0.5)
        return view
    }()
    
    private lazy var iconImage: UIImageView = {
        var view = UIImageView(frame: .zero)
        view.backgroundColor = .clear
        view.contentMode = .scaleAspectFill
        view.contentScaleFactor = 0.5
        return view
    }()
    
    private lazy var title: UILabel = {
        var label = UILabel(frame: .zero)
        label.textAlignment = .center
        label.textColor = .black
        label.font = .systemFont(ofSize: 18)
        return label
    }()
    
    private lazy var date: UILabel = {
        var label = UILabel(frame: .zero)
        label.textAlignment = .center
        label.textColor = .lightGray
        label.font = .systemFont(ofSize: 15)
        return label
    }()
    
    private lazy var value: UILabel = {
        var label = UILabel(frame: .zero)
        label.textColor = .red
        label.textAlignment = .right
        label.font = .systemFont(ofSize: 20)
        return label
    }()
    
    func setup(product: Product) {
        self.iconImage.image = product.image
        self.title.text = product.title
        self.value.text = Int(product.value) ?? 0 < 0 ? "- $\(product.value.replacingOccurrences(of: "-", with: ""))" : "+ $\(product.value)"
        self.value.textColor = Int(product.value) ?? 0 < 0 ? .red : .init(red: 0.4, green: 0.8, blue: 0.4, alpha: 1)
        self.date.text = product.date
        
        roundedView.backgroundColor = colors.randomElement()?.withAlphaComponent(0.5)
    }
    
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
}

extension HomeCellView: CodeView {
    func buildViewHierarchy() {
        // Add views(components)
        addSubview(roundedView)
        addSubview(iconImage)
        addSubview(title)
        addSubview(date)
        addSubview(value)
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
            make.top.equalTo(15)
        }
        
        date.snp.makeConstraints { make in
            make.left.equalTo(roundedView.snp.rightMargin).offset(15)
            make.top.equalTo(title.snp.bottomMargin).offset(8)
        }
        
        value.snp.makeConstraints { make in
            make.centerY.equalTo(contentView.snp.centerY)
            make.right.equalTo(contentView.snp.right).inset(10)
        }
    }
    
    func setupAdditionalConfiguration() {
        // Additional configurations
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 8
        contentView.clipsToBounds = true
        
        self.backgroundColor = .clear
        self.layer.cornerRadius = 8
        
        roundedView.makeRounded(height: 50)
        iconImage.layer.masksToBounds = true
    }
}
