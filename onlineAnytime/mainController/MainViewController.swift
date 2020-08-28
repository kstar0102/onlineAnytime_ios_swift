import UIKit
import Alamofire
import CoreData

class MainViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{
    
    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var searchEdit: UISearchBar!
    private var userinfo : [UserData] = []
    private var grouplist:NSMutableArray!
    var apilist:[Any] = []
    var Eapilist:[Any] = []
    var EOapilist:[Any] = []
    
    var Token:String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        grouplist = NSMutableArray()
        userinfo = UserLocal.getuserDatas()
        Token  = userinfo[userinfo.count - 1].token!
        LoadData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableview.reloadData()
    }
    
    
    func LoadData(){
        let headers = ["Content-Type": "application/json", "token" : Token]
        
        Alamofire.request(Common.mainItemUrl, method: .get, encoding : JSONEncoding.default, headers: headers).responseJSON{ response in
            DispatchQueue.main.async {
                if let value = response.value as? [String: AnyObject] {
                    let result = value["success"] as! Int
                    if(result == 1){
                        self.apilist = value["forms"] as! [Any]
                        for i in 0...self.apilist.count - 1 {
                            self.insertFdata(i: i, checksum: value["checksum"] as! String)
                            self.FelementSave(i: i);
                        }
                        self.FelementOpitonSave()
                    }else{
                        Common.NoticeAlert(vc: self, Ntitle: Common.error, Nmessage: "Oops, can't login! please try to login again.")
                    }
                }
                else{
                    Common.NoticeAlert(vc: self, Ntitle: "Error", Nmessage: Common.offlineLb + "or Request faild")
                }
            }
        }
        self.tableview.reloadData()
    }
    
    func insertFdata(i: Int, checksum:String){
        let fData = FormData(context: UserLocal.persistentContainer.viewContext);
        let dict = self.apilist[i] as? [String: Any]
        grouplist.add(dict!["form_name"] as! String)
        
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
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.apilist.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mainCell", for: indexPath) as! CellTableViewCell
        let Oict = self.apilist[indexPath.row] as? [String: Any]
        cell.mainL.text = Oict!["form_name"] as? String
        return cell
    }
    
    @IBAction func sidemenu(_ sender: Any) {
    }
    
    @IBAction func clsoeBrn(_ sender: Any) {
        exit(0)
    }
    
}
