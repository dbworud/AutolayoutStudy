//
//  ViewTransitionController.swift
//  AutolayoutStudy
//
//  Created by jaekyung you on 2020/12/22.
//

import UIKit

class FirstViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func didTapReplaceView(_ sender: Any) {
        
        let alert = UIAlertController(title: "Warning", message: "This would cause memory overflow.", preferredStyle: .alert)
        let okButton = UIAlertAction(title: "OK", style: .default) { action in
            print("okbutton pressed")
        }

        alert.addAction(okButton)

        present(alert, animated: true, completion: nil)
        
    }
    
    // 2. ViewController가 다른 ViewController modal방식으로 호출(present)
    @IBAction func didTapPresentVC(_ sender: Any) {
        let presentVC = self.storyboard?.instantiateViewController(withIdentifier: "PresentViewController")
        presentVC?.modalTransitionStyle = .coverVertical
        self.present(presentVC!, animated: true, completion: nil)
    }
    
    // 3. NavigationController 사용하여 화면 전환(push) 
    @IBAction func didTapPushVC(_ sender: Any) {
        if let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "PushViewController") {
            self.navigationController?.pushViewController(pushVC, animated: true)
        }
    }
    
    // 4. 화면전환용 객체 Segue 사용
    @IBAction func didTapSegueVC(_ sender: Any) {
        self.performSegue(withIdentifier: "showSegue", sender: self)
    }
    
}

// ViewTranstion 4가지 방법
// 1. ViewController의 View 바꿔치기: 메모리 overflow의 위험

class PresentViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}


class PushViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}

class SegueViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}

