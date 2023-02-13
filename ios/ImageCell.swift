//
//  ImageCell.swift
//  ImageSlider
//
//  Created by Karim Saad on 12/02/2023.
//  Copyright © 2023 Facebook. All rights reserved.
//

import UIKit

class ImageCell: UICollectionViewCell {
    var image_:ImageScrollView!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        image_=ImageScrollView(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.height))
        contentView.addSubview(image_)
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
