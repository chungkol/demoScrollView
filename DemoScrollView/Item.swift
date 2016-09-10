//
//  Item.swift
//  DemoScrollView
//
//  Created by Chung on 9/10/16.
//  Copyright © 2016 newayplus. All rights reserved.
//

import Foundation
class Item: NSObject {
    var name: String?
    var content: String?
    var nameImages: [String] = []
    var price: String?
    init(name: String, content: String, nameImages: [String] , price: String) {
        self.name = name
        self.content = content
        self.nameImages = nameImages
        self.price = price
    }
}

