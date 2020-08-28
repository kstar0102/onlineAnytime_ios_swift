//
//  SplashViewController.swift
//  onlineAnytime
//
//  Created by Admin on 23/08/2020.
//  Copyright © 2020 Admin. All rights reserved.
//

import UIKit

class SplashViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            self.gotoNextScreen()
        }
    }
    
    func gotoNextScreen() {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "loginView") as! LoginViewController
//        let newViewController = storyBoard.instantiateViewController(withIdentifier: "formView") as! FormViewController
        self.present(newViewController, animated: true, completion: nil)
    }
}
