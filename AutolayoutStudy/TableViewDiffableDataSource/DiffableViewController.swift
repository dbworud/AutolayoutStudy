//
//  DiffableViewController.swift
//  AutolayoutStudy
//
//  Created by jaekyung you on 2020/12/18.
//

import Foundation
import UIKit

/*
To fill the table with data
 1. data source를 만듦
 2. cell provider를 통해서 어떤 cell을 사용할 것인지 정함
 3. data의 현상태 생성(스냅샷)
 4. UI에 데이터를 뿌림
*/

enum Section {
    case feed
    case post
    case board
}

// Diffable은 값이 유일해야 하므로 Hashable 프로토콜 차용
class Feed: Hashable {

    let uuid = UUID()
    var content: String
    init(content: String) {
        self.content = content
    }
    // Equatable에 대한
    static func == (lhs: Feed, rhs: Feed) -> Bool {
        lhs.uuid == rhs.uuid
    }
    // Hashable에 대한
    func hash(into hasher: inout Hasher) {
        hasher.combine(uuid)
    }
}

// struct는 값 타입이라 전혀 다른 새로운 값을 찍어내기 때문에 uuid나 관련 함수들이 필요 없음
struct Post: Hashable {
    var content: String
}

class DiffableViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    // UITableViewDataSourceDelegate을 대체
    var dataSource : UITableViewDiffableDataSource<Section, Feed>!
    
    // 현재 데이터 상태
    var snapShot : NSDiffableDataSourceSnapshot<Section, Feed>!
    
    // 1. data source를 만듦
    let feedArray = [
        Feed(content: "simply dummy text of the printing and"),
            
        Feed(content: "um has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type "),
            
        Feed(content: "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribestablished fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, co"),
            
        Feed(content: "ho loves pain itself, who seeks after it and wants to have it, simply because it is pai"),
            
        Feed(content: "established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, co"),
            
        Feed(content: "ho loves pain itself, who seeks after it and wants to have it, simply because it is pai"),
            
        Feed(content: "a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is thaai"),
            
        Feed(content: "ho loves pain ita reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is to have it, simply because it is pai"),
            
        Feed(content: "ho loves pain itself, who seeks after it and wants to have it, simplho loves pain ita reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is to have it, simply because it y because it is pai")
        ]
    
    override func viewDidLoad(){
        super.viewDidLoad()
        print("feedArrayCount: \(feedArray.count)")
        self.tableView.delegate = self
        
        // xib파일 가져와서 등록하기
        let tableViewCell = UINib(nibName: "TableViewCell", bundle: nil)
        self.tableView.register(tableViewCell, forCellReuseIdentifier: "TableViewCell")

        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.estimatedRowHeight = 120
        
        // 2. cell provider를 통해서 어떤 cell을 사용할 것인지 정함
        // UITableViewDataSourceDelegate 프로토콜부분과 동일
        dataSource = UITableViewDiffableDataSource<Section, Feed>(tableView: self.tableView, cellProvider: {
            (tableView: UITableView, indexPath: IndexPath, identifier: Feed) -> UITableViewCell? in
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
            
            return cell
        })
        
        // 3. data의 현상태 생성(스냅샷)
        snapShot = NSDiffableDataSourceSnapshot<Section, Feed>()
        snapShot.appendSections([.feed]) // 'feed' 섹션 추가
        snapShot.appendItems(feedArray, toSection: .feed) // 방금 추가한 섹션에 아이템 넣기, 서버에서 받았다면 서버에서 받은 아이템 추가
        
        // 4. UI에 데이터를 뿌림
        dataSource.apply(snapShot, animatingDifferences: true) // default는 true
        
    }
    
}

extension DiffableViewController: UITableViewDelegate {
    
}
