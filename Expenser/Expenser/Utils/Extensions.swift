//
//  Extensions.swift
//  Expenser
//
//  Created by Vitor Costa on 24/04/21.
//

import UIKit

extension UIView {
    func makeRounded(height: CGFloat) {
        self.layer.masksToBounds = false
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.cornerRadius = height / 2
        self.clipsToBounds = true
    }
}

extension Date {
    var month: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM"
        return dateFormatter.string(from: self)
    }
    
    var year: Int {
        return Calendar.current.component(.year, from: self)
    }
}
