//
//  LoginViewController.swift
//  OfficeMover500
//
//  Created by Garin on 11/2/15.
//  Copyright (c) 2015 Wilddog. All rights reserved.
//

import UIKit
import Wilddog

class LoginViewController: UIViewController{

    var ref : WDGSyncReference!
    var auth : WDGAuth!
    var authHandler: WDGAuthStateDidChangeListenerHandle!
    
    @IBOutlet var btLogin: UIButton!
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        //获取一个指向根节点的 WDGSyncReference 实例
        ref = WDGSync.sync().reference()
        auth = WDGAuth.auth()
        
        // Set the nav bar appearance
        navigationItem.setHidesBackButton(true, animated: false)
        if let nav = self.navigationController?.navigationBar {
            nav.barTintColor = TopbarBlue
            nav.barStyle = UIBarStyle.Default
            nav.tintColor = UIColor.whiteColor()
            nav.titleTextAttributes = [
                NSForegroundColorAttributeName: UIColor.whiteColor(),
                NSFontAttributeName:ProximaNovaLight20
            ]
        }
        
        // Handle cached Wilddog auth
//        autoLogin()
    }
    
//    // Automatically perform segue when Wilddog says authenticated
//    func autoLogin() {
//        // If we already have an auth observer, remove that one.
//        if authHandler != nil {
//            auth!.removeAuthStateDidChangeListener(authHandler)
//        }
//        // Automatically log in when we are auth'd
//        authHandler = auth?.addAuthStateDidChangeListener({ (listenAuth, listenUser) in
//            if listenUser != nil {
//                if self.authHandler != nil{
//                    self.auth?.removeAuthStateDidChangeListener(self.authHandler)
//                    self.performSegueWithIdentifier("LOGGED_IN", sender: self)
//                }
//            }
//        })
//    }
    
    // Fire off log in with Anonymous.
    @IBAction func login(sender: AnyObject) {
        
        [auth!.signInAnonymouslyWithCompletion({ (user, error) -> Void in
            self.performSegueWithIdentifier("LOGGED_IN", sender: self)
        })]
        
    }
}