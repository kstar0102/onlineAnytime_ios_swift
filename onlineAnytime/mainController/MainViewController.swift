import UIKit
import Alamofire
import CoreData

class MainViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{
    
    @IBOutlet weak var logoleading: NSLayoutConstraint!
    @IBOutlet weak var leading: NSLayoutConstraint!
    @IBOutlet weak var useremailL: UILabel!
    @IBOutlet weak var sidemenuWidth: NSLayoutConstraint!
    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var searchEdit: UISearchBar!
    private var userinfo : [UserData] = []
    private var grouplist:NSMutableArray!
    private var formdate : [FormData] = []
    static var tabletag: UITableView!
    
    var menushowing = false;
    
    let blogSegueIdentifier = "goform"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        grouplist = NSMutableArray()
        userinfo = UserLocal.getuserDatas()
        self.tableview.delegate = self
        self.tableview.dataSource = self
        MainViewController.tabletag = self.tableview
        leading.constant = -280
        logoleading.constant = -280
        sidemenuWidth.constant = 0
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        formdate = UserLocal.getFDatas()
        tableview.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return formdate.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mainCell", for: indexPath) as! CellTableViewCell
        let st = formdate[indexPath.row].ftitle
        cell.mainL.text = st!
        cell.fomrid = formdate[indexPath.row].fid!
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let st = formdate[indexPath.row].ftitle
        let gt = formdate[indexPath.row].fdes
        let ft = formdate[indexPath.row].fid
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "formView") as! FormViewController
        newViewController.titletext = st!
        newViewController.guidetext = gt!
        newViewController.formid = ft!
        self.present(newViewController, animated: true, completion: nil)
    }
    
    @IBAction func sidemenu(_ sender: Any){
        if(menushowing){
            leading.constant = -280
            logoleading.constant = -280
            sidemenuWidth.constant = 0
        }else{
            leading.constant = 0
            logoleading.constant = 0
            sidemenuWidth.constant = 280
        }
        menushowing = !menushowing
    }
    
    @IBAction func clsoeBrn(_ sender: Any) {
        exit(0)
    }
    
    @IBAction func mycourseBtn(_ sender: Any) {
    }
    @IBAction func settingBtn(_ sender: Any) {
        let vc = SettingViewController()
        vc.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(vc, animated: true)
        self.present(vc, animated: true, completion: nil)
    }
    @IBAction func logoutBtn(_ sender: Any) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "loginView") as! LoginViewController
        self.present(newViewController, animated: true, completion: nil)
    }
    
}
