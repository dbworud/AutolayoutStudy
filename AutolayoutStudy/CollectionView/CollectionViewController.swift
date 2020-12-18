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
        
        //myCollectionView.translatesAutoresizingMaskIntoConstraints = false
        myCollectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        myCollectionView.delegate = self
        myCollectionView.dataSource = self
        
        // Compositional layout을 위해
        myCollectionView.collectionViewLayout = createCompositionalLayout()
    }
    
}
 
// MARK: - Compositional Layout 설정
// 1. itemSize설정 후 item 만들기 -> 2. item 감쌀 groupSize를 기반으로 group 만들기 -> 3. group을 감쌀 sectionSize기반으로 section 만들기
extension CollectionViewController {
    fileprivate func createCompositionalLayout() -> UICollectionViewLayout {
        // Compositional Layout 생성
        let layout = UICollectionViewCompositionalLayout {
            
            // 만들게되면 튜플 (키: 값, 키: 값)의 묶음으로 들어오고 반환하는 것은 NSCollectionLayoutSection
            (sectionIndex: Int, layoutEnvrionment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
            
            // 아이템에 대한 사이즈 - absolute: 고정값, estimated: 추측값, fraction: 비율
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1/3), heightDimension: .fractionalWidth(1.0))
            
            // 위에서 만든 사이즈로 아이템에 적용
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            
            // 아이템 간 간격
            item.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2)
            
            // 아이템들을 감싸고 있는 그룹 사이즈
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: itemSize.heightDimension) // 한 그룹 내에 3개의 아이템이 들어가고 높이는 아이템 높이와 동일
            
            // 그룹 사이즈로 그룹 만들기
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item, item, item])
            
            // 만든 그룹으로 섹션 만들기
            let section = NSCollectionLayoutSection(group: group)
            
            // 섹션에 대한 간격
            section.contentInsets = NSDirectionalEdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20)
            
            return section
        }
        
        return layout
    }
}

// UICollectionViewDelegate : 액션 관련, UICollectionViewDataSource : 데이터 관련
extension CollectionViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return systemImageNameArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCollectionCell", for: indexPath) as! MyCollectionCell
        

        
        cell.imageName = systemImageNameArray[indexPath.item]
        cell.contentView.backgroundColor = #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)
        cell.contentView.layer.cornerRadius = 8
        cell.contentView.layer.borderWidth = 1
        cell.contentView.layer.borderColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
        
        //        CollectionViewCell에서 작업해도 됨
//        cell.systemImage.image = UIImage(systemName: self.systemImageNameArray[indexPath.item]) // 이미지 설정
//        cell.systemLabel.text = self.systemImageNameArray[indexPath.item] // 라벨 설정
        
        return cell
        
    }
}
