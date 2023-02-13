//
//  ImageCell.swift
//  ImageSlider
//
//  Created by Karim Saad on 12/02/2023.
//  Copyright © 2023 Facebook. All rights reserved.
//

import UIKit

class ImageCell: UICollectionViewCell {
    var image_:UIImageView!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        image_=UIImageView(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.height))
        print(frame.size)
        image_.layer.cornerRadius = 8
        image_.backgroundColor = .blue
        contentView.addSubview(image_)
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
