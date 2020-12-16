//
//  CodeViewController.swift
//  AutolayoutStudy
//
//  Created by jaekyung you on 2020/12/15.
//

import Foundation
import UIKit


class CodeViewController : UIViewController {
    
    // 클로저로 뷰 설정
    var secondView: UIView = {
       let view = UIView()
        view.layer.cornerRadius = 5
        view.clipsToBounds = true // cornerRadius 자리 잘 잡도록
        view.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
    
        return view
    }()
    
    // 커스텀으로 뷰 설정
    var thirdView: CircleView = {
       let circleView = CircleView()
        circleView.backgroundColor = .systemYellow
        circleView.translatesAutoresizingMaskIntoConstraints = false
        return circleView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let firstView = UIView()
        firstView.translatesAutoresizingMaskIntoConstraints = false // = storyboard에서 autolayout 설정
        firstView.backgroundColor = .systemPink
        firstView.layer.cornerRadius = 30
        view.addSubview(firstView) // 최상단 뷰에 하위 뷰를 추가
        
        // 앵커를 건다 : x, y축, 가로, 세로크기
        firstView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        // 가로의 정중앙에 위치
        
        firstView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 200).isActive = true // top 사이의 간격 200
        
        // 뷰의 가로, 세로 크기 제공
        firstView.widthAnchor.constraint(equalToConstant: 300).isActive = true
        firstView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        
        self.view.addSubview(secondView)
        // .isActive = true 귀찮을 경우
        NSLayoutConstraint.activate([
            secondView.widthAnchor.constraint(equalToConstant: 100),
            secondView.heightAnchor.constraint(equalToConstant: 100),
            secondView.leadingAnchor.constraint(equalTo: firstView.leadingAnchor, constant: 10),
            secondView.topAnchor.constraint(equalTo: firstView.bottomAnchor, constant: 20)
        ])
        
//        secondView.widthAnchor.constraint(equalToConstant: 100).isActive = true
//        secondView.heightAnchor.constraint(equalToConstant: 100).isActive = true
//        secondView.leadingAnchor.constraint(equalTo: firstView.leadingAnchor, constant: 10).isActive = true
//        secondView.topAnchor.constraint(equalTo: firstView.bottomAnchor, constant: 20).isActive = true
//
        
        self.view.addSubview(thirdView)
        NSLayoutConstraint.activate([
            thirdView.widthAnchor.constraint(equalTo: secondView.widthAnchor, multiplier: 1.5), // 세컨뷰의 1.5배만큼
            thirdView.heightAnchor.constraint(equalTo: secondView.heightAnchor, multiplier: 1.5),
            thirdView.topAnchor.constraint(equalTo: firstView.bottomAnchor, constant: 100),
            thirdView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 80) // x축 정가운데서 +80(오른쪽으로 80만큼 이동)
        ])

    }
}

// SwiftUI의 preview를 debug 모드로 사용, UIKit에서 SwiftUI 사용하기
#if DEBUG
import SwiftUI
struct ViewControllerRepresentable: UIViewControllerRepresentable {
    
    typealias UIViewControllerType = UIViewController
    
    @available(iOS 13.0, *)
    func makeUIViewController(context: Context) -> UIViewController {
        CodeViewController()
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        
    }
}

struct CodeViewController_Previews: PreviewProvider {
    static var previews: some View {
        ViewControllerRepresentable()
            .previewDisplayName("SwiftUI Preview")
    }
}
#endif
