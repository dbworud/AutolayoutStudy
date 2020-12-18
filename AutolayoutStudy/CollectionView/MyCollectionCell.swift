//
//  MyCollectionCell.swift
//  AutolayoutStudy
//
//  Created by jaekyung you on 2020/12/16.
//

import Foundation
import UIKit


class MyCollectionCell: UICollectionViewCell {
    
    @IBOutlet weak var systemImage: UIImageView!
    
    @IBOutlet weak var systemLabel: UILabel!
    
    var imageName: String = "" {
        didSet {
            self.systemImage.image = UIImage(systemName: imageName) // 이미지 설정
            self.systemLabel.text = self.imageName // 라벨 설정
        }
    }

}
