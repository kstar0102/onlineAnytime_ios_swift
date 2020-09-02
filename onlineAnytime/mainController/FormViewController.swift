import UIKit

class FormViewController: UIViewController
, UITableViewDelegate
, UITableViewDataSource{
    
   
    @IBOutlet weak var titleL: UILabel!
    @IBOutlet var cellviewC: UITableViewCell!
    @IBOutlet var tableView: UITableView!
    @IBOutlet weak var maintitleL: UILabel!
    @IBOutlet weak var mainguideL: UILabel!
    
    var phoneWidth:Int = 0
    var titletext:String = ""
    var guidetext:String = ""
    static var table: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.alwaysBounceVertical = false
//        tableView.isScrollEnabled = false
        titleL.text = titletext
        maintitleL.text = titletext
        mainguideL.attributedText = guidetext.htmlToAttributedString
        
        let screenSize = UIScreen.main.bounds
        let screenWidth = screenSize.width
        phoneWidth = Int(screenWidth - 40)
        FormViewController.table = self.tableView
//        self.NumberLint()
       
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = cellviewC
        return cell!
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 1500
    }

    func NumberLint (){
        let numbertitle = UILabel()
        numbertitle.text = "numbertitle"
        self.cellviewC.contentView.addSubview(numbertitle)
//        self.cellviewC.translatesAutoresizingMaskIntoConstraints = false
        numbertitle.translatesAutoresizingMaskIntoConstraints = false
        numbertitle.numberOfLines = 30
        numbertitle.font = numbertitle.font.withSize(16)
        
        self.cellviewC.contentView.addConstraint(NSLayoutConstraint(item: numbertitle, attribute: .top, relatedBy: .equal, toItem: self.maintitleL, attribute: .bottom, multiplier: 1, constant: 10))
        self.cellviewC.contentView.addConstraint(NSLayoutConstraint(item: numbertitle, attribute: .leading, relatedBy: .equal, toItem: self.cellviewC, attribute: .leading, multiplier: 1, constant: 0))
        self.cellviewC.contentView.addConstraint(NSLayoutConstraint(item: numbertitle, attribute: .trailing, relatedBy: .equal, toItem: self.cellviewC, attribute: .trailing, multiplier: 1, constant: 0))
    }
    
    @IBAction func backBtn(_ sender: Any) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "mainView") as! MainViewController
        self.present(newViewController, animated: true, completion: nil)
    }
    
   
    
}

extension String {
    var htmlToAttributedString: NSAttributedString? {
        guard let data = data(using: .utf8) else { return nil }
        do {
            return try NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding:String.Encoding.utf8.rawValue], documentAttributes: nil)
        } catch {
            return nil
        }
    }
    var htmlToString: String {
        return htmlToAttributedString?.string ?? ""
    }
}
