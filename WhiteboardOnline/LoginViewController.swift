//
//  LoginViewController.swift
//  WhiteboardOnline
//
//  Created by Moto Shinriki on 2017/08/09.
//  Copyright © 2017年 Moto Shinriki. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var email: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func loginButtonTapped(_ sender: Any) {
		let isSuccess = ApiManager.login(email: email.text!, password: password.text!)
		loginSuccess()
    }
	
	func loginSuccess(){
		let storyboard = self.storyboard!
		let nextView = storyboard.instantiateViewController(withIdentifier: "groupTableView")
		let navi = UINavigationController(rootViewController: nextView)
		// アニメーションの設定
		// navi.modalTransitionStyle = .coverVertical
		present(navi, animated: true, completion: nil)
	}
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
