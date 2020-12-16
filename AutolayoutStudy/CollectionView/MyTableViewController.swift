//
//  MyTableViewController.swift
//  AutolayoutStudy
//
//  Created by jaekyung you on 2020/12/16.
//

import Foundation
import UIKit


class MyTableViewController: UIViewController {
    
    @IBOutlet weak var myTableView: UITableView!
    
    let contentArray = [
            "simply dummy text of the printing and",
            
            "um has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type ",
            
            "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribestablished fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, co",
            
            "ho loves pain itself, who seeks after it and wants to have it, simply because it is pai",
            
            "established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, co",
            
            "ho loves pain itself, who seeks after it and wants to have it, simply because it is pai",
            
            "a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is thaai",
            
            "ho loves pain ita reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is to have it, simply because it is pai",
            
            "ho loves pain itself, who seeks after it and wants to have it, simplho loves pain ita reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is to have it, simply because it y because it is pai",
        ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // extension으로부터 delegate, datasource
        self.myTableView.delegate = self
        self.myTableView.dataSource = self
        
        // nib fetch
        let tableCell = UINib(nibName: "MyTableCell", bundle: nil)
        
        // nib register
        self.myTableView.register(tableCell, forCellReuseIdentifier: "MyTableCell")
        
        // 높이 자동 계산
        self.myTableView.rowHeight = UITableView.automaticDimension
        self.myTableView.estimatedRowHeight = 120
    }
    
}

extension MyTableViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contentArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyTableCell", for: indexPath) as! MyTableCell
        cell.userContent?.text = contentArray[indexPath.row]
        cell.userProfile.layer.cornerRadius = cell.userProfile.frame.height / 2
        return cell
        
    }
    
}
