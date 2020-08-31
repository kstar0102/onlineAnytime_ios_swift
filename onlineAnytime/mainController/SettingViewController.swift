//
//  SettingViewController.swift
//  onlineAnytime
//
//  Created by Admin on 29/08/2020.
//  Copyright © 2020 Admin. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController {

    @IBOutlet weak var sidewidth: NSLayoutConstraint!
    @IBOutlet weak var logoleading: NSLayoutConstraint!
    @IBOutlet weak var sideleading: NSLayoutConstraint!
    @IBOutlet weak var dateL: UILabel!
    @IBOutlet weak var emailL: UILabel!
    @IBOutlet weak var nameL: UILabel!
    
    var menushowing = false
    override func viewDidLoad() {
        super.viewDidLoad()
        sideleading.constant = -280
        sidewidth.constant = 0
        logoleading.constant = -280
    }
    @IBAction func menuBtn(_ sender: Any) {
        if(menushowing){
            sideleading.constant = -280
            sidewidth.constant = 0
            logoleading.constant = -280
        }else {
            sideleading.constant = 0
            sidewidth.constant = 280
            logoleading.constant = 0
        }
        menushowing = !menushowing
    }
    @IBAction func syncBtn(_ sender: Any) {
    }
    @IBAction func courseBtn(_ sender: Any) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "mainView") as! MainViewController
        self.present(newViewController, animated: true, completion: nil)
    }
    @IBAction func logoutBtn(_ sender: Any) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "loginView") as! LoginViewController
        self.present(newViewController, animated: true, completion: nil)
    }
}
