//
//  CollectionViewController.swift
//  AutolayoutStudy
//
//  Created by jaekyung you on 2020/12/16.
//

import Foundation
import UIKit

class CollectionViewController: UIViewController {
    
    @IBOutlet weak var myCollectionView: UICollectionView!
    
    @IBOutlet weak var mySegment: UISegmentedControl!
    
    fileprivate let systemImageNameArray = [
           "moon", "zzz", "sparkles", "cloud", "tornado", "smoke.fill", "tv.fill", "gamecontroller", "headphones", "flame", "bolt.fill", "hare", "tortoise", "moon", "zzz", "sparkles", "cloud", "tornado", "smoke.fill", "tv.fill", "gamecontroller", "headphones", "flame", "bolt.fill", "hare", "tortoise", "ant", "hare", "car", "airplane", "heart", "bandage", "waveform.path.ecg", "staroflife", "bed.double.fill", "signature", "bag", "cart", "creditcard", "clock", "alarm", "stopwatch.fill", "timer"
       ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myCollectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        myCollectionView.delegate = self
        myCollectionView.dataSource = self
    }
    
}

// UICollectionViewDelegate : 액션 관련, UICollectionViewDataSource : 데이터 관련
extension CollectionViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return systemImageNameArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCollectionCell", for: indexPath) as! MyCollectionCell

        // CollectionViewCell에서 작업해도 됨 
//        cell.systemImage.image = UIImage(systemName: self.systemImageNameArray[indexPath.item]) // 이미지 설정
//        cell.systemLabel.text = self.systemImageNameArray[indexPath.item] // 라벨 설정
        cell.imageName = systemImageNameArray[indexPath.item]
        return cell
        
    }
}
