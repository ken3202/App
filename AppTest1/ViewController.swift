//
//  ViewController.swift
//  AppTest1
//
//  Created by TsengBoKai on 2018/8/2.
//  Copyright © 2018年 crazyknow. All rights reserved.
//

import UIKit
import Firebase
class ViewController: UIViewController {

    @IBOutlet weak var createBut: UIButton!

    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
       // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func loginPressed(_ sender: Any) {
        Analytics.logEvent("logEvent", parameters: nil)
        
        if let email = emailField.text, let password = passwordField.text{
            Auth.auth().signIn(withEmail: email, password: password){ (user, error) in
                if let error = error {
                    print(error.localizedDescription)
                    return
                }
                self.performSegue(withIdentifier: "login", sender: nil)
            }
        }
         }

}

