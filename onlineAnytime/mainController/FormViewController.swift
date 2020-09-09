import UIKit
import iOSDropDown
import SwiftSignatureView
import CoreData

class FormViewController: UIViewController
, UITableViewDelegate
, UITableViewDataSource
, UITextFieldDelegate
, SSRadioButtonControllerDelegate{
    
   
    @IBOutlet weak var titleL: UILabel!
    @IBOutlet var cellviewC: UITableViewCell!
    @IBOutlet var tableView: UITableView!
    @IBOutlet weak var maintitleL: UILabel!
    @IBOutlet weak var mainguideL: UILabel!
    
    var phoneWidth:Int = 0
    var titletext:String = ""
    var guidetext:String = ""
    var unchecked = true
    static var table: UITableView!
    var formid:String = ""
    var maxPageNum:Int = 0
    var nowPage:Int = 0
    var signature = Canvas()
    var radioButtonController: SSRadioButtonsController?
    var formelement:[FormElementData] = []
    var beforetype:String = ""
    var beforeobject:AnyObject = UILabel()
    private var groupkey:NSMutableArray!
    private var grouplist:NSMutableArray!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.alwaysBounceVertical = false
        FormViewController.table = tableView
        
        groupkey = NSMutableArray()
        grouplist = NSMutableArray()
        
        titleL.text = titletext
        maintitleL.text = titletext
        mainguideL.attributedText = guidetext.htmlToAttributedString
        
        let screenSize = UIScreen.main.bounds
        let screenWidth = screenSize.width
        phoneWidth = Int(screenWidth - 40)
        
        groupkey?.removeAllObjects()
        grouplist?.removeAllObjects()
//        self.NumberLint()
        
        formelement = UserLocal.getSFEDatas(formid: formid)
        if(formelement.count > 0){
            for i in 0...formelement.count - 1{
                let pagenum = formelement[i].element_pageNum
                if(groupkey != nil){
                    if(!groupkey.contains(pagenum!)){
                        groupkey.add(pagenum!)
                    }else{
                        continue
                    }
                }
            }
        }
        
        maxPageNum = groupkey.count
        
        if(groupkey != nil){
           for i in 0 ..< groupkey.count{
               var formEle:[FormElementData] = []
               for j in 0 ..< formelement.count {
                if(groupkey.object(at: i) as! String) == formelement[j].element_pageNum!{
                    formelement[j].element_position = (String)(Int(formelement[j].element_position!)! + 1000)
                    formEle.append(formelement[j])
                   }
               }
            formEle.sort(){$0.element_pageNum! < $1.element_pageNum!}
               grouplist.add(formEle)
            }
        }
        showElemnet(PageNum: nowPage)
    }
    
    func showElemnet(PageNum:Int){
        let tododatas = self.grouplist.object(at: PageNum) as! [FormElementData]
        
        for i in 0 ... tododatas.count - 1{
            let j = i - 1
            if(j < 0){
                beforetype = "maintitle"
            }else{
                beforetype = tododatas[j].element_type!
            }
            switch tododatas[i].element_type {
                case "number":
                    NumberLint(title: tododatas[i].element_title!, id:tododatas[i].element_id!, position: tododatas[i].element_position!, beforetype: beforetype)
                case "europe_date":
                    DateLint(title: tododatas[i].element_title!, id:tododatas[i].element_id!, position: tododatas[i].element_position!, beforetype: beforetype)
                case "file":
                    FileLint(title: tododatas[i].element_title!, id:tododatas[i].element_id!, position: tododatas[i].element_position!, beforetype: beforetype)
                case "email":
                    EmailLint(title: tododatas[i].element_title!, id:tododatas[i].element_id!, position: tododatas[i].element_position!, beforetype: beforetype)
                case "money":
                    MoneyLint(title: tododatas[i].element_title!, id:tododatas[i].element_id!, position: tododatas[i].element_position!, beforetype: beforetype)
                case "text":
                    TextLint(title: tododatas[i].element_title!, id:tododatas[i].element_id!, position: tododatas[i].element_position!, beforetype: beforetype)
                case "signature":
                    SingatureLint(title: tododatas[i].element_title!, id:tododatas[i].element_id!, position: tododatas[i].element_position!, beforetype: beforetype)
                case "simple_name":
                    SimplenameLint(title: tododatas[i].element_title!, id:tododatas[i].element_id!, position: tododatas[i].element_position!, beforetype: beforetype)
                case "media":
                    MediaLint(title: tododatas[i].element_title!, type: tododatas[i].element_type!, imagesrc: tododatas[i].element_mediaImageSrc!, pdfsrc: tododatas[i].element_mediaPdfSrc!, position: tododatas[i].element_position!, beforetype: beforetype)
                case "phone":
                    PhoneLint(title: tododatas[i].element_title!, id:tododatas[i].element_id!, position: tododatas[i].element_position!, beforetype: beforetype)
                case "date":
                    DateLint(title: tododatas[i].element_title!, id:tododatas[i].element_id!, position: tododatas[i].element_position!, beforetype: beforetype)
                case "select":
                    SelectLint(title: tododatas[i].element_title!, id:tododatas[i].element_id!, position: tododatas[i].element_position!, beforetype: beforetype)
                case "checkbox":
                    CheckboxLint(title: tododatas[i].element_title!, id:tododatas[i].element_id!, position: tododatas[i].element_position!, beforetype: beforetype)
                case "radio":
                    RadioLint(title: tododatas[i].element_title!, id:tododatas[i].element_id!, position: tododatas[i].element_position!, beforetype: beforetype)
                case "time":
                    TimeLint(title: tododatas[i].element_title!, id:tododatas[i].element_id!, position: tododatas[i].element_position!, beforetype: beforetype)
                case "url":
                    UrlLint(title: tododatas[i].element_title!, id:tododatas[i].element_id!, position: tododatas[i].element_position!, beforetype: beforetype)
                case "textarea":
                    TextareaLint(title: tododatas[i].element_title!, id:tododatas[i].element_id!, position: tododatas[i].element_position!, beforetype: beforetype)
                case "page_break":
                    PagebreakLint(id:tododatas[i].element_id!, position: tododatas[i].element_position!, beforetype: beforetype)
                case "address":
                    AddressLint(title: tododatas[i].element_title!, id:tododatas[i].element_id!, checkline: tododatas[i].element_addressLine2!, position: tododatas[i].element_position!, beforetype: beforetype)
                case "matrix":
                    MatrixLint(title: tododatas[i].element_title!, id:tododatas[i].element_id!,guide: tododatas[i].element_guidelines!
                        , position: tododatas[i].element_position!, beforetype: beforetype, contraint: tododatas[i].element_constraint!)
                default:
                    SectionLint(title: tododatas[i].element_title!, id:tododatas[i].element_id!, position: tododatas[i].element_position!, beforetype: beforetype)
            }
            
        }
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
    
    func NumberLint (title:String, id:String, position:String, beforetype:String){
        print("numberlint" + position)
        beforeObject(beforeObject: beforetype, beforeId: Int(position)! - 1)
        let titleid = Int(position)! - 500
        let numbereid = Int(position)!
        
        let Numbertitle = UILabel()
        Numbertitle.text = title
        Numbertitle.tag = titleid
        self.cellviewC.contentView.addSubview(Numbertitle)
        Numbertitle.translatesAutoresizingMaskIntoConstraints = false
        Numbertitle.numberOfLines = 30
        Numbertitle.font = Numbertitle.font.withSize(17)
        self.cellviewC.contentView.addConstraint(NSLayoutConstraint(item: Numbertitle, attribute: .top, relatedBy: .equal, toItem: beforeobject, attribute: .bottom, multiplier: 1, constant: 10))
        self.cellviewC.contentView.addConstraint(NSLayoutConstraint(item: Numbertitle, attribute: .leading, relatedBy: .equal, toItem: self.cellviewC.contentView, attribute: .leading, multiplier: 1, constant: 20))
        self.cellviewC.contentView.addConstraint(NSLayoutConstraint(item: Numbertitle, attribute: .trailing, relatedBy: .equal, toItem: self.cellviewC.contentView, attribute: .trailing, multiplier: 1, constant: 20))
        
        self.textFieldlayout(hint: "Please wirte number", tagId: titleid, edittagId: numbereid, type: "number")
        
    }
    
    func DateLint(title:String, id:String, position:String, beforetype:String) {
        print("datelint" + position)
        beforeObject(beforeObject: beforetype, beforeId: Int(position)! - 1)
        let titleid = Int(position)! - 500
        let dateid = Int(position)!
         
        let datetitle = UILabel()
        datetitle.tag = titleid
        datetitle.text = title

        self.cellviewC.contentView.addSubview(datetitle)
        datetitle.translatesAutoresizingMaskIntoConstraints = false
        datetitle.numberOfLines = 30
        datetitle.font = datetitle.font.withSize(17)
        self.cellviewC.contentView.addConstraint(NSLayoutConstraint(item: datetitle, attribute: .top, relatedBy: .equal, toItem: beforeobject, attribute: .bottom, multiplier: 1, constant: 10))
        self.cellviewC.contentView.addConstraint(NSLayoutConstraint(item: datetitle, attribute: .leading, relatedBy: .equal, toItem: self.cellviewC.contentView, attribute: .leading, multiplier: 1, constant: 20))
        self.cellviewC.contentView.addConstraint(NSLayoutConstraint(item: datetitle, attribute: .trailing, relatedBy: .equal, toItem: self.cellviewC.contentView, attribute: .trailing, multiplier: 1, constant: 20))

        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MMM.yyyy"
        let result = formatter.string(from: date)

        let datefield =  UITextField()
        datefield.tag = dateid
        self.cellviewC.contentView.addSubview(datefield)
        let heightConstraint = datefield.heightAnchor.constraint(equalToConstant: 35)
        let widthConstraint = datefield.widthAnchor.constraint(equalToConstant: CGFloat(phoneWidth))
        self.cellviewC.contentView.addConstraints([widthConstraint, heightConstraint])
        datefield.keyboardType = .numberPad
        datefield.translatesAutoresizingMaskIntoConstraints = false
        datefield.text = result
        datefield.font = UIFont.systemFont(ofSize: 15)
        datefield.borderStyle = UITextField.BorderStyle.roundedRect
        datefield.autocorrectionType = UITextAutocorrectionType.no
        datefield.keyboardType = UIKeyboardType.default
        datefield.returnKeyType = UIReturnKeyType.done
        datefield.clearButtonMode = UITextField.ViewMode.whileEditing
        datefield.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        self.cellviewC.contentView.addConstraint(NSLayoutConstraint(item: datefield, attribute: .top, relatedBy: .equal, toItem: datetitle, attribute: .bottom, multiplier: 1, constant: 5))
        self.cellviewC.contentView.addConstraint(NSLayoutConstraint(item: datefield, attribute: .leading, relatedBy: .equal, toItem: self.cellviewC.contentView, attribute: .leading, multiplier: 1, constant: 20))

        datefield.setInputViewDatePicker(target: self, selector: #selector(tapDone))
    }
    
    @objc func tapDone() {
        let myTextField = self.cellviewC.contentView.viewWithTag(32) as? UITextField

        if let datePicker = myTextField!.inputView as? UIDatePicker { // 2-1
            let dateformatter = DateFormatter() // 2-2
            dateformatter.dateStyle = .medium // 2-3
            myTextField!.text = dateformatter.string(from: datePicker.date) //2-4
        }
        myTextField!.resignFirstResponder() // 2-5
    }
    
    func FileLint(title:String, id:String, position:String, beforetype:String) {
        print("FileLint" + position)
        beforeObject(beforeObject: beforetype, beforeId: Int(position)! - 1)
        
        let fileid = Int(position)! - 600
        let imageid = Int(position)!
        
        let filetitle = UILabel()
        filetitle.text = title
        
        self.cellviewC.contentView.addSubview(filetitle)
        filetitle.translatesAutoresizingMaskIntoConstraints = false
        filetitle.numberOfLines = 30
        filetitle.font = filetitle.font.withSize(17)
        self.cellviewC.contentView.addConstraint(NSLayoutConstraint(item: filetitle, attribute: .top, relatedBy: .equal, toItem: beforeobject, attribute: .bottom, multiplier: 1, constant: 10))
        self.cellviewC.contentView.addConstraint(NSLayoutConstraint(item: filetitle, attribute: .leading, relatedBy: .equal, toItem: self.cellviewC.contentView, attribute: .leading, multiplier: 1, constant: 20))
        self.cellviewC.contentView.addConstraint(NSLayoutConstraint(item: filetitle, attribute: .trailing, relatedBy: .equal, toItem: self.cellviewC.contentView, attribute: .trailing, multiplier: 1, constant: 20))
        
        
        let button = UIButton()
        button.tag = fileid
        self.cellviewC.contentView.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        let heightConstraint = button.heightAnchor.constraint(equalToConstant: 35)
        let widthConstraint = button.widthAnchor.constraint(equalToConstant: 150)
        self.cellviewC.contentView.addConstraints([widthConstraint, heightConstraint])
        button.layer.cornerRadius = 17.5
        button.backgroundColor = UIColor.gray
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.setTitle("FileUpload", for: .normal)
        self.cellviewC.contentView.addConstraint(NSLayoutConstraint(item: button, attribute: .top, relatedBy: .equal, toItem: filetitle, attribute: .bottom, multiplier: 1, constant: 5))
        self.cellviewC.contentView.addConstraint(NSLayoutConstraint(item: button, attribute: .leading, relatedBy: .equal, toItem: self.cellviewC.contentView, attribute: .leading, multiplier: 1, constant: 20))
        
        let fileimage = UIImageView()
        fileimage.tag = imageid
        fileimage.image = UIImage(named: "app_logo")
        self.cellviewC.contentView.addSubview(fileimage)
        fileimage.isHidden = true
        fileimage.translatesAutoresizingMaskIntoConstraints = false
        let widthimage = fileimage.widthAnchor.constraint(equalToConstant: 140)
        let heightimage = fileimage.heightAnchor.constraint(equalToConstant: 160)
        self.cellviewC.contentView.addConstraints([widthimage, heightimage])
        self.cellviewC.contentView.addConstraint(NSLayoutConstraint(item: fileimage, attribute: .top, relatedBy: .equal, toItem: button, attribute: .bottom, multiplier: 1, constant: 10))
        self.cellviewC.contentView.addConstraint(NSLayoutConstraint(item: fileimage, attribute: .leading, relatedBy: .equal, toItem: self.cellviewC.contentView, attribute: .leading, multiplier: 1, constant: 20))
    }
    
    func EmailLint(title:String, id:String, position:String, beforetype:String) {
        print("EmailLint" + position)
        beforeObject(beforeObject: beforetype, beforeId: Int(position)! - 1)
        let titleid = Int(position)! - 500
        let emailid = Int(position)!
        let emailtitle = UILabel()
        emailtitle.tag = titleid
        emailtitle.text = title
        self.cellviewC.contentView.addSubview(emailtitle)
        emailtitle.translatesAutoresizingMaskIntoConstraints = false
        emailtitle.numberOfLines = 30
        emailtitle.font = emailtitle.font.withSize(17)
        self.cellviewC.contentView.addConstraint(NSLayoutConstraint(item: emailtitle, attribute: .top, relatedBy: .equal, toItem: beforeobject, attribute: .bottom, multiplier: 1, constant: 10))
        self.cellviewC.contentView.addConstraint(NSLayoutConstraint(item: emailtitle, attribute: .leading, relatedBy: .equal, toItem: self.cellviewC.contentView, attribute: .leading, multiplier: 1, constant: 20))
        self.cellviewC.contentView.addConstraint(NSLayoutConstraint(item: emailtitle, attribute: .trailing, relatedBy: .equal, toItem: self.cellviewC.contentView, attribute: .trailing, multiplier: 1, constant: 20))
        
        self.textFieldlayout(hint: "Please wirte email", tagId: titleid, edittagId: emailid, type: "email")
    }
    
    func MoneyLint(title:String, id:String, position:String, beforetype:String) {
        print("MoneyLint" + position)
        beforeObject(beforeObject: beforetype, beforeId: Int(position)! - 1)
        
        let dollerid = Int(position)!
        let centid = Int(position)! - 600
        let moneytitle = UILabel()
        moneytitle.text = title
        self.cellviewC.contentView.addSubview(moneytitle)
        moneytitle.translatesAutoresizingMaskIntoConstraints = false
        moneytitle.numberOfLines = 30
        moneytitle.font = moneytitle.font.withSize(17)
        self.cellviewC.contentView.addConstraint(NSLayoutConstraint(item: moneytitle, attribute: .top, relatedBy: .equal, toItem: beforeobject, attribute: .bottom, multiplier: 1, constant: 10))
        self.cellviewC.contentView.addConstraint(NSLayoutConstraint(item: moneytitle, attribute: .leading, relatedBy: .equal, toItem: self.cellviewC.contentView, attribute: .leading, multiplier: 1, constant: 20))
        self.cellviewC.contentView.addConstraint(NSLayoutConstraint(item: moneytitle, attribute: .trailing, relatedBy: .equal, toItem: self.cellviewC.contentView, attribute: .trailing, multiplier: 1, constant: 20))
        
        let startlable = UILabel()
        startlable.text = "$"
        self.cellviewC.contentView.addSubview(startlable)
        startlable.translatesAutoresizingMaskIntoConstraints = false
        startlable.font = startlable.font.withSize(17)
        self.cellviewC.contentView.addConstraint(NSLayoutConstraint(item: startlable, attribute: .top, relatedBy: .equal, toItem: moneytitle, attribute: .bottom, multiplier: 1, constant: 10))
        self.cellviewC.contentView.addConstraint(NSLayoutConstraint(item: startlable, attribute: .leading, relatedBy: .equal, toItem: self.cellviewC.contentView, attribute: .leading, multiplier: 1, constant: 20))
        
        let dollerField =  UITextField()
        dollerField.tag = dollerid
        dollerField.delegate = self
        self.cellviewC.contentView.addSubview(dollerField)
        let heightConstraint = dollerField.heightAnchor.constraint(equalToConstant: 35)
        let widthConstraint = dollerField.widthAnchor.constraint(equalToConstant: 130)
        self.cellviewC.contentView.addConstraints([widthConstraint, heightConstraint])
        dollerField.keyboardType = .numberPad
        dollerField.translatesAutoresizingMaskIntoConstraints = false
        dollerField.placeholder = "Doller"
        dollerField.font = UIFont.systemFont(ofSize: 15)
        dollerField.borderStyle = UITextField.BorderStyle.roundedRect
        dollerField.autocorrectionType = UITextAutocorrectionType.no
        dollerField.keyboardType = UIKeyboardType.default
        dollerField.returnKeyType = UIReturnKeyType.done
        dollerField.clearButtonMode = UITextField.ViewMode.whileEditing
        dollerField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        self.cellviewC.contentView.addConstraint(NSLayoutConstraint(item: dollerField, attribute: .top, relatedBy: .equal, toItem: moneytitle, attribute: .bottom, multiplier: 1, constant: 5))
        self.cellviewC.contentView.addConstraint(NSLayoutConstraint(item: dollerField, attribute: .leading, relatedBy: .equal, toItem: startlable, attribute: .leading, multiplier: 1, constant: 15))
        
        let comlable = UILabel()
        comlable.text = "."
        self.cellviewC.contentView.addSubview(comlable)
        comlable.translatesAutoresizingMaskIntoConstraints = false
        comlable.font = comlable.font.withSize(17)
        self.cellviewC.contentView.addConstraint(NSLayoutConstraint(item: comlable, attribute: .top, relatedBy: .equal, toItem: moneytitle, attribute: .bottom, multiplier: 1, constant: 20))
        self.cellviewC.contentView.addConstraint(NSLayoutConstraint(item: comlable, attribute: .leading, relatedBy: .equal, toItem: dollerField, attribute: .leading, multiplier: 1, constant: 135))
        
        let sentfield =  UITextField()
        sentfield.tag = centid
        sentfield.delegate = self
        self.cellviewC.contentView.addSubview(sentfield)
        let heightConstraintc = sentfield.heightAnchor.constraint(equalToConstant: 35)
        let widthConstraintc = sentfield.widthAnchor.constraint(equalToConstant: 100)
        self.cellviewC.contentView.addConstraints([widthConstraintc, heightConstraintc])
        sentfield.keyboardType = .numberPad
        sentfield.translatesAutoresizingMaskIntoConstraints = false
        sentfield.placeholder = "sent"
        sentfield.font = UIFont.systemFont(ofSize: 15)
        sentfield.borderStyle = UITextField.BorderStyle.roundedRect
        sentfield.autocorrectionType = UITextAutocorrectionType.no
        sentfield.keyboardType = UIKeyboardType.default
        sentfield.returnKeyType = UIReturnKeyType.done
        sentfield.clearButtonMode = UITextField.ViewMode.whileEditing
        sentfield.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        self.cellviewC.contentView.addConstraint(NSLayoutConstraint(item: sentfield, attribute: .top, relatedBy: .equal, toItem: moneytitle, attribute: .bottom, multiplier: 1, constant: 5))
        self.cellviewC.contentView.addConstraint(NSLayoutConstraint(item: sentfield, attribute: .leading, relatedBy: .equal, toItem: comlable, attribute: .leading, multiplier: 1, constant: 10))
    }
    
    func TextLint(title:String, id:String, position:String, beforetype:String) {
        print("TextLint" + position)
        beforeObject(beforeObject: beforetype, beforeId: Int(position)! - 1)
        let titleid = Int(position)! - 500
        let textid = Int(position)!
        
        let texttitle = UILabel()
        texttitle.text = title
        texttitle.tag = titleid
        self.cellviewC.contentView.addSubview(texttitle)
        texttitle.translatesAutoresizingMaskIntoConstraints = false
        texttitle.numberOfLines = 30
        texttitle.font = texttitle.font.withSize(17)
        self.cellviewC.contentView.addConstraint(NSLayoutConstraint(item: texttitle, attribute: .top, relatedBy: .equal, toItem: beforeobject, attribute: .bottom, multiplier: 1, constant: 10))
        self.cellviewC.contentView.addConstraint(NSLayoutConstraint(item: texttitle, attribute: .leading, relatedBy: .equal, toItem: self.cellviewC.contentView, attribute: .leading, multiplier: 1, constant: 20))
        self.cellviewC.contentView.addConstraint(NSLayoutConstraint(item: texttitle, attribute: .trailing, relatedBy: .equal, toItem: self.cellviewC.contentView, attribute: .trailing, multiplier: 1, constant: 20))
        
        self.textFieldlayout(hint: "Please wirte text", tagId: titleid, edittagId: textid, type: "text")
    }
    
    func SingatureLint(title:String, id:String, position:String, beforetype:String){
        print("SingatureLint" + position)
        beforeObject(beforeObject: beforetype, beforeId: Int(position)! - 1)
    
        let bsid = Int(position)!
        let bdid = Int(position)! - 600
                      
        let signtitle = UILabel()
        signtitle.text = title

        self.cellviewC.contentView.addSubview(signtitle)
        signtitle.translatesAutoresizingMaskIntoConstraints = false
        signtitle.numberOfLines = 30
        signtitle.font = signtitle.font.withSize(17)
        self.cellviewC.contentView.addConstraint(NSLayoutConstraint(item: signtitle, attribute: .top, relatedBy: .equal, toItem: beforeobject, attribute: .bottom, multiplier: 1, constant: 10))
        self.cellviewC.contentView.addConstraint(NSLayoutConstraint(item: signtitle, attribute: .leading, relatedBy: .equal, toItem: self.cellviewC.contentView, attribute: .leading, multiplier: 1, constant: 20))
        self.cellviewC.contentView.addConstraint(NSLayoutConstraint(item: signtitle, attribute: .trailing, relatedBy: .equal, toItem: self.cellviewC.contentView, attribute: .trailing, multiplier: 1, constant: 20))
        
        
//        signature.isUserInteractionEnabled = true
        signature.setStrokeColor(color: .black)
        signature.backgroundColor = UIColor.white
        signature.layer.borderWidth = 1
        signature.layer.borderColor = UIColor(red: 0.945, green: 0.945, blue: 0.945, alpha: 1.0).cgColor
        signature.layer.cornerRadius = 10
        signature.setStrokeWidth(width: 1)
        self.cellviewC.contentView.addSubview(signature)
        signature.translatesAutoresizingMaskIntoConstraints = false
        let widthsign = signature.widthAnchor.constraint(equalToConstant: CGFloat(phoneWidth))
        let hightsign = signature.heightAnchor.constraint(equalToConstant: 100)
        self.cellviewC.contentView.addConstraints([widthsign, hightsign])
        self.cellviewC.contentView.addConstraint(NSLayoutConstraint(item: signature, attribute: .top, relatedBy: .equal, toItem: signtitle, attribute: .bottom, multiplier: 1, constant: 10))
        self.cellviewC.contentView.addConstraint(NSLayoutConstraint(item: signature, attribute: .leading, relatedBy: .equal, toItem: self.cellviewC.contentView, attribute: .leading, multiplier: 1, constant: 20))
        
        let saveBtn = UIButton()
        saveBtn.tag = bsid
        saveBtn.backgroundColor = UIColor.lightGray
        saveBtn.setTitle("SAVE", for: .normal)
        self.cellviewC.contentView.addSubview(saveBtn)
        saveBtn.translatesAutoresizingMaskIntoConstraints = false
        let btnwidth =  saveBtn.widthAnchor.constraint(equalToConstant: 130)
        let btnheight = saveBtn.heightAnchor.constraint(equalToConstant: 35)
        self.cellviewC.contentView.addConstraints([btnwidth, btnheight])
        self.cellviewC.contentView.addConstraint(NSLayoutConstraint(item: saveBtn, attribute: .top, relatedBy: .equal, toItem: signature, attribute: .bottom, multiplier: 1, constant: 10))
        self.cellviewC.contentView.addConstraint(NSLayoutConstraint(item: saveBtn, attribute: .leading, relatedBy: .equal, toItem: self.cellviewC.contentView, attribute: .leading, multiplier: 1, constant: 20))
        saveBtn.addTarget(self, action: #selector(saveSignature), for: .touchUpInside)
        
        let deleteBtn = UIButton()
        deleteBtn.setTitle("CLEAR", for: .normal)
        deleteBtn.backgroundColor = UIColor.lightGray
        deleteBtn.tag = bdid
        self.cellviewC.contentView.addSubview(deleteBtn)
        deleteBtn.translatesAutoresizingMaskIntoConstraints = false
        let btnwidthd =  deleteBtn.widthAnchor.constraint(equalToConstant: 130)
        let btnheightd = deleteBtn.heightAnchor.constraint(equalToConstant: 35)
        self.cellviewC.contentView.addConstraints([btnwidthd, btnheightd])
        self.cellviewC.contentView.addConstraint(NSLayoutConstraint(item: deleteBtn, attribute: .top, relatedBy: .equal, toItem: signature, attribute: .bottom, multiplier: 1, constant: 10))
        self.cellviewC.contentView.addConstraint(NSLayoutConstraint(item: deleteBtn, attribute: .leading, relatedBy: .equal, toItem: saveBtn, attribute: .leading, multiplier: 1, constant: 140))
        deleteBtn.addTarget(self, action: #selector(clearSignature), for: .touchUpInside)
    }
    
    @objc func saveSignature(){
    //        signImage.image = savecontact(with: signature)
    //        print("fullRender \(signImage.image?.size ?? CGSize.zero)")
            FormViewController.table.isScrollEnabled = true
        }
        
    @objc func clearSignature() {
        signature.clear()
        FormViewController.table.isScrollEnabled = true
    }
    
    func savecontact(with view: UIView) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(view.bounds.size, view.isOpaque, 0.0)
        defer { UIGraphicsEndImageContext() }
        if let context = UIGraphicsGetCurrentContext() {
            view.layer.render(in: context)
            let image = UIGraphicsGetImageFromCurrentImageContext()
            return image
        }
        return nil
    }
    
    func SimplenameLint(title:String, id:String, position:String, beforetype:String){
        print("SimplenameLint" + position)
        beforeObject(beforeObject: beforetype, beforeId: Int(position)! - 1)
        let firstid = Int(position)!
        let lastid = Int(position)! - 600
        
        let nametitle = UILabel()
//        elementtitle.tag = titleId
        nametitle.text = title
        self.cellviewC.contentView.addSubview(nametitle)
        nametitle.translatesAutoresizingMaskIntoConstraints = false
        nametitle.numberOfLines = 30
        nametitle.font = nametitle.font.withSize(17)
        self.cellviewC.contentView.addConstraint(NSLayoutConstraint(item: nametitle, attribute: .top, relatedBy: .equal, toItem: beforeobject, attribute: .bottom, multiplier: 1, constant: 10))
        self.cellviewC.contentView.addConstraint(NSLayoutConstraint(item: nametitle, attribute: .leading, relatedBy: .equal, toItem: self.cellviewC.contentView, attribute: .leading, multiplier: 1, constant: 20))
        self.cellviewC.contentView.addConstraint(NSLayoutConstraint(item: nametitle, attribute: .trailing, relatedBy: .equal, toItem: self.cellviewC.contentView, attribute: .trailing, multiplier: 1, constant: 20))
        
        
        let firstField =  UITextField()
        firstField.tag = firstid
        self.cellviewC.contentView.addSubview(firstField)
        let heightConstraint = firstField.heightAnchor.constraint(equalToConstant: 35)
        let widthConstraint = firstField.widthAnchor.constraint(equalToConstant: 130)
        self.cellviewC.contentView.addConstraints([widthConstraint, heightConstraint])
        firstField.keyboardType = .numberPad
        firstField.translatesAutoresizingMaskIntoConstraints = false
        firstField.placeholder = "First Name"
        firstField.font = UIFont.systemFont(ofSize: 15)
        firstField.borderStyle = UITextField.BorderStyle.roundedRect
        firstField.autocorrectionType = UITextAutocorrectionType.no
        firstField.keyboardType = UIKeyboardType.default
        firstField.returnKeyType = UIReturnKeyType.done
        firstField.clearButtonMode = UITextField.ViewMode.whileEditing
        firstField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        self.cellviewC.contentView.addConstraint(NSLayoutConstraint(item: firstField, attribute: .top, relatedBy: .equal, toItem: nametitle, attribute: .bottom, multiplier: 1, constant: 5))
        self.cellviewC.contentView.addConstraint(NSLayoutConstraint(item: firstField, attribute: .leading, relatedBy: .equal, toItem: self.cellviewC.contentView, attribute: .leading, multiplier: 1, constant: 20))
        
        let lastfield =  UITextField()
        lastfield.tag = lastid
        self.cellviewC.contentView.addSubview(lastfield)
        let heightConstraintc = lastfield.heightAnchor.constraint(equalToConstant: 35)
        let widthConstraintc = lastfield.widthAnchor.constraint(equalToConstant: 150)
        self.cellviewC.contentView.addConstraints([widthConstraintc, heightConstraintc])
        lastfield.keyboardType = .numberPad
        lastfield.translatesAutoresizingMaskIntoConstraints = false
        lastfield.placeholder = "Last Name"
        lastfield.font = UIFont.systemFont(ofSize: 15)
        lastfield.borderStyle = UITextField.BorderStyle.roundedRect
        lastfield.autocorrectionType = UITextAutocorrectionType.no
        lastfield.keyboardType = UIKeyboardType.default
        lastfield.returnKeyType = UIReturnKeyType.done
        lastfield.clearButtonMode = UITextField.ViewMode.whileEditing
        lastfield.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        self.cellviewC.contentView.addConstraint(NSLayoutConstraint(item: lastfield, attribute: .top, relatedBy: .equal, toItem: nametitle, attribute: .bottom, multiplier: 1, constant: 5))
        self.cellviewC.contentView.addConstraint(NSLayoutConstraint(item: lastfield, attribute: .leading, relatedBy: .equal, toItem: firstField, attribute: .leading, multiplier: 1, constant: 140))
    }
    
    func MediaLint(title:String, type:String, imagesrc:String, pdfsrc:String, position:String, beforetype:String){
        print("MediaLint" + position)
        beforeObject(beforeObject: beforetype, beforeId: Int(position)! - 1)
    }
    
    func PhoneLint(title:String, id:String, position:String, beforetype:String){
        print("PhoneLint" + position)
        beforeObject(beforeObject: beforetype, beforeId: Int(position)! - 1)
        let pid1 = Int(position)!
        let pid2 = Int(position)! - 600
        let pid3 = Int(position)! - 601
        
        let phonetitle = UILabel()
        phonetitle.text = title
        self.cellviewC.contentView.addSubview(phonetitle)
        phonetitle.translatesAutoresizingMaskIntoConstraints = false
        phonetitle.numberOfLines = 30
        phonetitle.font = phonetitle.font.withSize(17)
        self.cellviewC.contentView.addConstraint(NSLayoutConstraint(item: phonetitle, attribute: .top, relatedBy: .equal, toItem: beforeobject, attribute: .bottom, multiplier: 1, constant: 10))
        self.cellviewC.contentView.addConstraint(NSLayoutConstraint(item: phonetitle, attribute: .leading, relatedBy: .equal, toItem: self.cellviewC.contentView, attribute: .leading, multiplier: 1, constant: 20))
        self.cellviewC.contentView.addConstraint(NSLayoutConstraint(item: phonetitle, attribute: .trailing, relatedBy: .equal, toItem: self.cellviewC.contentView, attribute: .trailing, multiplier: 1, constant: 20))
        
        let firstField =  UITextField()
        firstField.tag = pid1
        firstField.delegate = self
        self.cellviewC.contentView.addSubview(firstField)
        let heightConstraint = firstField.heightAnchor.constraint(equalToConstant: 35)
        let widthConstraint = firstField.widthAnchor.constraint(equalToConstant: 76)
        self.cellviewC.contentView.addConstraints([widthConstraint, heightConstraint])
        firstField.keyboardType = .numberPad
        firstField.translatesAutoresizingMaskIntoConstraints = false
        firstField.placeholder = "###"
        firstField.font = UIFont.systemFont(ofSize: 15)
        firstField.borderStyle = UITextField.BorderStyle.roundedRect
        firstField.autocorrectionType = UITextAutocorrectionType.no
        firstField.keyboardType = UIKeyboardType.default
        firstField.returnKeyType = UIReturnKeyType.done
        firstField.clearButtonMode = UITextField.ViewMode.whileEditing
        firstField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        self.cellviewC.contentView.addConstraint(NSLayoutConstraint(item: firstField, attribute: .top, relatedBy: .equal, toItem: phonetitle, attribute: .bottom, multiplier: 1, constant: 5))
        self.cellviewC.contentView.addConstraint(NSLayoutConstraint(item: firstField, attribute: .leading, relatedBy: .equal, toItem: self.cellviewC.contentView, attribute: .leading, multiplier: 1, constant: 20))
        
        let comlable = UILabel()
        comlable.text = "-"
        self.cellviewC.contentView.addSubview(comlable)
        comlable.translatesAutoresizingMaskIntoConstraints = false
        comlable.font = comlable.font.withSize(17)
        self.cellviewC.contentView.addConstraint(NSLayoutConstraint(item: comlable, attribute: .top, relatedBy: .equal, toItem: phonetitle, attribute: .bottom, multiplier: 1, constant: 10))
        self.cellviewC.contentView.addConstraint(NSLayoutConstraint(item: comlable, attribute: .leading, relatedBy: .equal, toItem: firstField, attribute: .leading, multiplier: 1, constant: 81))
        
        let secontField =  UITextField()
        secontField.tag = pid2
        secontField.delegate = self
        self.cellviewC.contentView.addSubview(secontField)
        let heightConstraints = secontField.heightAnchor.constraint(equalToConstant: 35)
        let widthConstraints = secontField.widthAnchor.constraint(equalToConstant: 76)
        self.cellviewC.contentView.addConstraints([widthConstraints, heightConstraints])
        secontField.keyboardType = .numberPad
        secontField.translatesAutoresizingMaskIntoConstraints = false
        secontField.placeholder = "###"
        secontField.font = UIFont.systemFont(ofSize: 15)
        secontField.borderStyle = UITextField.BorderStyle.roundedRect
        secontField.autocorrectionType = UITextAutocorrectionType.no
        secontField.keyboardType = UIKeyboardType.default
        secontField.returnKeyType = UIReturnKeyType.done
        secontField.clearButtonMode = UITextField.ViewMode.whileEditing
        secontField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        self.cellviewC.contentView.addConstraint(NSLayoutConstraint(item: secontField, attribute: .top, relatedBy: .equal, toItem: phonetitle, attribute: .bottom, multiplier: 1, constant: 5))
        self.cellviewC.contentView.addConstraint(NSLayoutConstraint(item: secontField, attribute: .leading, relatedBy: .equal, toItem: comlable, attribute: .leading, multiplier: 1, constant: 15))
        
        let comlables = UILabel()
        comlables.text = "-"
        self.cellviewC.contentView.addSubview(comlables)
        comlables.translatesAutoresizingMaskIntoConstraints = false
        comlables.font = comlables.font.withSize(17)
        self.cellviewC.contentView.addConstraint(NSLayoutConstraint(item: comlables, attribute: .top, relatedBy: .equal, toItem: phonetitle, attribute: .bottom, multiplier: 1, constant: 10))
        self.cellviewC.contentView.addConstraint(NSLayoutConstraint(item: comlables, attribute: .leading, relatedBy: .equal, toItem: secontField, attribute: .leading, multiplier: 1, constant: 81))
        
        let thirdField =  UITextField()
        thirdField.tag = pid3
        thirdField.delegate = self
        self.cellviewC.contentView.addSubview(thirdField)
        let heightConstraintt = thirdField.heightAnchor.constraint(equalToConstant: 35)
        let widthConstraintt = thirdField.widthAnchor.constraint(equalToConstant: 87)
        self.cellviewC.contentView.addConstraints([widthConstraintt, heightConstraintt])
        thirdField.keyboardType = .numberPad
        thirdField.translatesAutoresizingMaskIntoConstraints = false
        thirdField.placeholder = "####"
        thirdField.font = UIFont.systemFont(ofSize: 15)
        thirdField.borderStyle = UITextField.BorderStyle.roundedRect
        thirdField.autocorrectionType = UITextAutocorrectionType.no
        thirdField.keyboardType = UIKeyboardType.default
        thirdField.returnKeyType = UIReturnKeyType.done
        thirdField.clearButtonMode = UITextField.ViewMode.whileEditing
        thirdField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        self.cellviewC.contentView.addConstraint(NSLayoutConstraint(item: thirdField, attribute: .top, relatedBy: .equal, toItem: phonetitle, attribute: .bottom, multiplier: 1, constant: 5))
        self.cellviewC.contentView.addConstraint(NSLayoutConstraint(item: thirdField, attribute: .leading, relatedBy: .equal, toItem: comlables, attribute: .leading, multiplier: 1, constant: 15))
    }
    
    func SelectLint(title:String, id:String, position:String, beforetype:String){
        print("SelectLint" + position)
        beforeObject(beforeObject: beforetype, beforeId: Int(position)! - 1)
        let did = Int(position)!
        
        let selecttitle = UILabel()
        selecttitle.text = title
        self.cellviewC.contentView.addSubview(selecttitle)
        selecttitle.translatesAutoresizingMaskIntoConstraints = false
        selecttitle.numberOfLines = 30
        selecttitle.font = selecttitle.font.withSize(17)
        self.cellviewC.contentView.addConstraint(NSLayoutConstraint(item: selecttitle, attribute: .top, relatedBy: .equal, toItem: beforeobject, attribute: .bottom, multiplier: 1, constant: 10))
        self.cellviewC.contentView.addConstraint(NSLayoutConstraint(item: selecttitle, attribute: .leading, relatedBy: .equal, toItem: self.cellviewC.contentView, attribute: .leading, multiplier: 1, constant: 20))
        self.cellviewC.contentView.addConstraint(NSLayoutConstraint(item: selecttitle, attribute: .trailing, relatedBy: .equal, toItem: self.cellviewC.contentView, attribute: .trailing, multiplier: 1, constant: 20))
        
        let dropdown = DropDown()
        dropdown.tag = did
        self.cellviewC.contentView.addSubview(dropdown)
        dropdown.translatesAutoresizingMaskIntoConstraints = false
        let heightConstraint = dropdown.heightAnchor.constraint(equalToConstant: 35)
        let widthConstraint = dropdown.widthAnchor.constraint(equalToConstant: CGFloat(phoneWidth))
        dropdown.layer.borderWidth = 1
        dropdown.layer.cornerRadius = 5
        dropdown.arrowSize = 0
        dropdown.selectedRowColor = UIColor.lightGray
        dropdown.layer.borderColor = UIColor(red: 0.945, green: 0.945, blue: 0.945, alpha: 1.0).cgColor
        self.cellviewC.contentView.addConstraints([widthConstraint, heightConstraint])
        self.cellviewC.contentView.addConstraint(NSLayoutConstraint(item: dropdown, attribute: .top, relatedBy: .equal, toItem: selecttitle, attribute: .bottom, multiplier: 1, constant: 5))
        self.cellviewC.contentView.addConstraint(NSLayoutConstraint(item: dropdown, attribute: .leading, relatedBy: .equal, toItem: self.cellviewC.contentView, attribute: .leading, multiplier: 1, constant: 20))
        dropdown.optionArray = ["Option 1", "Option 2", "Option 3"]
        dropdown.optionIds = [1,23,54,22]
        dropdown.didSelect{(selectedText , index ,id) in
//        dropdown.text = "Selected String: \(selectedText) \n index: \(index)"
            }
    }
    
    func CheckboxLint(title:String, id:String, position:String, beforetype:String){
        print("CheckboxLint" + position)
        beforeObject(beforeObject: beforetype, beforeId: Int(position)! - 1)
        let did = Int(position)!
        
        let checktitle = UILabel()
//        elementtitle.tag = titleId
        checktitle.text = title
        self.cellviewC.contentView.addSubview(checktitle)
        checktitle.translatesAutoresizingMaskIntoConstraints = false
        checktitle.numberOfLines = 30
        checktitle.font = checktitle.font.withSize(17)
        self.cellviewC.contentView.addConstraint(NSLayoutConstraint(item: checktitle, attribute: .top, relatedBy: .equal, toItem: beforeobject, attribute: .bottom, multiplier: 1, constant: 10))
        self.cellviewC.contentView.addConstraint(NSLayoutConstraint(item: checktitle, attribute: .leading, relatedBy: .equal, toItem: self.cellviewC.contentView, attribute: .leading, multiplier: 1, constant: 20))
        self.cellviewC.contentView.addConstraint(NSLayoutConstraint(item: checktitle, attribute: .trailing, relatedBy: .equal, toItem: self.cellviewC.contentView, attribute: .trailing, multiplier: 1, constant: 20))

        let checkbtn = UIButton()
        checkbtn.setImage( UIImage(named:"uncheck"), for: .normal)
        checkbtn.addTarget(self, action:  #selector(buttonClicked), for: .touchUpInside)
        
        checkbtn.tag = did
        self.cellviewC.contentView.addSubview(checkbtn)
        checkbtn.translatesAutoresizingMaskIntoConstraints = false
        let heightConstraint = checkbtn.heightAnchor.constraint(equalToConstant: 20)
        let widthConstraint = checkbtn.widthAnchor.constraint(equalToConstant: 20)
        self.cellviewC.contentView.addConstraints([widthConstraint, heightConstraint])
        self.cellviewC.contentView.addConstraint(NSLayoutConstraint(item: checkbtn, attribute: .top, relatedBy: .equal, toItem: checktitle, attribute: .bottom, multiplier: 1, constant: 10))
        self.cellviewC.contentView.addConstraint(NSLayoutConstraint(item: checkbtn, attribute: .leading, relatedBy: .equal, toItem: self.cellviewC.contentView, attribute: .leading, multiplier: 1, constant: 20))
        
        let label = UILabel()
        label.text = "option 1"
        label.numberOfLines = 30
        label.font = label.font.withSize(16)
        self.cellviewC.contentView.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        self.cellviewC.contentView.addConstraint(NSLayoutConstraint(item: label, attribute: .top, relatedBy: .equal, toItem: checktitle, attribute: .bottom, multiplier: 1, constant: 10))
        self.cellviewC.contentView.addConstraint(NSLayoutConstraint(item: label, attribute: .leading, relatedBy: .equal, toItem: checkbtn, attribute: .leading, multiplier: 1, constant: 27))
    }
    
    @objc func buttonClicked(_ sender: UIButton) {
        if unchecked {
            sender.setImage( UIImage(named:"check"), for: .normal)
            unchecked = false
       }
       else {
            sender.setImage(UIImage(named:"uncheck"), for: .normal)
            unchecked = true
       }
    }
    
    func RadioLint(title:String, id:String, position:String, beforetype:String){
        print("RadioLint" + position)
        beforeObject(beforeObject: beforetype, beforeId: Int(position)! - 1)
        let radio3 = Int(position)!
        
        let radiotitle = UILabel()
//        elementtitle.tag = titleId
        radiotitle.text = title
        self.cellviewC.contentView.addSubview(radiotitle)
        radiotitle.translatesAutoresizingMaskIntoConstraints = false
        radiotitle.numberOfLines = 30
        radiotitle.font = radiotitle.font.withSize(17)
        self.cellviewC.contentView.addConstraint(NSLayoutConstraint(item: radiotitle, attribute: .top, relatedBy: .equal, toItem: beforeobject, attribute: .bottom, multiplier: 1, constant: 10))
        self.cellviewC.contentView.addConstraint(NSLayoutConstraint(item: radiotitle, attribute: .leading, relatedBy: .equal, toItem: self.cellviewC.contentView, attribute: .leading, multiplier: 1, constant: 20))
        self.cellviewC.contentView.addConstraint(NSLayoutConstraint(item: radiotitle, attribute: .trailing, relatedBy: .equal, toItem: self.cellviewC.contentView, attribute: .trailing, multiplier: 1, constant: 20))
        
        let button1 = SSRadioButton()
        button1.tag = 21
        button1.setTitle("option 1", for: .normal)
        button1.setTitleColor(UIColor.black, for: .normal)
        self.cellviewC.contentView.addSubview(button1)
        button1.translatesAutoresizingMaskIntoConstraints = false
        let heightConstraint = button1.heightAnchor.constraint(equalToConstant: 30)
        let widthConstraint = button1.widthAnchor.constraint(equalToConstant: 230)
        self.cellviewC.contentView.addConstraints([widthConstraint, heightConstraint])
        self.cellviewC.contentView.addConstraint(NSLayoutConstraint(item: button1, attribute: .top, relatedBy: .equal, toItem: radiotitle, attribute: .bottom, multiplier: 1, constant: 10))
        self.cellviewC.contentView.addConstraint(NSLayoutConstraint(item: button1, attribute: .leading, relatedBy: .equal, toItem: self.cellviewC.contentView, attribute: .leading, multiplier: 1, constant: 20))
        
        let button2 = SSRadioButton()
        button2.tag = 22
        self.cellviewC.contentView.addSubview(button2)
        button2.translatesAutoresizingMaskIntoConstraints = false
        let heightConstrain2 = button2.heightAnchor.constraint(equalToConstant: 30)
        let widthConstrain2 = button2.widthAnchor.constraint(equalToConstant: 30)
        self.cellviewC.contentView.addConstraints([widthConstrain2, heightConstrain2])
        self.cellviewC.contentView.addConstraint(NSLayoutConstraint(item: button2, attribute: .top, relatedBy: .equal, toItem: button1, attribute: .bottom, multiplier: 1, constant: 10))
        self.cellviewC.contentView.addConstraint(NSLayoutConstraint(item: button2, attribute: .leading, relatedBy: .equal, toItem: self.cellviewC.contentView, attribute: .leading, multiplier: 1, constant: 20))
        
        let button3 = SSRadioButton()
        button3.tag = radio3
        self.cellviewC.contentView.addSubview(button3)
        button3.translatesAutoresizingMaskIntoConstraints = false
        let heightConstrain3 = button3.heightAnchor.constraint(equalToConstant: 30)
        let widthConstrain3 = button3.widthAnchor.constraint(equalToConstant: 30)
        self.cellviewC.contentView.addConstraints([widthConstrain3, heightConstrain3])
        self.cellviewC.contentView.addConstraint(NSLayoutConstraint(item: button3, attribute: .top, relatedBy: .equal, toItem: button2, attribute: .bottom, multiplier: 1, constant: 10))
        self.cellviewC.contentView.addConstraint(NSLayoutConstraint(item: button3, attribute: .leading, relatedBy: .equal, toItem: self.cellviewC.contentView, attribute: .leading, multiplier: 1, constant: 20))
        
        radioButtonController = SSRadioButtonsController(buttons: button1, button2, button3)
        radioButtonController!.delegate = self
        radioButtonController!.shouldLetDeSelect = true
    }
    
    func TimeLint(title:String, id:String, position:String, beforetype:String){
        print("TimeLint" + position)
        beforeObject(beforeObject: beforetype, beforeId: Int(position)! - 1)
        let did = Int(position)!
        
        let timetitle = UILabel()
        timetitle.text = title
        self.cellviewC.contentView.addSubview(timetitle)
        timetitle.translatesAutoresizingMaskIntoConstraints = false
        timetitle.numberOfLines = 30
        timetitle.font = timetitle.font.withSize(17)
        self.cellviewC.contentView.addConstraint(NSLayoutConstraint(item: timetitle, attribute: .top, relatedBy: .equal, toItem: beforeobject, attribute: .bottom, multiplier: 1, constant: 10))
        self.cellviewC.contentView.addConstraint(NSLayoutConstraint(item: timetitle, attribute: .leading, relatedBy: .equal, toItem: self.cellviewC.contentView, attribute: .leading, multiplier: 1, constant: 20))
        self.cellviewC.contentView.addConstraint(NSLayoutConstraint(item: timetitle, attribute: .trailing, relatedBy: .equal, toItem: self.cellviewC.contentView, attribute: .trailing, multiplier: 1, constant: 20))
       
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm:ss"
        let result = formatter.string(from: date)
       
        let timefield =  UITextField()
        timefield.tag = did
        timefield.delegate = self
        self.cellviewC.contentView.addSubview(timefield)
        let heightConstraint = timefield.heightAnchor.constraint(equalToConstant: 35)
        let widthConstraint = timefield.widthAnchor.constraint(equalToConstant: CGFloat(phoneWidth))
        self.cellviewC.contentView.addConstraints([widthConstraint, heightConstraint])
        timefield.keyboardType = .numberPad
        timefield.translatesAutoresizingMaskIntoConstraints = false
        timefield.text = result
        timefield.font = UIFont.systemFont(ofSize: 15)
        timefield.borderStyle = UITextField.BorderStyle.roundedRect
        timefield.autocorrectionType = UITextAutocorrectionType.no
        timefield.keyboardType = UIKeyboardType.default
        timefield.returnKeyType = UIReturnKeyType.done
        timefield.clearButtonMode = UITextField.ViewMode.whileEditing
        timefield.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        self.cellviewC.contentView.addConstraint(NSLayoutConstraint(item: timefield, attribute: .top, relatedBy: .equal, toItem: timetitle, attribute: .bottom, multiplier: 1, constant: 5))
        self.cellviewC.contentView.addConstraint(NSLayoutConstraint(item: timefield, attribute: .leading, relatedBy: .equal, toItem: self.cellviewC.contentView, attribute: .leading, multiplier: 1, constant: 20))
       
        timefield.setInputViewTimePicker(target: self, selector: #selector(tapDone))

    }
    
    func UrlLint(title:String, id:String, position:String, beforetype:String){
        print("UrlLint" + position)
        beforeObject(beforeObject: beforetype, beforeId: Int(position)! - 1)
        let titleid = Int(position)! - 500
        let urlid = Int(position)!
        let urltitle = UILabel()
        urltitle.text = title
        self.cellviewC.contentView.addSubview(urltitle)
        urltitle.translatesAutoresizingMaskIntoConstraints = false
        urltitle.numberOfLines = 30
        urltitle.font = urltitle.font.withSize(17)
        self.cellviewC.contentView.addConstraint(NSLayoutConstraint(item: urltitle, attribute: .top, relatedBy: .equal, toItem: beforeobject, attribute: .bottom, multiplier: 1, constant: 10))
        self.cellviewC.contentView.addConstraint(NSLayoutConstraint(item: urltitle, attribute: .leading, relatedBy: .equal, toItem: self.cellviewC.contentView, attribute: .leading, multiplier: 1, constant: 20))
        self.cellviewC.contentView.addConstraint(NSLayoutConstraint(item: urltitle, attribute: .trailing, relatedBy: .equal, toItem: self.cellviewC.contentView, attribute: .trailing, multiplier: 1, constant: 20))
        
        self.textFieldlayout(hint: "Please wirte url", tagId: titleid, edittagId: urlid, type: "url")
    }
    
    func TextareaLint(title:String, id:String, position:String, beforetype:String){
        print("TextareaLint" + position)
        beforeObject(beforeObject: beforetype, beforeId: Int(position)! - 1)
        let areaid = Int(position)!
        
        let textareatitle = UILabel()
        textareatitle.text = title
        self.cellviewC.contentView.addSubview(textareatitle)
        textareatitle.translatesAutoresizingMaskIntoConstraints = false
        textareatitle.numberOfLines = 30
        textareatitle.font = textareatitle.font.withSize(17)
        self.cellviewC.contentView.addConstraint(NSLayoutConstraint(item: textareatitle, attribute: .top, relatedBy: .equal, toItem: beforeobject, attribute: .bottom, multiplier: 1, constant: 10))
        self.cellviewC.contentView.addConstraint(NSLayoutConstraint(item: textareatitle, attribute: .leading, relatedBy: .equal, toItem: self.cellviewC.contentView, attribute: .leading, multiplier: 1, constant: 20))
        self.cellviewC.contentView.addConstraint(NSLayoutConstraint(item: textareatitle, attribute: .trailing, relatedBy: .equal, toItem: self.cellviewC.contentView, attribute: .trailing, multiplier: 1, constant: 20))
        
        let areafield =  UITextView()
        areafield.tag = areaid
        self.cellviewC.contentView.addSubview(areafield)
        let heightConstraint = areafield.heightAnchor.constraint(equalToConstant: 105)
        let widthConstraint = areafield.widthAnchor.constraint(equalToConstant: CGFloat(phoneWidth))
        self.cellviewC.contentView.addConstraints([widthConstraint, heightConstraint])
        areafield.keyboardType = .numberPad
        areafield.isEditable = true
        areafield.layer.borderWidth = 1
        areafield.layer.borderColor = UIColor(red: 0.945, green: 0.945, blue: 0.945, alpha: 1.0).cgColor
        areafield.layer.cornerRadius = 5
        areafield.translatesAutoresizingMaskIntoConstraints = false
        areafield.font = UIFont.systemFont(ofSize: 15)
        areafield.autocorrectionType = UITextAutocorrectionType.no
        areafield.keyboardType = UIKeyboardType.default
        areafield.returnKeyType = UIReturnKeyType.done
        self.cellviewC.contentView.addConstraint(NSLayoutConstraint(item: areafield, attribute: .top, relatedBy: .equal, toItem: textareatitle, attribute: .bottom, multiplier: 1, constant: 5))
        self.cellviewC.contentView.addConstraint(NSLayoutConstraint(item: areafield, attribute: .leading, relatedBy: .equal, toItem: self.cellviewC.contentView, attribute: .leading, multiplier: 1, constant: 20))
    }
    
    func PagebreakLint(id:String, position:String, beforetype:String){
        print("PagebreakLint:" + position)
        beforeObject(beforeObject: beforetype, beforeId: Int(position)! - 1)
        let bid = 103
        let cid = Int(position)!
       
        let continueBtn = UIButton()
        continueBtn.tag = cid
        continueBtn.setTitle("Continue", for: .normal)
        continueBtn.setTitleColor(UIColor.black, for: .normal)
        continueBtn.backgroundColor = UIColor.lightGray
        self.cellviewC.contentView.addSubview(continueBtn)
        let widthcon = continueBtn.widthAnchor.constraint(equalToConstant: 140)
        let heightcon = continueBtn.heightAnchor.constraint(equalToConstant: 35)
        self.cellviewC.contentView.addConstraints([widthcon,heightcon])
        continueBtn.translatesAutoresizingMaskIntoConstraints = false
        self.cellviewC.contentView.addConstraint(NSLayoutConstraint(item: continueBtn, attribute: .top, relatedBy: .equal, toItem: beforeobject, attribute: .bottom, multiplier: 1, constant: 10))
        self.cellviewC.contentView.addConstraint(NSLayoutConstraint(item: continueBtn, attribute: .leading, relatedBy: .equal, toItem: self.cellviewC.contentView, attribute: .leading, multiplier: 1, constant: 20))
       
        let beforeBtn = UIButton()
        beforeBtn.tag = bid
        beforeBtn.setTitleColor(UIColor.black, for: .normal)
        beforeBtn.setTitle("Before", for: .normal)
        beforeBtn.backgroundColor = UIColor.lightGray
        self.cellviewC.contentView.addSubview(beforeBtn)
        beforeBtn.translatesAutoresizingMaskIntoConstraints = false
        let widthbe = beforeBtn.widthAnchor.constraint(equalToConstant: 140)
        let heightbe = beforeBtn.heightAnchor.constraint(equalToConstant: 35)
        self.cellviewC.contentView.addConstraints([widthbe, heightbe])
        self.cellviewC.contentView.addConstraint(NSLayoutConstraint(item: beforeBtn, attribute: .top, relatedBy: .equal, toItem: beforeobject, attribute: .bottom, multiplier: 1, constant: 10))
        self.cellviewC.contentView.addConstraint(NSLayoutConstraint(item: beforeBtn, attribute: .leading, relatedBy: .equal, toItem: continueBtn, attribute: .leading, multiplier: 1, constant: 160))
    }
    
    func AddressLint(title:String, id:String, checkline:String, position:String, beforetype:String){
        print("AddressLint" + position)
        beforeObject(beforeObject: beforetype, beforeId: Int(position)! - 1)
        let aid1 = 42
        let aid2 = 43
        let aid3 = 44
        let aid4 = 45
        let aid5 = 46
        let aid6 = 47
        
        let addresstitle = UILabel()
        addresstitle.text = title
        
        self.cellviewC.contentView.addSubview(addresstitle)
        addresstitle.translatesAutoresizingMaskIntoConstraints = false
        addresstitle.numberOfLines = 30
        addresstitle.font = addresstitle.font.withSize(17)
        self.cellviewC.contentView.addConstraint(NSLayoutConstraint(item: addresstitle, attribute: .top, relatedBy: .equal, toItem: beforeobject, attribute: .bottom, multiplier: 1, constant: 10))
        self.cellviewC.contentView.addConstraint(NSLayoutConstraint(item: addresstitle, attribute: .leading, relatedBy: .equal, toItem: self.cellviewC.contentView, attribute: .leading, multiplier: 1, constant: 20))
        self.cellviewC.contentView.addConstraint(NSLayoutConstraint(item: addresstitle, attribute: .trailing, relatedBy: .equal, toItem: self.cellviewC.contentView, attribute: .trailing, multiplier: 1, constant: 20))
        
        let addressfield =  UITextField()
        addressfield.tag = aid1
        self.cellviewC.contentView.addSubview(addressfield)
        let heightConstraint = addressfield.heightAnchor.constraint(equalToConstant: 35)
        let widthConstraint = addressfield.widthAnchor.constraint(equalToConstant: CGFloat(phoneWidth))
        self.cellviewC.contentView.addConstraints([widthConstraint, heightConstraint])
        addressfield.keyboardType = .numberPad
        addressfield.translatesAutoresizingMaskIntoConstraints = false
        addressfield.font = UIFont.systemFont(ofSize: 15)
        addressfield.placeholder = "street address"
        addressfield.borderStyle = UITextField.BorderStyle.roundedRect
        addressfield.autocorrectionType = UITextAutocorrectionType.no
        addressfield.keyboardType = UIKeyboardType.default
        addressfield.returnKeyType = UIReturnKeyType.done
        addressfield.clearButtonMode = UITextField.ViewMode.whileEditing
        addressfield.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        self.cellviewC.contentView.addConstraint(NSLayoutConstraint(item: addressfield, attribute: .top, relatedBy: .equal, toItem: addresstitle, attribute: .bottom, multiplier: 1, constant: 5))
        self.cellviewC.contentView.addConstraint(NSLayoutConstraint(item: addressfield, attribute: .leading, relatedBy: .equal, toItem: self.cellviewC.contentView, attribute: .leading, multiplier: 1, constant: 20))
        
        let streettitle = UILabel()
        streettitle.text = "Street Address"
        
        self.cellviewC.contentView.addSubview(streettitle)
        streettitle.translatesAutoresizingMaskIntoConstraints = false
        streettitle.numberOfLines = 30
        streettitle.font = streettitle.font.withSize(17)
        self.cellviewC.contentView.addConstraint(NSLayoutConstraint(item: streettitle, attribute: .top, relatedBy: .equal, toItem: addressfield, attribute: .bottom, multiplier: 1, constant: 5))
        self.cellviewC.contentView.addConstraint(NSLayoutConstraint(item: streettitle, attribute: .leading, relatedBy: .equal, toItem: self.cellviewC.contentView, attribute: .leading, multiplier: 1, constant: 20))
        self.cellviewC.contentView.addConstraint(NSLayoutConstraint(item: streettitle, attribute: .trailing, relatedBy: .equal, toItem: self.cellviewC.contentView, attribute: .trailing, multiplier: 1, constant: 20))
        
        let streetfield =  UITextField()
        streetfield.tag = aid2
        self.cellviewC.contentView.addSubview(streetfield)
        let heightConstrains = streetfield.heightAnchor.constraint(equalToConstant: 35)
        let widthConstrains = streetfield.widthAnchor.constraint(equalToConstant: CGFloat(phoneWidth))
        self.cellviewC.contentView.addConstraints([widthConstrains, heightConstrains])
        streetfield.translatesAutoresizingMaskIntoConstraints = false
        streetfield.font = UIFont.systemFont(ofSize: 15)
        streetfield.placeholder = "address line2"
        streetfield.borderStyle = UITextField.BorderStyle.roundedRect
        streetfield.autocorrectionType = UITextAutocorrectionType.no
        streetfield.keyboardType = UIKeyboardType.default
        streetfield.returnKeyType = UIReturnKeyType.done
        streetfield.clearButtonMode = UITextField.ViewMode.whileEditing
        streetfield.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        self.cellviewC.contentView.addConstraint(NSLayoutConstraint(item: streetfield, attribute: .top, relatedBy: .equal, toItem: streettitle, attribute: .bottom, multiplier: 1, constant: 5))
        self.cellviewC.contentView.addConstraint(NSLayoutConstraint(item: streetfield, attribute: .leading, relatedBy: .equal, toItem: self.cellviewC.contentView, attribute: .leading, multiplier: 1, constant: 20))
        
        let linetitle = UILabel()
        linetitle.text = "Address Line2"

        self.cellviewC.contentView.addSubview(linetitle)
        linetitle.translatesAutoresizingMaskIntoConstraints = false
        linetitle.numberOfLines = 30
        linetitle.font = streettitle.font.withSize(17)
        self.cellviewC.contentView.addConstraint(NSLayoutConstraint(item: linetitle, attribute: .top, relatedBy: .equal, toItem: streetfield, attribute: .bottom, multiplier: 1, constant: 5))
        self.cellviewC.contentView.addConstraint(NSLayoutConstraint(item: linetitle, attribute: .leading, relatedBy: .equal, toItem: self.cellviewC.contentView, attribute: .leading, multiplier: 1, constant: 20))
        self.cellviewC.contentView.addConstraint(NSLayoutConstraint(item: linetitle, attribute: .trailing, relatedBy: .equal, toItem: self.cellviewC.contentView, attribute: .trailing, multiplier: 1, constant: 20))
//
        let cityfield =  UITextField()
        cityfield.tag = aid3
        self.cellviewC.contentView.addSubview(cityfield)
        let heightConstrainc = cityfield.heightAnchor.constraint(equalToConstant: 35)
        let widthConstrainc = cityfield.widthAnchor.constraint(equalToConstant: CGFloat(phoneWidth/2 - 10))
        self.cellviewC.contentView.addConstraints([widthConstrainc, heightConstrainc])
        cityfield.translatesAutoresizingMaskIntoConstraints = false
        cityfield.font = UIFont.systemFont(ofSize: 15)
        cityfield.placeholder = "city"
        cityfield.borderStyle = UITextField.BorderStyle.roundedRect
        cityfield.autocorrectionType = UITextAutocorrectionType.no
        cityfield.keyboardType = UIKeyboardType.default
        cityfield.returnKeyType = UIReturnKeyType.done
        cityfield.clearButtonMode = UITextField.ViewMode.whileEditing
        cityfield.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        self.cellviewC.contentView.addConstraint(NSLayoutConstraint(item: cityfield, attribute: .top, relatedBy: .equal, toItem: linetitle, attribute: .bottom, multiplier: 1, constant: 5))
        self.cellviewC.contentView.addConstraint(NSLayoutConstraint(item: cityfield, attribute: .leading, relatedBy: .equal, toItem: self.cellviewC.contentView, attribute: .leading, multiplier: 1, constant: 20))
        
        let citytitle = UILabel()
        citytitle.text = "City"
        self.cellviewC.contentView.addSubview(citytitle)
        citytitle.translatesAutoresizingMaskIntoConstraints = false
        citytitle.numberOfLines = 30
        citytitle.font = citytitle.font.withSize(17)
        self.cellviewC.contentView.addConstraint(NSLayoutConstraint(item: citytitle, attribute: .top, relatedBy: .equal, toItem: cityfield, attribute: .bottom, multiplier: 1, constant: 5))
        self.cellviewC.contentView.addConstraint(NSLayoutConstraint(item: citytitle, attribute: .leading, relatedBy: .equal, toItem: self.cellviewC.contentView, attribute: .leading, multiplier: 1, constant: 20))
        
        let postalfield =  UITextField()
        postalfield.tag = aid5
        self.cellviewC.contentView.addSubview(postalfield)
        let heightConstrainp = postalfield.heightAnchor.constraint(equalToConstant: 35)
        let widthConstrainp = postalfield.widthAnchor.constraint(equalToConstant: CGFloat(phoneWidth/2 - 10))
        self.cellviewC.contentView.addConstraints([widthConstrainp, heightConstrainp])
        postalfield.translatesAutoresizingMaskIntoConstraints = false
        postalfield.font = UIFont.systemFont(ofSize: 15)
        postalfield.placeholder = "Postal/Zip code"
        postalfield.borderStyle = UITextField.BorderStyle.roundedRect
        postalfield.autocorrectionType = UITextAutocorrectionType.no
        postalfield.keyboardType = UIKeyboardType.default
        postalfield.returnKeyType = UIReturnKeyType.done
        postalfield.clearButtonMode = UITextField.ViewMode.whileEditing
        postalfield.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        self.cellviewC.contentView.addConstraint(NSLayoutConstraint(item: postalfield, attribute: .top, relatedBy: .equal, toItem: citytitle, attribute: .bottom, multiplier: 1, constant: 5))
        self.cellviewC.contentView.addConstraint(NSLayoutConstraint(item: postalfield, attribute: .leading, relatedBy: .equal, toItem: self.cellviewC.contentView, attribute: .leading, multiplier: 1, constant: 20))
        
        let postaltitle = UILabel()
        postaltitle.tag = Int(position)!
        postaltitle.text = "Postal/Zip code"
        self.cellviewC.contentView.addSubview(postaltitle)
        postaltitle.translatesAutoresizingMaskIntoConstraints = false
        postaltitle.numberOfLines = 30
        postaltitle.font = citytitle.font.withSize(17)
        self.cellviewC.contentView.addConstraint(NSLayoutConstraint(item: postaltitle, attribute: .top, relatedBy: .equal, toItem: postalfield, attribute: .bottom, multiplier: 1, constant: 5))
        self.cellviewC.contentView.addConstraint(NSLayoutConstraint(item: postaltitle, attribute: .leading, relatedBy: .equal, toItem: self.cellviewC.contentView, attribute: .leading, multiplier: 1, constant: 20))

        let statefield =  UITextField()
        statefield.tag = aid4
        self.cellviewC.contentView.addSubview(statefield)
        let heightConstraine = statefield.heightAnchor.constraint(equalToConstant: 35)
        let widthConstraine = statefield.widthAnchor.constraint(equalToConstant: CGFloat(phoneWidth/2 - 10))
        self.cellviewC.contentView.addConstraints([widthConstraine, heightConstraine])
        statefield.translatesAutoresizingMaskIntoConstraints = false
        statefield.font = UIFont.systemFont(ofSize: 15)
        statefield.placeholder = "State/province"
        statefield.borderStyle = UITextField.BorderStyle.roundedRect
        statefield.autocorrectionType = UITextAutocorrectionType.no
        statefield.keyboardType = UIKeyboardType.default
        statefield.returnKeyType = UIReturnKeyType.done
        statefield.clearButtonMode = UITextField.ViewMode.whileEditing
        statefield.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        self.cellviewC.contentView.addConstraint(NSLayoutConstraint(item: statefield, attribute: .top, relatedBy: .equal, toItem: linetitle, attribute: .bottom, multiplier: 1, constant: 5))
        self.cellviewC.contentView.addConstraint(NSLayoutConstraint(item: statefield, attribute: .leading, relatedBy: .equal, toItem: cityfield, attribute: .leading, multiplier: 1, constant: CGFloat(phoneWidth/2 + 10)))
        
        let statetitle = UILabel()
        statetitle.text = "State/Province/Region"
        self.cellviewC.contentView.addSubview(statetitle)
        statetitle.translatesAutoresizingMaskIntoConstraints = false
        statetitle.numberOfLines = 30
        statetitle.font = statetitle.font.withSize(17)
        self.cellviewC.contentView.addConstraint(NSLayoutConstraint(item: statetitle, attribute: .top, relatedBy: .equal, toItem: statefield, attribute: .bottom, multiplier: 1, constant: 5))
        self.cellviewC.contentView.addConstraint(NSLayoutConstraint(item: statetitle, attribute: .leading, relatedBy: .equal, toItem: self.cellviewC.contentView, attribute: .leading, multiplier: 1, constant: CGFloat(phoneWidth/2 + 30)))
        
        let dropdown = DropDown()
        dropdown.tag = aid6
        self.cellviewC.contentView.addSubview(dropdown)
        dropdown.translatesAutoresizingMaskIntoConstraints = false
        let heightConstraind = dropdown.heightAnchor.constraint(equalToConstant: 35)
        let widthConstraind = dropdown.widthAnchor.constraint(equalToConstant: CGFloat(phoneWidth/2 - 10))
        dropdown.layer.borderWidth = 1
        dropdown.layer.cornerRadius = 5
        dropdown.arrowSize = 0
        dropdown.selectedRowColor = UIColor.lightGray
        dropdown.layer.borderColor = UIColor(red: 0.945, green: 0.945, blue: 0.945, alpha: 1.0).cgColor
        self.cellviewC.contentView.addConstraints([widthConstraind, heightConstraind])
        self.cellviewC.contentView.addConstraint(NSLayoutConstraint(item: dropdown, attribute: .top, relatedBy: .equal, toItem: statetitle, attribute: .bottom, multiplier: 1, constant: 5))
        self.cellviewC.contentView.addConstraint(NSLayoutConstraint(item: dropdown, attribute: .leading, relatedBy: .equal, toItem: statefield, attribute: .leading, multiplier: 1, constant: 0))
        dropdown.optionArray = ["Option 1", "Option 2", "Option 3"]
        dropdown.optionIds = [1,23,54,22]
        
        let droptitle = UILabel()
        droptitle.text = "Country"
        self.cellviewC.contentView.addSubview(droptitle)
        droptitle.translatesAutoresizingMaskIntoConstraints = false
        droptitle.numberOfLines = 30
        droptitle.font = droptitle.font.withSize(17)
        self.cellviewC.contentView.addConstraint(NSLayoutConstraint(item: droptitle, attribute: .top, relatedBy: .equal, toItem: dropdown, attribute: .bottom, multiplier: 1, constant: 5))
        self.cellviewC.contentView.addConstraint(NSLayoutConstraint(item: droptitle, attribute: .leading, relatedBy: .equal, toItem: self.cellviewC.contentView, attribute: .leading, multiplier: 1, constant: CGFloat(phoneWidth/2 + 30)))
    }
    
    func MatrixLint(title:String, id:String, guide:String, position:String, beforetype:String, contraint:String){
        print("MatrixLint" + position)
        beforeObject(beforeObject: beforetype, beforeId: Int(position)! - 1)
        if(contraint != ""){
            
        }
        
    }
    
    func SectionLint(title:String, id:String, position:String, beforetype:String){
        print("SectionLint" + position)
        beforeObject(beforeObject: beforetype, beforeId: Int(position)! - 1)
        let did = Int(position)!
        
        let sectiontitle = UILabel()
        sectiontitle.text = title
        self.cellviewC.contentView.addSubview(sectiontitle)
        sectiontitle.translatesAutoresizingMaskIntoConstraints = false
        sectiontitle.numberOfLines = 30
        sectiontitle.font = sectiontitle.font.withSize(17)
        self.cellviewC.contentView.addConstraint(NSLayoutConstraint(item: sectiontitle, attribute: .top, relatedBy: .equal, toItem: beforeobject, attribute: .bottom, multiplier: 1, constant: 10))
        self.cellviewC.contentView.addConstraint(NSLayoutConstraint(item: sectiontitle, attribute: .leading, relatedBy: .equal, toItem: self.cellviewC.contentView, attribute: .leading, multiplier: 1, constant: 20))
        self.cellviewC.contentView.addConstraint(NSLayoutConstraint(item: sectiontitle, attribute: .trailing, relatedBy: .equal, toItem: self.cellviewC.contentView, attribute: .trailing, multiplier: 1, constant: 20))
        
        
        let elemendes = UILabel()
        elemendes.tag = did
        elemendes.text = "title descrtption"
        
        self.cellviewC.contentView.addSubview(elemendes)
        elemendes.translatesAutoresizingMaskIntoConstraints = false
        elemendes.numberOfLines = 30
        elemendes.font = elemendes.font.withSize(17)
        self.cellviewC.contentView.addConstraint(NSLayoutConstraint(item: elemendes, attribute: .top, relatedBy: .equal, toItem: sectiontitle, attribute: .bottom, multiplier: 1, constant: 10))
        self.cellviewC.contentView.addConstraint(NSLayoutConstraint(item: elemendes, attribute: .leading, relatedBy: .equal, toItem: self.cellviewC.contentView, attribute: .leading, multiplier: 1, constant: 20))
        self.cellviewC.contentView.addConstraint(NSLayoutConstraint(item: elemendes, attribute: .trailing, relatedBy: .equal, toItem: self.cellviewC.contentView, attribute: .trailing, multiplier: 1, constant: 20))
    }
    
    func beforeObject(beforeObject:String, beforeId:Int){
        if(beforeId < 1000){
            beforeobject = mainguideL
        }else{
            switch beforeObject {
                case "number":
                    beforeobject = (self.cellviewC.contentView.viewWithTag(beforeId) as? UITextField)!
                case "europe_date":
                    beforeobject = (self.cellviewC.contentView.viewWithTag(beforeId) as? UITextField)!
                case "email":
                    beforeobject = (self.cellviewC.contentView.viewWithTag(beforeId) as? UITextField)!
                case "file":
                    beforeobject = (self.cellviewC.contentView.viewWithTag(beforeId) as? UIImageView)!
                case "money":
                    beforeobject = (self.cellviewC.contentView.viewWithTag(beforeId) as? UITextField)!
                case "text":
                    beforeobject = (self.cellviewC.contentView.viewWithTag(beforeId) as? UITextField)!
                case "signature":
                    beforeobject = (self.cellviewC.contentView.viewWithTag(beforeId) as? UIButton)!
                case "simple_name":
                    beforeobject = (self.cellviewC.contentView.viewWithTag(beforeId) as? UITextField)!
                case "media":
                    beforeobject = (self.cellviewC.contentView.viewWithTag(beforeId) as? UIImageView)!
                case "phone":
                    beforeobject = (self.cellviewC.contentView.viewWithTag(beforeId) as? UITextField)!
                case "date":
                    beforeobject = (self.cellviewC.contentView.viewWithTag(beforeId) as? UITextField)!
                case "select":
                    beforeobject = (self.cellviewC.contentView.viewWithTag(beforeId) as? DropDown)!
                case "checkbox":
                    beforeobject = (self.cellviewC.contentView.viewWithTag(beforeId) as? UIButton)!
                case "radio":
                    beforeobject = (self.cellviewC.contentView.viewWithTag(beforeId) as? SSRadioButton)!
                case "time":
                    beforeobject = (self.cellviewC.contentView.viewWithTag(beforeId) as? UITextField)!
                case "url":
                    beforeobject = (self.cellviewC.contentView.viewWithTag(beforeId) as? UITextField)!
                case "textarea":
                    beforeobject = (self.cellviewC.contentView.viewWithTag(beforeId) as? UITextView)!
                case "pagebreak":
                    beforeobject = (self.cellviewC.contentView.viewWithTag(beforeId) as? UIButton)!
                case "address":
                    beforeobject = (self.cellviewC.contentView.viewWithTag(beforeId) as? UITextField)!
                case "matrix":
                    beforeobject = (self.cellviewC.contentView.viewWithTag(beforeId) as? SSRadioButton)!
                case "section":
                    beforeobject = (self.cellviewC.contentView.viewWithTag(beforeId) as? UILabel)!
                default:
                    beforeobject = (self.cellviewC.contentView.viewWithTag(beforeId) as? UILabel)!
            }
        }
        
    }
 
    @IBAction func backBtn(_ sender: Any) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "mainView") as! MainViewController
        self.present(newViewController, animated: true, completion: nil)
    }
    
   func didSelectButton(selectedButton: UIButton?) {
       print("  \(String(describing: selectedButton?.tag))")
   }
    
    func textFieldlayout(hint:String, tagId:Int, edittagId:Int, type:String) {
            
        let theLabel = self.cellviewC.contentView.viewWithTag(tagId) as? UILabel
            
        let sampleTextField =  UITextField()
        if(type == "number"){
            sampleTextField.delegate = self
        }
        sampleTextField.tag = edittagId
        self.cellviewC.contentView.addSubview(sampleTextField)
        let heightConstraint = sampleTextField.heightAnchor.constraint(equalToConstant: 35)
        let widthConstraint = sampleTextField.widthAnchor.constraint(equalToConstant: CGFloat(phoneWidth))
        self.cellviewC.contentView.addConstraints([widthConstraint, heightConstraint])
        sampleTextField.keyboardType = .numberPad
        sampleTextField.translatesAutoresizingMaskIntoConstraints = false
        sampleTextField.placeholder = hint
        sampleTextField.font = UIFont.systemFont(ofSize: 15)
        sampleTextField.borderStyle = UITextField.BorderStyle.roundedRect
        sampleTextField.autocorrectionType = UITextAutocorrectionType.no
        sampleTextField.keyboardType = UIKeyboardType.default
        sampleTextField.returnKeyType = UIReturnKeyType.done
        sampleTextField.clearButtonMode = UITextField.ViewMode.whileEditing
        sampleTextField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        self.cellviewC.contentView.addConstraint(NSLayoutConstraint(item: sampleTextField, attribute: .top, relatedBy: .equal, toItem: theLabel, attribute: .bottom, multiplier: 1, constant: 5))
        self.cellviewC.contentView.addConstraint(NSLayoutConstraint(item: sampleTextField, attribute: .leading, relatedBy: .equal, toItem: self.cellviewC.contentView, attribute: .leading, multiplier: 1, constant: 20))
    }
        
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange,
                               replacementString string: String) -> Bool{
    //        let maxLength = 3
    //        let currentString: NSString = textField.text! as NSString
    //        let newString: NSString =
    //            currentString.replacingCharacters(in: range, with: string) as NSString
    //        return newString.length <= maxLength
        if string.rangeOfCharacter(from: NSCharacterSet.decimalDigits) != nil {
            return true
        } else {
        return false
        }
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
