//
//  tableViewCell.swift
//  AutolayoutStudy
//
//  Created by jaekyung you on 2020/12/18.
//

import Foundation
import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var userProfile: UIImageView!
    @IBOutlet weak var userContent: UILabel!
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
}
