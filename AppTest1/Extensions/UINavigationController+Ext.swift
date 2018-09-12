//
//  UINavigationController+Ext.swift
//  AppTest1
//
//  Created by TsengBoKai on 2018/8/12.
//  Copyright © 2018年 crazyknow. All rights reserved.
//

import UIKit

extension UINavigationController {
    
    open override var childViewControllerForStatusBarStyle: UIViewController? {
        return topViewController
    }
    
}
