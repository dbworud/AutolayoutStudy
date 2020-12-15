//
//  CircleView.swift
//  AutolayoutStudy
//
//  Created by jaekyung you on 2020/12/15.
//

import Foundation
import UIKit

class CircleView : UIView {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        print("CircleView called")
        layer.cornerRadius = self.frame.width / 2
    }
    
}
