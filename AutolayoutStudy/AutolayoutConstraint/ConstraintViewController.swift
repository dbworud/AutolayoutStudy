//
//  ConstraintViewController.swift
//  AutolayoutStudy
//
//  Created by jaekyung you on 2020/12/16.
//

import Foundation
import UIKit

class ConstraintViewController : UIViewController {
    
    var someViewBottomConstraint: NSLayoutConstraint?
    
    override func loadView() {
        super.loadView()
        
        print("loadView() called")
        
        view.backgroundColor = .systemYellow
        
        let someView = UIView()
        someView.backgroundColor = UIColor(named: "pink")
        someView.layer.cornerRadius = 8
        someView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(someView)
        
        NSLayoutConstraint.activate([
            someView.widthAnchor.constraint(equalToConstant: 100),
            someView.heightAnchor.constraint(equalToConstant: 50),
            someView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
//            someView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
        // 버튼을 누를 때마다 bottomAnchor를 변경해줘야 함
        // 그러려면 우선 bottomAnchor를 fetch
        // item: 어떤 대상에 대해, attribute: 어떤 앵커
        someViewBottomConstraint = NSLayoutConstraint(item: someView, attribute: .bottom, relatedBy: .equal, toItem: self.view.safeAreaLayoutGuide, attribute: .bottom, multiplier: 1.0, constant: 0)
        
        someViewBottomConstraint?.isActive = true
        
        let upButton = UIButton(type: .system)
        upButton.translatesAutoresizingMaskIntoConstraints = false
        upButton.backgroundColor = .white
        upButton.setTitle("위로 올리기", for: .normal)
        upButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        upButton.layer.cornerRadius = 20
        upButton.tintColor = .black
        upButton.contentEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
         // padding
        upButton.addTarget(self, action: #selector(moveUp), for: .touchUpInside)
        
        self.view.addSubview(upButton)
        
        NSLayoutConstraint.activate([
            upButton.widthAnchor.constraint(equalToConstant: 180),
            upButton.heightAnchor.constraint(equalToConstant: 90),
            upButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            upButton.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 100)
        ])
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @objc fileprivate func moveUp() {
        
        print("moveUp() called")
        // 설정한 변수로 계속 업데이트 시켜주면 됨, 위로 올라가려면 - 아래로 내려가려면 +
        someViewBottomConstraint?.constant -= 100
        
        // Animation 처리
        UIViewPropertyAnimator(duration: 0.3, curve: .easeOut, animations: { [weak self] in
            self?.view.layoutIfNeeded() // 변경된 값이 있으면 다시 layout을 그려라
        }).startAnimation()
       
    }
}


#if DEBUG
import SwiftUI

struct ConstraintViewRepresentable : UIViewControllerRepresentable {
    
    func makeUIViewController(context: Context) -> UIViewController {
        ConstraintViewController()
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        
    }
    
}

struct ConstraintViewController_Previews : PreviewProvider {
    static var previews: some View {
        ConstraintViewRepresentable()
            .ignoresSafeArea(.all, edges: .all)
            .previewDisplayName("미리보기")
    }
    
}


#endif
