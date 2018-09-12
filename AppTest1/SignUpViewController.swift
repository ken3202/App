//
//  SignUpViewController.swift
//  AppTest1
//
//  Created by TsengBoKai on 2018/8/2.
//  Copyright © 2018年 crazyknow. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
class SignUpViewController: UIViewController {

    @IBOutlet weak var emailField: UITextField!
    
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var passwordConfirm: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func SignBut(_ sender: Any) {
            if let email = emailField.text, let password = password.text, let passwordconfirm = passwordConfirm.text{
                if password == passwordconfirm{
                    Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
                        if let error = error {
                            print(error.localizedDescription)
                            return
                        }
                     print("\(String(describing: user?.user.email)) created")
                        let vc = self.storyboard?.instantiateViewController(withIdentifier: "tabBarVC")
                        self.present(vc!, animated: true, completion: nil)
                    }
                            
                } else{
                            print("Password didn't match")
                        }
        } else{
                print("Password can't empty")
                
        }
        }
        }







