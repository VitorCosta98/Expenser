//
//  CellView.swift
//  Expenser
//
//  Created by Vitor Costa on 21/03/21.
//

import UIKit

final class HomeCellView: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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
        self.value.text = product.value
        self.date.text = product.date
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        setupView()
        setupShadow()
    }
    
    override func prepareForReuse() {
        setupShadow()
    }
    
    private func setupShadow() {
        contentView.layer.cornerRadius = 8
        contentView.layer.shadowOffset = CGSize(width: 1, height: 3)
        contentView.layer.shadowRadius = 10
        contentView.layer.shadowOpacity = 0.2
        contentView.layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        contentView.layer.shouldRasterize = true
        contentView.layer.rasterizationScale = UIScreen.main.scale
        contentView.layer.masksToBounds = true
    }
}

extension HomeCellView: CodeView {
    func buildViewHierarchy() {
        // Add views(components)
        addSubview(contentView)
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
            make.left.equalTo(contentView.snp_leftMargin).offset(10)
        }
        
        iconImage.snp.makeConstraints { make in
            make.width.height.equalTo(25)
            make.centerX.equalTo(roundedView.snp.centerX)
            make.centerY.equalTo(roundedView.snp.centerY)
        }
        
        title.snp.makeConstraints { make in
            make.left.equalTo(roundedView.snp_rightMargin).offset(15)
            make.top.equalTo(15)
        }
        
        date.snp.makeConstraints { make in
            make.left.equalTo(roundedView.snp_rightMargin).offset(15)
            make.top.equalTo(title.snp_bottomMargin).offset(8)
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
