//
//  DialViewController.swift
//  AutolayoutStudy
//
//  Created by jaekyung you on 2020/12/15.
//

import Foundation
import UIKit

class DialViewController: UIViewController {
    
    @IBOutlet weak var phoneNumberLabel: UILabel!

    @IBOutlet var phoneNumberBtns: [CircleButton]!
    
    @IBOutlet weak var phoneCallBtn: CircleButton!
    
    // phoneNumber label 업데이트
    var phoneNumber = "" {
        didSet {
            // Main thread에서 돌릴 것이기 때문에
            DispatchQueue.main.async { [weak self] in // 메모리를 강하게 잡고있는 것을 막기위해 ARC
                self?.phoneNumberLabel.textColor = .black
                self?.phoneNumberLabel.text = self?.phoneNumber
            }
            // performSelector 방식도 있음
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for btn in phoneNumberBtns {
            btn.addTarget(self, action: #selector(numberClicked), for: .touchUpInside)
        }
        
        phoneCallBtn.addTarget(self, action: #selector(phoneCallBtnClicked), for: .touchUpInside)
        
    }
    
    @objc fileprivate func numberClicked(_ sender: UIButton) {
        guard let input = sender.titleLabel?.text else { return }
        phoneNumber.append(input)
    }
    
    @objc fileprivate func phoneCallBtnClicked(_ sender: UIButton) {
        phoneNumber.removeAll()
    }
}

// 인터페이스 빌더에서 디자인으로 확인가능하게끔
@IBDesignable class CircleButton : UIButton {
    
    // 인터페이스 패널에 필드를 하나 추가
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            // UIButton.layer의 
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = cornerRadius > 0 // 0보다 크다면 화면에서 바로 볼 수 있음.
        }
    }
}


