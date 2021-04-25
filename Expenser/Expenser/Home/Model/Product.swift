//
//  Product.swift
//  Expenser
//
//  Created by Vitor Costa on 28/03/21.
//

import UIKit

class Product {
    var image: UIImage
    var value: String
    var date: String
    var title: String
    
    init(image: UIImage, value: String, date: String, title: String) {
        self.image = image
        self.value = value
        self.date = date
        self.title = title
    }
}
