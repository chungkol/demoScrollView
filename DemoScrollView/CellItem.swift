//
//  CellItem.swift
//  DemoScrollView
//
//  Created by Chung on 9/10/16.
//  Copyright © 2016 newayplus. All rights reserved.
//

import UIKit

class CellItem: UICollectionViewCell {
    var nameLabel: UILabel!
    var imageView: UIImageView!
    var price: UILabel!
    var kPriceLabelHeight: CGFloat = 30
    var kCellWidth: CGFloat = 100
    var kLabelHeight: CGFloat = 30
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    func addSubViews(){
        if imageView == nil {
            imageView = UIImageView(frame: CGRectMake(0, 0, kCellWidth, kCellWidth))
            imageView.layer.borderColor = tintColor.CGColor
            imageView.contentMode = .ScaleAspectFit
            contentView.addSubview(imageView)
            
        }
        if nameLabel  == nil {
            nameLabel = UILabel(frame: CGRectMake(0, kCellWidth, kCellWidth, kLabelHeight))
            nameLabel.textAlignment = .Left
            nameLabel.textColor = UIColor.whiteColor()
            nameLabel.highlightedTextColor = tintColor
            nameLabel.font = UIFont.systemFontOfSize(10)
            nameLabel.numberOfLines = 2
            contentView.addSubview(nameLabel)
        }
        if price  == nil {
            price = UILabel(frame: CGRectMake(0, kCellWidth + kLabelHeight, kCellWidth, kLabelHeight))
            price.textAlignment = .Left
            price.textColor = UIColor.orangeColor()
            price.highlightedTextColor = tintColor
            price.font = UIFont.boldSystemFontOfSize(12)
            price.numberOfLines = 1
            contentView.addSubview(price)
        }
        
    }
    override var selected: Bool{
        didSet{
            imageView.layer.borderWidth = selected ? 2: 0
        }
    }
}
