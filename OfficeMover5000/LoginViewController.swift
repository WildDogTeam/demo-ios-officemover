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

    let ref = Wilddog(url: OfficeMoverWilddogUrl)
    var authData: WAuthData?
    var authHandler: Int64!
    
    @IBOutlet var btLogin: UIButton!
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
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
        autoLogin()
    }
    
    // Automatically perform segue when Wilddog says authenticated
    func autoLogin() {
        // If we already have an auth observer, remove that one.
        //TODO:
        if authHandler != nil {
            ref.removeAuthEventObserverWithHandle(authHandler)
        }
        // Automatically log in when we are auth'd
        authHandler = ref.observeAuthEventWithBlock({
            [unowned self] authData in
            if authData != nil {
                self.ref.removeAuthEventObserverWithHandle(self.authHandler)
                self.performSegueWithIdentifier("LOGGED_IN", sender: self)
            }
        })
    }
    
    // Fire off log in with Anonymous.
    @IBAction func login(sender: AnyObject) {
        
        [ref.authAnonymouslyWithCompletionBlock({ (error, authData) -> Void in
            self.performSegueWithIdentifier("LOGGED_IN", sender: self)
        })]
        
    }
}