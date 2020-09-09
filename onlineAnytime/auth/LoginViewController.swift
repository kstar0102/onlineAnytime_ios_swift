import UIKit
import Alamofire
import CoreData

class LoginViewController: UIViewController {
    private var userinfo : [UserData] = []
    private var formdata : [FormData] = []
    @IBOutlet weak var passEdit: UITextField!
    @IBOutlet weak var eamilEdit: UITextField!
    var apilist:[Any] = []
    var Eapilist:[Any] = []
    var EOapilist:[Any] = []
    var Token:String = ""
    var checksum:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if(formdata.count > 0){
            formdata = UserLocal.getFDatas()
            checksum = formdata[0].checksum!
        }

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
        if(userinfo.count != 0){
            if(userinfo[userinfo.count - 1].useremail == self.eamilEdit.text!){
                if(userinfo[userinfo.count - 1].userpass == self.passEdit.text!){
                    self.Token = userinfo[userinfo.count - 1].token!
                    print("local database")
                    self.LoadData()
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
                            self.Token = (value["token"] as? String)!
                            //save data to coredata
                            UserLocal.saveContext()
                            
                            self.LoadData()
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
    
//    func delete(entityName: String) {
//        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return}
//        let managedContext = appDelegate.persistentContainer.viewContext
//
//        let deleteFetch = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
//        let deleteRequest = NSBatchDeleteRequest(fetchRequest: deleteFetch)
//
//        do {
//            try managedContext.execute(deleteRequest)
//            try managedContext.save()
//        } catch {
//            print ("There was an error")
//        }
//    }
    
    func LoadData(){
        let headers = ["Content-Type": "application/json", "token" : Token]
        Alamofire.request(Common.mainItemUrl, method: .get, encoding : JSONEncoding.default, headers: headers).responseJSON{ response in
            DispatchQueue.main.async {
                if let value = response.value as? [String: AnyObject] {
                    let result = value["success"] as! Int
                    if(result == 1){
                        let formdata = UserLocal.getFEDatas()
                        if(formdata.count > 0){
                            UserLocal.delete(entityName: "FormData")
                            UserLocal.delete(entityName: "FormElementData")
                            UserLocal.delete(entityName: "FormElementOptionData")
                        }
                        print("api load data")
                        let apichecksum = value["checksum"] as! String
                        print(apichecksum)
                        if(self.checksum != apichecksum){
                            print("not equal chacksum")
                            self.apilist = value["forms"] as! [Any]
                            for i in 0...self.apilist.count - 1 {
                                self.insertFdata(i: i, checksum: value["checksum"] as! String)
                                self.FelementSave(i: i);
                            }
                            self.FelementOpitonSave()
                            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                            let newViewController = storyBoard.instantiateViewController(withIdentifier: "mainView") as! MainViewController
                            self.present(newViewController, animated: true, completion: nil)
                        }else{
                            print("equal check sum")
                            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                            let newViewController = storyBoard.instantiateViewController(withIdentifier: "mainView") as! MainViewController
                            self.present(newViewController, animated: true, completion: nil)
                        }
                        
                    }else{
                        Common.NoticeAlert(vc: self, Ntitle: Common.error, Nmessage: "Oops, can't login! please try to login again.")
                    }
                }
                else{
//                    Common.NoticeAlert(vc: self, Ntitle: "Error", Nmessage: Common.offlineLb + "or Request faild")
                    let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                    let newViewController = storyBoard.instantiateViewController(withIdentifier: "mainView") as! MainViewController
                    self.present(newViewController, animated: true, completion: nil)
                }
            }
        }
    }
    
    func insertFdata(i: Int, checksum:String){
        let fData = FormData(context: UserLocal.persistentContainer.viewContext);
        
        let dict = self.apilist[i] as? [String: Any]
        fData.ftitle = (dict!["form_name"] as! String)
        fData.fid = String(dict!["form_id"] as! Int)
        fData.fdes = (dict!["form_description"] as! String)
        fData.checksum = checksum
        
        UserLocal.saveContext()
    }
    
    func FelementSave(i: Int){
        let dict = self.apilist[i] as? [String: Any]
        var formId:String = ""
        formId = String(dict!["form_id"] as! Int)
        let Url = URL(string: Common.formItemUrl + formId)
        let headers    = ["Content-Type": "application/json", "token" : Token]
        
        Alamofire.request(Url!, method: .get, encoding : JSONEncoding.default, headers: headers).responseJSON{ response in
            DispatchQueue.main.async {
                if let value = response.value as? [String: AnyObject] {
                    let result = value["success"] as! Int
                    if(result == 1){
                        self.Eapilist = value["forms"] as! [Any]
                        for i in 0...self.Eapilist.count - 1 {
                            let fEData = FormElementData(context: UserLocal.persistentContainer.viewContext);
                            let Eict = self.Eapilist[i] as? [String: Any]
                            
                            fEData.fid = formId
                            fEData.element_id = String(Eict!["element_id"] as! Int)
                            fEData.element_type = (Eict!["element_type"] as! String)
                            fEData.element_title = (Eict!["element_title"] as! String)
                            fEData.element_pageNum = String(Eict!["element_page_number"] as! Int)
                            fEData.element_mediaType = (Eict!["element_media_type"] as! String)
                            fEData.element_position = String(Eict!["element_position"] as! Int)
                            fEData.element_guidelines = (Eict!["element_guidelines"] as! String)
                            fEData.element_addressLine2 = String(Eict!["element_address_hideline2"] as! Int)
                            
                            if((Eict!["element_constraint"] as? String) != nil){
                                fEData.element_constraint = (Eict!["element_constraint"] as! String)
                            }else{
                                fEData.element_constraint = ""
                            }
                            
                            if((Eict!["element_media_pdf_src"] as? String) != nil){
                                fEData.element_mediaPdfSrc = (Eict!["element_media_pdf_src"] as! String)
                            }else{
                                fEData.element_mediaPdfSrc = ""
                            }
                            
                            if((Eict!["element_default_value"] as? String) != nil){
                                fEData.element_defaultValue = (Eict!["element_default_value"] as! String)
                            }else{
                                fEData.element_defaultValue = ""
                            }
                            
                            if((Eict!["element_media_image_src"] as? String) != nil){
                                fEData.element_mediaImageSrc = (Eict!["element_media_image_src"] as! String)
                            }else{
                                fEData.element_mediaImageSrc = ""
                            }
                        }
                    }else{
                        Common.NoticeAlert(vc: self, Ntitle: Common.error, Nmessage: "Oops, can't login! please try to login again.")
                    }
                }
                else{
                    Common.NoticeAlert(vc: self, Ntitle: "Error", Nmessage: Common.offlineLb + "or Request faild")
                }
            }
        }
    }
    
    func FelementOpitonSave(){
        let Url = URL(string: Common.FormItemOption_url)
        let headers    = ["Content-Type": "application/json", "token" : Token]
        
        Alamofire.request(Url!, method: .get, encoding : JSONEncoding.default, headers: headers).responseJSON{ response in
            DispatchQueue.main.async {
                if let value = response.value as? [String: AnyObject] {
                    let result = value["success"] as! Int
                    if(result == 1){
                        self.EOapilist = value["forms"] as! [Any]
                        for i in 0...self.EOapilist.count - 1 {
                            let fOData = FormElementOptionData(context: UserLocal.persistentContainer.viewContext);
                            let Oict = self.EOapilist[i] as? [String: Any]
                            fOData.fid = String(Oict!["form_id"] as! Int)
                            fOData.element_id = String(Oict!["element_id"] as! Int)
                            fOData.option_id = String(Oict!["option_id"] as! Int)
                            fOData.position = String(Oict!["position"] as! Int)
                            fOData.option_default = String(Oict!["option_is_default"] as! Int)
                            fOData.option = (Oict!["option"] as! String)
                        }
                    }else{
                        Common.NoticeAlert(vc: self, Ntitle: Common.error, Nmessage: "Oops, can't login! please try to login again.")
                    }
                }
                else{
                    Common.NoticeAlert(vc: self, Ntitle: "Error", Nmessage: Common.offlineLb + "or Request faild")
                }
            }
        }
    }
}
