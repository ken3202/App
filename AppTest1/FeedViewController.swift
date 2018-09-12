//
//  FeedViewController.swift
//  AppTest1
//
//  Created by TsengBoKai on 2018/8/4.
//  Copyright © 2018年 crazyknow. All rights reserved.
//

import UIKit
import Firebase
class FeedViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func SIgnOut(_ sender: Any) {
        do{
            try Auth.auth().signOut()
            let signInVC = self.storyboard?.instantiateViewController(withIdentifier: "loginVC")
            let delegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
            delegate.window?.rootViewController = signInVC
        }
        catch let signOutError as NSError{
            print("Error signing out \(signOutError)")
        }
        
    }
    
}
