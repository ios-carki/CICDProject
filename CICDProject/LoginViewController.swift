//
//  LoginViewController.swift
//  CICDProject
//
//  Created by Carki on 2022/11/29.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        descriptionLabel.accessibilityIdentifier = "desceiptionLabel"
    }
    

    @IBAction func loginButtonClikced(_ sender: UIButton) {
        
        descriptionLabel.text = "로그인 버튼을 눌렀습니다."
        
    }
    
}
