//
//  ImageSliderView.swift
//  ImageSlider
//
//  Created by Karim Saad on 12/02/2023.
//  Copyright © 2023 Facebook. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI

class ImageSliderView : UIView,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    var list=[NSString]()
    var collection:UICollectionView!
    @objc var color: String = "" {
        didSet {
            print(data.count)
            self.backgroundColor = hexStringToUIColor(hexColor: color)
        }
    }
    
    @objc var data: [NSString] = [] {
        didSet {
            list.removeAll()
            list.append(contentsOf: data)
            if(collection != nil){
                collection.reloadData()
            }
        }
    }
    
    @objc var onChange: RCTBubblingEventBlock?
    
    override func draw(_ rect: CGRect) {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        collection=UICollectionView(frame: rect, collectionViewLayout: layout)
        collection.backgroundColor = .clear
        collection.register(ImageGalleryCell.self, forCellWithReuseIdentifier: "ImageCell")
        collection.delegate = self
        collection.dataSource = self
        
        collection.showsHorizontalScrollIndicator = false
        collection.showsVerticalScrollIndicator = false
        
        collection.isPagingEnabled = true
        addSubview(collection)
        
        sendEvent(index: 0)
        
    }
    
    func hexStringToUIColor(hexColor: String) -> UIColor {
        let stringScanner = Scanner(string: hexColor)
        
        if(hexColor.hasPrefix("#")) {
            stringScanner.scanLocation = 1
        }
        var color: UInt32 = 0
        stringScanner.scanHexInt32(&color)
        
        let r = CGFloat(Int(color >> 16) & 0x000000FF)
        let g = CGFloat(Int(color >> 8) & 0x000000FF)
        let b = CGFloat(Int(color) & 0x000000FF)
        
        return UIColor(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: 1)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return list.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCell", for: indexPath) as! ImageGalleryCell
        cell.image_.collection = collection
        cell.image_.display(url: list[indexPath.row] as String)
       
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collection.frame.width, height: collection.frame.height)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        sendEvent(index: collection.indexPathsForVisibleItems.first![1])
    }
    
    func sendEvent(index:Int){
        let event = ["data":index]
        onChange!(event)
    }
}
