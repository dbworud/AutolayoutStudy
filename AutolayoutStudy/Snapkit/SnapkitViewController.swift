//
//  SnapkitViewController.swift
//  AutolayoutStudy
//
//  Created by jaekyung you on 2020/12/20.
//

// Autolayout을 코드로 작성 시 코드의 수를 줄여주는 라이브러리

import SnapKit
import UIKit

class SnapkitViewController: UIViewController {
    
    // 기존의 코드로 autolayou 짜기
    lazy var greenView = { () -> UIView in
        let view = UIView()
        view.backgroundColor = .green
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var blueView = { () -> UIView in
        let view = UIView()
        view.backgroundColor = .blue
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    lazy var yellowView = { () -> UIView in
        let view = UIView()
        view.backgroundColor = .yellow
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    lazy var redView = { () -> UIView in
        let view = UIView()
        view.backgroundColor = .red
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var mybutton = { (color: UIColor) -> UIButton in
        let btn = UIButton(type: .system)
        btn.backgroundColor = color
        btn.layer.cornerRadius = 16
        btn.setTitle("내 버튼", for: .normal)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        btn.setTitleColor(.white, for: .normal)
        return btn
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(yellowView)
        view.addSubview(redView)
        view.addSubview(greenView)
        view.addSubview(blueView)
        
        let darkGrayBtn = mybutton(.darkGray)
        view.addSubview(darkGrayBtn)
        /*
        NSLayoutConstraint.activate([
            yellowView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            yellowView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
            yellowView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 20),
            yellowView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -20)
        ])
        */
        
        // snapkit 사용
        yellowView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview().inset(UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20))
        }
        
        redView.snp.makeConstraints { (make) in
            make.width.height.equalTo(100) // 100x100
            make.top.equalTo(self.view.safeAreaLayoutGuide)
            make.centerX.equalToSuperview()
//            make.center.equalToSuperview() // 정중앙
        }
        
        blueView.snp.makeConstraints { (make) in
            make.width.equalTo(redView.snp.width).multipliedBy(2)
            make.height.equalTo(100)
            make.top.equalTo(redView.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
        }
        
        greenView.snp.makeConstraints { (make) in
            make.width.height.equalTo(100)
            make.centerX.equalToSuperview()
            self.greenViewOffset = make.top.equalTo(blueView.snp.top).offset(20).constraint
        }
        
        darkGrayBtn.snp.makeConstraints { (make) in
            make.width.equalTo(100)
            make.height.equalTo(50)
            make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom)
            make.centerX.equalToSuperview()
        }
        
        darkGrayBtn.addTarget(self, action: #selector(moveUp), for: .touchUpInside)
    }
    
    var offset = 0
    
    var greenViewOffset : Constraint? = nil
    
    @objc fileprivate func moveUp() {
        offset -= 40
        self.greenViewOffset?.update(offset: offset)
        print("moveUp() offset: \(offset)")
        
        UIViewPropertyAnimator(duration: 0.2, curve: .easeIn, animations: {
            self.view.layoutIfNeeded()
        }).startAnimation()
    }
    
                   
}


#if DEBUG
import SwiftUI

struct SnapkitViewControllerRepresentable : UIViewControllerRepresentable {
    
    func makeUIViewController(context: Context) -> UIViewController {
        SnapkitViewController()
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        
    }
    
}

struct SnapkitViewController_Previews : PreviewProvider {
    static var previews: some View {
        SnapkitViewControllerRepresentable()
            .ignoresSafeArea(.all, edges: .all)
            .previewDisplayName("미리보기")
    }
    
}



#endif
