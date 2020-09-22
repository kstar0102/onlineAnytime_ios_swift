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
    var userdata:[UserData] = []
    var formvalue:[FormValue] = []
    private var groupkey:NSMutableArray!
    private var grouplist:NSMutableArray!
    var menushowing = false
    var Token:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sideleading.constant = -280
        sidewidth.constant = 0
        logoleading.constant = -280
        
        userdata = UserLocal.getuserDatas()
        Token = userdata[userdata.count - 1].token!
        
        formvalue = UserLocal.getValueDatas()
        if(formvalue.count > 0){
            for i in 0...formvalue.count - 1 {
                let key = formvalue[i].elementType
                if(groupkey != nil){
                    if(!groupkey.contains(key!)){
                        groupkey.add(key!)
                    }
                    else{
                        continue
                    }
                }
            }
        }
        
        if(groupkey != nil){
            var value:[FormValue] = []
            for i in 0...groupkey.count - 1 {
                for j in 0...formvalue.count - 1 {
                    if(groupkey.object(at: i) as! String) == formvalue[j].elementType!{
                     value.append(formvalue[j])
                    }
                }
                grouplist.add(value)
            }
        }
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
        nameL.text = userdata[userdata.count - 1].username
        emailL.text = userdata[userdata.count - 1].useremail
        
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "MM/dd/yyyy HH:mm"

        let exactlyCurrentTime: Date = Date()

        // e.g Set your label text:
        dateL.text = dateFormatterPrint.string(from: exactlyCurrentTime)
        
        if(formvalue.count > 0){
            Common.NoticeAlert(vc: self, Ntitle: Common.error, Nmessage: "Success! Your submission has been saved!")
        }else{
            Common.NoticeAlert(vc: self, Ntitle: Common.error, Nmessage: "Oops, There is no data.")
        }
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
