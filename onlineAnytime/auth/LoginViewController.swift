import UIKit
import Alamofire
import CoreData

class LoginViewController: UIViewController {
    private var userinfo : [UserData] = []
    @IBOutlet weak var passEdit: UITextField!
    @IBOutlet weak var eamilEdit: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func signinBtn(_ sender: Any) {
        if(self.eamilEdit.text! == "" || self.passEdit.text! == ""){
            Common.NoticeAlert(vc: self, Ntitle: Common.error, Nmessage: "Enter your Email and Password to login")
        }else{
            LoginFunc()
        }
    }
    @IBAction func forgetBtn(_ sender: Any) {
        let vc = RegisterViewController()
        vc.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(vc, animated: true)
        self.present(vc, animated: true, completion: nil)
    }
    
    func LoginFunc(){
        userinfo = UserLocal.getuserDatas()
        if(userinfo.count != nil){
            print(!)
            if(userinfo[userinfo.count - 1].useremail == self.eamilEdit.text!){
                if(userinfo[userinfo.count - 1].userpass == self.passEdit.text!){
                    let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                    let newViewController = storyBoard.instantiateViewController(withIdentifier: "mainView") as! MainViewController
                    self.present(newViewController, animated: true, completion: nil)
                }
            }
        }else{
            let parameters: Parameters = ["email": self.eamilEdit.text!, "password": self.passEdit.text! ]
            Alamofire.request(Common.loginUrl, method: .post, parameters: parameters).responseJSON{ response in
                DispatchQueue.main.async {
                    if let value = response.value as? [String: AnyObject] {
                        let result = value["success"] as! Int
                        if(result == 1){
                            let userData = UserData(context: UserLocal.persistentContainer.viewContext);
                            userData.username = value["user_fullname"] as? String
                            userData.useremail = self.eamilEdit.text!
                            userData.userpass = self.passEdit.text!
                            userData.token = value["token"] as? String

                            //save data to coredata
                            UserLocal.saveContext()
                            
                            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                            let newViewController = storyBoard.instantiateViewController(withIdentifier: "mainView") as! MainViewController
                            self.present(newViewController, animated: true, completion: nil)
                        }else{
                            Common.NoticeAlert(vc: self, Ntitle: Common.error, Nmessage: "Oops, can't login! please try to login again.")
                        }
                        print(value)
                    }
                    else{
                        Common.NoticeAlert(vc: self, Ntitle: "Error", Nmessage: Common.offlineLb + "or Request faild")
                    }
                }
            }
        }
    }
}
