import UIKit
import iOSDropDown
import SwiftSignatureView
import CoreData
import RadioGroup

class FormViewController: UIViewController
, UITableViewDelegate
, UITableViewDataSource
, UITextFieldDelegate
, UIImagePickerControllerDelegate
, UINavigationControllerDelegate
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
    var radioButtonController: SSRadioButtonsController?
    var formelement:[FormElementData] = []
    var formoption:[FormElementOptionData] = []
    var beforetype:String = ""
    var beforeposition:Int = 0
    var beforeobject:AnyObject = UILabel()
    private var groupkey:NSMutableArray!
    private var grouplist:NSMutableArray!
    
    var element_data:[String:String] = [:]
    var textTag:[Int] = []
    var textElement:[Int:String] = [:]
    var numberTag:[Int] = []
    var numberElement:[Int:String] = [:]
    var dateTag:Int = 0
    var dateElement:String = ""
    var eurodatetag:Int = 0
    var eurodateEle:String = ""
    var fileTag:[Int] = []
    var fileElement:[Int:String] = [:]
    var photoid:Int = 0
    var emailtag:Int = 0
    var emailElement:String = ""
    var moneytag1:Int = 0
    var moneytag2:Int = 0
    var moneyElement:String = ""
    var signatureTag:[Int] = []
    var signatureElement:[Int:String] = [:]
    var nametag1:[Int] = []
    var nametag2:[Int] = []
    var nameElement:[Int:String] = [:]
    var phonetag1:Int = 0
    var phonetag2:Int = 0
    var phonetag3:Int = 0
    var phoneElement:String = ""
    var dropdownTag:[Int] = []
    var dropdownElement:[Int:String] = [:]
    var addressdrop:String = ""
    var timetag:Int = 0
    var timeElement:String = ""
    var urltag:Int = 0
    var urlElement:String = ""
    var areatag:Int = 0
    var areaElement:String = ""
    var addresstag1:Int = 0
    var addresstag2:Int = 0
    var addresstag3:Int = 0
    var addresstag4:Int = 0
    var addresstag5:Int = 0
    var addressdropTag:Int = 0
    var addressEle1:String = ""
    var addressEle2:String = ""
    var addressEle3:String = ""
    var addressEle4:String = ""
    var addressEle5:String = ""
    var radioElement:[Int:String] = [:]
    var matrixTag:[Int] = []
    var matrixElement:[Int:String] = [:]
    var checkboxEle:[Int:String] = [:]
    var signatruetag:[Int] = []
    var signaturebtntag:[Int] = []
    var radiogroupTag:[Int] = []
    var checkboxTag:[Int] = []
    var mediaTag:[Int] = []
    var fileimageTag:[Int] = []
    var beforetag:Int = 0
    var nextTag:Int = 0
    var sectionTag:[Int] = []
    var checkboxtag:[Int] = []
    var checktitle:[Int] = []
    var checklabel:[Int] = []
    var sectiontitle:[Int] = []
    
    
    
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
            var fomesort:[FormElementData] = []
           for i in 0 ..< groupkey.count{
               var formEle:[FormElementData] = []
               for j in 0 ..< formelement.count {
                if(groupkey.object(at: i) as! String) == formelement[j].element_pageNum!{
                    formEle.append(formelement[j])
                   }
               }
            formEle.sort(){$0.element_pageNum! < $1.element_pageNum!}
            fomesort = formEle.sorted { $0.element_position < $1.element_position}
            grouplist.add(fomesort)
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
                beforeposition = Int(tododatas[i].element_position - 1)
            }else{
                beforetype = tododatas[j].element_type!
                beforeposition = Int(tododatas[j].element_position)
            }
            switch tododatas[i].element_type {
                case "number":
                    NumberLint(title: tododatas[i].element_title!, id:tododatas[i].element_id!, position: Int(tododatas[i].element_position), beforetype: beforetype,beposition: beforeposition)
                case "europe_date":
                    DateLint(title: tododatas[i].element_title!, id:tododatas[i].element_id!, position: Int(tododatas[i].element_position), beforetype: beforetype,beposition: beforeposition)
                case "file":
                    FileLint(title: tododatas[i].element_title!, id:tododatas[i].element_id!, position: Int(tododatas[i].element_position), beforetype: beforetype,beposition: beforeposition)
                case "email":
                    EmailLint(title: tododatas[i].element_title!, id:tododatas[i].element_id!, position: Int(tododatas[i].element_position), beforetype: beforetype,beposition: beforeposition)
                case "money":
                    MoneyLint(title: tododatas[i].element_title!, id:tododatas[i].element_id!, position: Int(tododatas[i].element_position), beforetype: beforetype,beposition: beforeposition)
                case "text":
                    TextLint(title: tododatas[i].element_title!, id:tododatas[i].element_id!, position: Int(tododatas[i].element_position), beforetype: beforetype,beposition: beforeposition)
                case "signature":
                    SingatureLint(title: tododatas[i].element_title!, id:tododatas[i].element_id!, position: Int(tododatas[i].element_position), beforetype: beforetype,beposition: beforeposition)
                case "simple_name":
                    SimplenameLint(title: tododatas[i].element_title!, id:tododatas[i].element_id!, position: Int(tododatas[i].element_position), beforetype: beforetype,beposition: beforeposition)
                case "media":
                    MediaLint(title: tododatas[i].element_title!, type: tododatas[i].element_type!, imagesrc: tododatas[i].element_mediaImageSrc!, pdfsrc: tododatas[i].element_mediaPdfSrc!, position: Int(tododatas[i].element_position), beforetype: beforetype,beposition: beforeposition, iamge: tododatas[i].image!)
                case "phone":
                    PhoneLint(title: tododatas[i].element_title!, id:tododatas[i].element_id!, position: Int(tododatas[i].element_position), beforetype: beforetype,beposition: beforeposition)
                case "date":
                    DateLint(title: tododatas[i].element_title!, id:tododatas[i].element_id!, position: Int(tododatas[i].element_position), beforetype: beforetype,beposition: beforeposition)
                case "select":
                    SelectLint(title: tododatas[i].element_title!, id:tododatas[i].element_id!, position: Int(tododatas[i].element_position), beforetype: beforetype,beposition: beforeposition)
                case "checkbox":
                    CheckboxLint(title: tododatas[i].element_title!, id:tododatas[i].element_id!, position: Int(tododatas[i].element_position), beforetype: beforetype,beposition:beforeposition)
                case "radio":
                    RadioLint(title: tododatas[i].element_title!, id:tododatas[i].element_id!, position: Int(tododatas[i].element_position), beforetype: beforetype,beposition: beforeposition)
                case "time":
                    TimeLint(title: tododatas[i].element_title!, id:tododatas[i].element_id!, position: Int(tododatas[i].element_position), beforetype: beforetype,beposition: beforeposition)
                case "url":
                    UrlLint(title: tododatas[i].element_title!, id:tododatas[i].element_id!, position: Int(tododatas[i].element_position), beforetype: beforetype,beposition: beforeposition)
                case "textarea":
                    TextareaLint(title: tododatas[i].element_title!, id:tododatas[i].element_id!, position: Int(tododatas[i].element_position), beforetype: beforetype,beposition: beforeposition)
                case "page_break":
                    PagebreakLint(id:tododatas[i].element_id!, position: Int(tododatas[i].element_position), beforetype: beforetype,beposition: beforeposition, pagenumber: PageNum)
                case "address":
                    AddressLint(title: tododatas[i].element_title!, id:tododatas[i].element_id!, checkline: tododatas[i].element_addressLine2!, position: Int(tododatas[i].element_position), beforetype: beforetype,beposition: beforeposition)
                case "matrix":
                    MatrixLint(title: tododatas[i].element_title!, id:tododatas[i].element_id!,guide: tododatas[i].element_guidelines!
                        , position: Int(tododatas[i].element_position), beforetype: beforetype, contraint: tododatas[i].element_constraint!,beposition: beforeposition)
                default:
                    SectionLint(title: tododatas[i].element_title!, id:tododatas[i].element_id!, position: Int(tododatas[i].element_position), beforetype: beforetype,beposition: beforeposition, des: tododatas[i].element_guidelines!)
            }
        }
        if(PageNum == maxPageNum){
            showSubmit()
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
        return 2500
    }
    
    func showSubmit(){
        
    }
    
    func elementTitle(etitle:String, id:Int){
        let Etitle = UILabel()
        Etitle.attributedText = etitle.htmlToAttributedString
        Etitle.tag = id + 1000
        self.cellviewC.contentView.addSubview(Etitle)
        Etitle.translatesAutoresizingMaskIntoConstraints = false
        let width = Etitle.widthAnchor.constraint(equalToConstant: CGFloat(phoneWidth))
        self.cellviewC.contentView.addConstraints([width])
        Etitle.numberOfLines = 30
        Etitle.font = Etitle.font.withSize(17)
        self.cellviewC.contentView.addConstraint(NSLayoutConstraint(item: Etitle, attribute: .top, relatedBy: .equal, toItem: beforeobject, attribute: .bottom, multiplier: 1, constant: 10))
        self.cellviewC.contentView.addConstraint(NSLayoutConstraint(item: Etitle, attribute: .leading, relatedBy: .equal, toItem: self.cellviewC.contentView, attribute: .leading, multiplier: 1, constant: 20))
    }
    
    func NumberLint (title:String, id:String, position:Int, beforetype:String, beposition:Int){
        print("numberlint" + String(position))
        beforeObject(beforeObject: beforetype, beforeId: beposition)
        elementTitle(etitle: title, id: position)
        
        let numbereid = position
        let title = (self.cellviewC.contentView.viewWithTag(position + 1000) as? UILabel)!
        
        let numberTextField =  UITextField()
        numberTextField.delegate = self
        numberTextField.tag = numbereid
        numberTag.append(numbereid)
        numberElement[numbereid] = "element_" + id
        self.cellviewC.contentView.addSubview(numberTextField)
        let heightConstraint = numberTextField.heightAnchor.constraint(equalToConstant: 35)
        let widthConstraint = numberTextField.widthAnchor.constraint(equalToConstant: CGFloat(phoneWidth))
        self.cellviewC.contentView.addConstraints([widthConstraint, heightConstraint])
        numberTextField.keyboardType = .numberPad
        numberTextField.translatesAutoresizingMaskIntoConstraints = false
        numberTextField.placeholder = "Please write number"
        numberTextField.font = UIFont.systemFont(ofSize: 15)
        numberTextField.borderStyle = UITextField.BorderStyle.roundedRect
        numberTextField.autocorrectionType = UITextAutocorrectionType.no
        numberTextField.keyboardType = UIKeyboardType.default
        numberTextField.returnKeyType = UIReturnKeyType.done
        numberTextField.clearButtonMode = UITextField.ViewMode.whileEditing
        numberTextField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        self.cellviewC.contentView.addConstraint(NSLayoutConstraint(item: numberTextField, attribute: .top, relatedBy: .equal, toItem: title, attribute: .bottom, multiplier: 1, constant: 5))
        self.cellviewC.contentView.addConstraint(NSLayoutConstraint(item: numberTextField, attribute: .leading, relatedBy: .equal, toItem: self.cellviewC.contentView, attribute: .leading, multiplier: 1, constant: 20))
        
    }
    
    func DateLint(title:String, id:String, position:Int, beforetype:String, beposition:Int) {
        print("datelint" + String(position))
        beforeObject(beforeObject: beforetype, beforeId: beposition)
        elementTitle(etitle: title, id: position)
        
        let dateid = position
        let title = (self.cellviewC.contentView.viewWithTag(position + 1000) as? UILabel)!

        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MMM.yyyy"
        let result = formatter.string(from: date)

        let datefield =  UITextField()
        datefield.tag = dateid
        dateTag = dateid
        dateElement = "element_" + id
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
        self.cellviewC.contentView.addConstraint(NSLayoutConstraint(item: datefield, attribute: .top, relatedBy: .equal, toItem: title, attribute: .bottom, multiplier: 1, constant: 5))
        self.cellviewC.contentView.addConstraint(NSLayoutConstraint(item: datefield, attribute: .leading, relatedBy: .equal, toItem: self.cellviewC.contentView, attribute: .leading, multiplier: 1, constant: 20))

        datefield.setInputViewDatePicker(target: self, selector: #selector(tapDone))
    }
    
    @objc func tapDone(sender: UITextField) {
        let elementId = sender.tag
        let myTextField = self.cellviewC.contentView.viewWithTag(elementId) as? UITextField

        if let datePicker = myTextField!.inputView as? UIDatePicker { // 2-1
            let dateformatter = DateFormatter() // 2-2
            dateformatter.dateStyle = .medium // 2-3
            myTextField!.text = dateformatter.string(from: datePicker.date) //2-4
        }
        myTextField!.resignFirstResponder() // 2-5
    }
    
    func FileLint(title:String, id:String, position:Int, beforetype:String, beposition:Int) {
        print("FileLint" + String(position))
        beforeObject(beforeObject: beforetype, beforeId: beposition)
        elementTitle(etitle: title, id: position)
        
        let imageid = position
        fileimageTag.append(imageid)
        let title = (self.cellviewC.contentView.viewWithTag(position + 1000) as? UILabel)!

        let button = UIButton()
        button.tag = imageid + 5000
        self.cellviewC.contentView.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        let heightConstraint = button.heightAnchor.constraint(equalToConstant: 35)
        let widthConstraint = button.widthAnchor.constraint(equalToConstant: 150)
        self.cellviewC.contentView.addConstraints([widthConstraint, heightConstraint])
        button.layer.cornerRadius = 17.5
        button.backgroundColor = UIColor.gray
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.setTitle("FileUpload", for: .normal)
        self.cellviewC.contentView.addConstraint(NSLayoutConstraint(item: button, attribute: .top, relatedBy: .equal, toItem: title, attribute: .bottom, multiplier: 1, constant: 5))
        self.cellviewC.contentView.addConstraint(NSLayoutConstraint(item: button, attribute: .leading, relatedBy: .equal, toItem: self.cellviewC.contentView, attribute: .leading, multiplier: 1, constant: 20))
        button.addTarget(self, action: #selector(bottomAlert), for: .touchUpInside)
        
        let fileimage = UIImageView()
        fileimage.tag = imageid
        fileElement[imageid] = "element_" + id
        self.cellviewC.contentView.addSubview(fileimage)
        fileimage.translatesAutoresizingMaskIntoConstraints = false
        let widthimage = fileimage.widthAnchor.constraint(equalToConstant: 50)
        let heightimage = fileimage.heightAnchor.constraint(equalToConstant: 30)
        self.cellviewC.contentView.addConstraints([widthimage, heightimage])
        self.cellviewC.contentView.addConstraint(NSLayoutConstraint(item: fileimage, attribute: .top, relatedBy: .equal, toItem: button, attribute: .bottom, multiplier: 1, constant: 10))
        self.cellviewC.contentView.addConstraint(NSLayoutConstraint(item: fileimage, attribute: .leading, relatedBy: .equal, toItem: self.cellviewC.contentView, attribute: .leading, multiplier: 1, constant: 20))
    }
    
    @objc func bottomAlert(sender: UIButton){
        let elementId = sender.tag - 5000
        photoid = elementId
        let alert: UIAlertController = UIAlertController(title: nil, message: "Add photo", preferredStyle:  UIAlertController.Style.actionSheet)
        alert.view.tintColor = .black
        let cameraAction: UIAlertAction = UIAlertAction(title: "Use Camera", style: UIAlertAction.Style.default, handler:{
            (action: UIAlertAction!) -> Void in
            let vc = UIImagePickerController()
            vc.sourceType = .camera
            vc.allowsEditing = true
            vc.delegate = self
            self.present(vc, animated: true)
        })
        let galleryAction: UIAlertAction = UIAlertAction(title: "Upload from Gallery", style: UIAlertAction.Style.default, handler:{
            (action: UIAlertAction!) -> Void in
            let vc = UIImagePickerController()
            vc.sourceType = .photoLibrary
            vc.allowsEditing = true
            vc.delegate = self
            self.present(vc, animated: true)
        })
        alert.addAction(cameraAction)
        alert.addAction(galleryAction)

        present(alert, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true)
        guard let image = info[.editedImage] as? UIImage else {
            return
        }
        let imageview = self.cellviewC.contentView.viewWithTag(photoid) as? UIImageView
        imageview?.image = image
        
        let imageData:NSData = image.pngData()! as NSData

        let strBase64 = imageData.base64EncodedString(options: .lineLength64Characters)
        element_data[fileElement[photoid]!] = strBase64
//        print(strBase64)
    }
    
    func EmailLint(title:String, id:String, position:Int, beforetype:String, beposition:Int) {
        print("EmailLint" + String(position))
        beforeObject(beforeObject: beforetype, beforeId: beposition)
        elementTitle(etitle: title, id: position)
        
        let emailid = position
        let title = (self.cellviewC.contentView.viewWithTag(position + 1000) as? UILabel)!
        
        let emailTextField =  UITextField()
        emailTextField.tag = emailid
        emailtag = emailid
        emailElement = "element_" + id
        self.cellviewC.contentView.addSubview(emailTextField)
        let heightConstraint = emailTextField.heightAnchor.constraint(equalToConstant: 35)
        let widthConstraint = emailTextField.widthAnchor.constraint(equalToConstant: CGFloat(phoneWidth))
        self.cellviewC.contentView.addConstraints([widthConstraint, heightConstraint])
        emailTextField.keyboardType = .numberPad
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.placeholder = "Please write email"
        emailTextField.font = UIFont.systemFont(ofSize: 15)
        emailTextField.borderStyle = UITextField.BorderStyle.roundedRect
        emailTextField.autocorrectionType = UITextAutocorrectionType.no
        emailTextField.keyboardType = UIKeyboardType.default
        emailTextField.returnKeyType = UIReturnKeyType.done
        emailTextField.clearButtonMode = UITextField.ViewMode.whileEditing
        emailTextField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        self.cellviewC.contentView.addConstraint(NSLayoutConstraint(item: emailTextField, attribute: .top, relatedBy: .equal, toItem: title, attribute: .bottom, multiplier: 1, constant: 5))
        self.cellviewC.contentView.addConstraint(NSLayoutConstraint(item: emailTextField, attribute: .leading, relatedBy: .equal, toItem: self.cellviewC.contentView, attribute: .leading, multiplier: 1, constant: 20))
    }
    
    func MoneyLint(title:String, id:String, position:Int, beforetype:String, beposition:Int) {
        print("MoneyLint" + String(position))
        beforeObject(beforeObject: beforetype, beforeId: beposition)
        elementTitle(etitle: title, id: position)
        
        let dollerid = position
        let title = (self.cellviewC.contentView.viewWithTag(position + 1000) as? UILabel)!
        moneyElement = "element_" + id
        let startlable = UILabel()
        startlable.text = "$"
        self.cellviewC.contentView.addSubview(startlable)
        startlable.translatesAutoresizingMaskIntoConstraints = false
        startlable.font = startlable.font.withSize(17)
        self.cellviewC.contentView.addConstraint(NSLayoutConstraint(item: startlable, attribute: .top, relatedBy: .equal, toItem: title, attribute: .bottom, multiplier: 1, constant: 10))
        self.cellviewC.contentView.addConstraint(NSLayoutConstraint(item: startlable, attribute: .leading, relatedBy: .equal, toItem: self.cellviewC.contentView, attribute: .leading, multiplier: 1, constant: 20))
        
        let dollerField =  UITextField()
        dollerField.tag = dollerid
        moneytag1 = dollerid
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
        self.cellviewC.contentView.addConstraint(NSLayoutConstraint(item: dollerField, attribute: .top, relatedBy: .equal, toItem: title, attribute: .bottom, multiplier: 1, constant: 5))
        self.cellviewC.contentView.addConstraint(NSLayoutConstraint(item: dollerField, attribute: .leading, relatedBy: .equal, toItem: startlable, attribute: .leading, multiplier: 1, constant: 15))
        
        let comlable = UILabel()
        comlable.text = "."
        self.cellviewC.contentView.addSubview(comlable)
        comlable.translatesAutoresizingMaskIntoConstraints = false
        comlable.font = comlable.font.withSize(17)
        self.cellviewC.contentView.addConstraint(NSLayoutConstraint(item: comlable, attribute: .top, relatedBy: .equal, toItem: title, attribute: .bottom, multiplier: 1, constant: 20))
        self.cellviewC.contentView.addConstraint(NSLayoutConstraint(item: comlable, attribute: .leading, relatedBy: .equal, toItem: dollerField, attribute: .leading, multiplier: 1, constant: 135))
        
        let sentfield =  UITextField()
        sentfield.delegate = self
        sentfield.tag = dollerid + 2000
        moneytag2 = dollerid + 2000
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
        self.cellviewC.contentView.addConstraint(NSLayoutConstraint(item: sentfield, attribute: .top, relatedBy: .equal, toItem: title, attribute: .bottom, multiplier: 1, constant: 5))
        self.cellviewC.contentView.addConstraint(NSLayoutConstraint(item: sentfield, attribute: .leading, relatedBy: .equal, toItem: comlable, attribute: .leading, multiplier: 1, constant: 10))
    }
    
    func TextLint(title:String, id:String, position:Int, beforetype:String, beposition:Int) {
        print("TextLint" + String(position))
        beforeObject(beforeObject: beforetype, beforeId: beposition)
        elementTitle(etitle: title, id: position)
        
        let textid = position
        let title = (self.cellviewC.contentView.viewWithTag(position + 1000) as? UILabel)!

        let TextField =  UITextField()
        TextField.tag = textid
        textTag.append(textid)
        textElement[textid] = "element_" + id
        self.cellviewC.contentView.addSubview(TextField)
        let heightConstraint = TextField.heightAnchor.constraint(equalToConstant: 35)
        let widthConstraint = TextField.widthAnchor.constraint(equalToConstant: CGFloat(phoneWidth))
        self.cellviewC.contentView.addConstraints([widthConstraint, heightConstraint])
        TextField.keyboardType = .numberPad
        TextField.translatesAutoresizingMaskIntoConstraints = false
        TextField.placeholder = "Please write text"
        TextField.font = UIFont.systemFont(ofSize: 15)
        TextField.borderStyle = UITextField.BorderStyle.roundedRect
        TextField.autocorrectionType = UITextAutocorrectionType.no
        TextField.keyboardType = UIKeyboardType.default
        TextField.returnKeyType = UIReturnKeyType.done
        TextField.clearButtonMode = UITextField.ViewMode.whileEditing
        TextField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        self.cellviewC.contentView.addConstraint(NSLayoutConstraint(item: TextField, attribute: .top, relatedBy: .equal, toItem: title, attribute: .bottom, multiplier: 1, constant: 5))
        self.cellviewC.contentView.addConstraint(NSLayoutConstraint(item: TextField, attribute: .leading, relatedBy: .equal, toItem: self.cellviewC.contentView, attribute: .leading, multiplier: 1, constant: 20))
    }
    
    func SingatureLint(title:String, id:String, position:Int, beforetype:String, beposition:Int){
        print("SingatureLint" + String(position))
        beforeObject(beforeObject: beforetype, beforeId: beposition)
        elementTitle(etitle: title, id: position)
        
        let sid = position
        let title = (self.cellviewC.contentView.viewWithTag(position + 1000) as? UILabel)!
        
        let saveBtn = UIButton()
        saveBtn.tag = sid + 2001
        signaturebtntag.append(sid + 2001)
        saveBtn.backgroundColor = UIColor.lightGray
        saveBtn.setTitle("SAVE", for: .normal)
        self.cellviewC.contentView.addSubview(saveBtn)
        saveBtn.translatesAutoresizingMaskIntoConstraints = false
        let btnwidth =  saveBtn.widthAnchor.constraint(equalToConstant: 130)
        let btnheight = saveBtn.heightAnchor.constraint(equalToConstant: 35)
        self.cellviewC.contentView.addConstraints([btnwidth, btnheight])
        self.cellviewC.contentView.addConstraint(NSLayoutConstraint(item: saveBtn, attribute: .top, relatedBy: .equal, toItem: title, attribute: .bottom, multiplier: 1, constant: 10))
        self.cellviewC.contentView.addConstraint(NSLayoutConstraint(item: saveBtn, attribute: .leading, relatedBy: .equal, toItem: self.cellviewC.contentView, attribute: .leading, multiplier: 1, constant: 20))
        saveBtn.addTarget(self, action: #selector(saveSignature), for: .touchUpInside)
        
        let deleteBtn = UIButton()
        deleteBtn.tag = sid + 2002
        signaturebtntag.append(sid + 2002)
        deleteBtn.setTitle("CLEAR", for: .normal)
        deleteBtn.backgroundColor = UIColor.lightGray
        self.cellviewC.contentView.addSubview(deleteBtn)
        deleteBtn.translatesAutoresizingMaskIntoConstraints = false
        let btnwidthd =  deleteBtn.widthAnchor.constraint(equalToConstant: 130)
        let btnheightd = deleteBtn.heightAnchor.constraint(equalToConstant: 35)
        self.cellviewC.contentView.addConstraints([btnwidthd, btnheightd])
        self.cellviewC.contentView.addConstraint(NSLayoutConstraint(item: deleteBtn, attribute: .top, relatedBy: .equal, toItem: title, attribute: .bottom, multiplier: 1, constant: 10))
        self.cellviewC.contentView.addConstraint(NSLayoutConstraint(item: deleteBtn, attribute: .leading, relatedBy: .equal, toItem: saveBtn, attribute: .leading, multiplier: 1, constant: 140))
        
        
        let signature = Canvas()
        signature.setStrokeColor(color: .black)
        signature.tag = sid
        signatureTag.append(sid)
        signatureTag.append(sid)
        signatureElement[sid] = "element_" + id
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
        self.cellviewC.contentView.addConstraint(NSLayoutConstraint(item: signature, attribute: .top, relatedBy: .equal, toItem: saveBtn, attribute: .bottom, multiplier: 1, constant: 5))
        self.cellviewC.contentView.addConstraint(NSLayoutConstraint(item: signature, attribute: .leading, relatedBy: .equal, toItem: self.cellviewC.contentView, attribute: .leading, multiplier: 1, constant: 20))
        
        deleteBtn.addTarget(self, action: #selector(clearSignature), for: .touchUpInside)
        
    }
    
    @objc func saveSignature(sender:UIButton){
            let btnId = sender.tag - 2001
            let signture = (self.cellviewC.contentView.viewWithTag(btnId) as? Canvas)!
            let image = savecontact(with: signture)
            let imageData:NSData = image!.pngData()! as NSData

            let strBase64 = imageData.base64EncodedString(options: .lineLength64Characters)
            element_data[signatureElement[btnId]!] = strBase64
            FormViewController.table.isScrollEnabled = true
        }
        
    @objc func clearSignature(sender: UIButton) {
        let btn_id = sender.tag - 2
        let signature = (self.cellviewC.contentView.viewWithTag(btn_id) as? Canvas)!
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
    
    func SimplenameLint(title:String, id:String, position:Int, beforetype:String, beposition:Int){
        print("SimplenameLint" + String(position))
        beforeObject(beforeObject: beforetype, beforeId: beposition)
        elementTitle(etitle: title, id: position)
        
        let firstid = position
        nameElement[position] =  "element" + id
        let title = (self.cellviewC.contentView.viewWithTag(position + 1000) as? UILabel)!
        
        let firstField =  UITextField()
        firstField.tag = firstid
        nametag1.append(firstid)
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
        self.cellviewC.contentView.addConstraint(NSLayoutConstraint(item: firstField, attribute: .top, relatedBy: .equal, toItem: title, attribute: .bottom, multiplier: 1, constant: 5))
        self.cellviewC.contentView.addConstraint(NSLayoutConstraint(item: firstField, attribute: .leading, relatedBy: .equal, toItem: self.cellviewC.contentView, attribute: .leading, multiplier: 1, constant: 20))
        
        let lastfield =  UITextField()
        lastfield.tag = firstid + 7000
        nametag2.append(firstid + 7000)
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
        self.cellviewC.contentView.addConstraint(NSLayoutConstraint(item: lastfield, attribute: .top, relatedBy: .equal, toItem: title, attribute: .bottom, multiplier: 1, constant: 5))
        self.cellviewC.contentView.addConstraint(NSLayoutConstraint(item: lastfield, attribute: .leading, relatedBy: .equal, toItem: firstField, attribute: .leading, multiplier: 1, constant: 140))
    }
    
    func MediaLint(title:String, type:String, imagesrc:String, pdfsrc:String, position:Int, beforetype:String, beposition:Int, iamge:Data){
        let uiImage: UIImage = UIImage(data: iamge)!
        print("MediaLint" + String(position))
        beforeObject(beforeObject: beforetype, beforeId: beposition)
        
        let media = UIImageView()
        media.tag = position
        mediaTag.append(position)
        self.cellviewC.contentView.addSubview(media)
        media.translatesAutoresizingMaskIntoConstraints = false
        media.image = uiImage
        let width = media.widthAnchor.constraint(equalToConstant: 150)
        let height = media.heightAnchor.constraint(equalToConstant: 150)
        self.cellviewC.contentView.addConstraints([width, height])
        media.layer.borderWidth = 1
        media.layer.cornerRadius = 5
        media.layer.borderColor = UIColor(red: 0.945, green: 0.945, blue: 0.945, alpha: 1.0).cgColor
        self.cellviewC.contentView.addConstraint(NSLayoutConstraint(item: media, attribute: .top, relatedBy: .equal, toItem: beforeobject, attribute: .bottom, multiplier: 1, constant: 5))
        self.cellviewC.contentView.addConstraint(NSLayoutConstraint(item: media, attribute: .leading, relatedBy: .equal, toItem: self.cellviewC.contentView, attribute: .leading, multiplier: 1, constant: 20))
    
    }
    
    func PhoneLint(title:String, id:String, position:Int, beforetype:String, beposition:Int){
        print("PhoneLint" + String(position))
        beforeObject(beforeObject: beforetype, beforeId: beposition)
        elementTitle(etitle: title, id: position)
        
        let pid1 = position
        phoneElement = "element_" + id
        let title = (self.cellviewC.contentView.viewWithTag(position + 1000) as? UILabel)!
        
        let firstField =  UITextField()
        firstField.tag = pid1
        phonetag1 = pid1
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
        self.cellviewC.contentView.addConstraint(NSLayoutConstraint(item: firstField, attribute: .top, relatedBy: .equal, toItem: title, attribute: .bottom, multiplier: 1, constant: 5))
        self.cellviewC.contentView.addConstraint(NSLayoutConstraint(item: firstField, attribute: .leading, relatedBy: .equal, toItem: self.cellviewC.contentView, attribute: .leading, multiplier: 1, constant: 20))
        
        let comlable = UILabel()
        comlable.text = "-"
        self.cellviewC.contentView.addSubview(comlable)
        comlable.translatesAutoresizingMaskIntoConstraints = false
        comlable.font = comlable.font.withSize(17)
        self.cellviewC.contentView.addConstraint(NSLayoutConstraint(item: comlable, attribute: .top, relatedBy: .equal, toItem: title, attribute: .bottom, multiplier: 1, constant: 10))
        self.cellviewC.contentView.addConstraint(NSLayoutConstraint(item: comlable, attribute: .leading, relatedBy: .equal, toItem: firstField, attribute: .leading, multiplier: 1, constant: 81))
        
        let secontField =  UITextField()
        secontField.delegate = self
        secontField.tag = pid1 + 1001
        phonetag2 = pid1 + 1001
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
        self.cellviewC.contentView.addConstraint(NSLayoutConstraint(item: secontField, attribute: .top, relatedBy: .equal, toItem: title, attribute: .bottom, multiplier: 1, constant: 5))
        self.cellviewC.contentView.addConstraint(NSLayoutConstraint(item: secontField, attribute: .leading, relatedBy: .equal, toItem: comlable, attribute: .leading, multiplier: 1, constant: 15))
        
        let comlables = UILabel()
        comlables.text = "-"
        self.cellviewC.contentView.addSubview(comlables)
        comlables.translatesAutoresizingMaskIntoConstraints = false
        comlables.font = comlables.font.withSize(17)
        self.cellviewC.contentView.addConstraint(NSLayoutConstraint(item: comlables, attribute: .top, relatedBy: .equal, toItem: title, attribute: .bottom, multiplier: 1, constant: 10))
        self.cellviewC.contentView.addConstraint(NSLayoutConstraint(item: comlables, attribute: .leading, relatedBy: .equal, toItem: secontField, attribute: .leading, multiplier: 1, constant: 81))
        
        let thirdField =  UITextField()
        thirdField.delegate = self
        thirdField.tag = pid1 + 1002
        phonetag3 = pid1 + 1002
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
        self.cellviewC.contentView.addConstraint(NSLayoutConstraint(item: thirdField, attribute: .top, relatedBy: .equal, toItem: title, attribute: .bottom, multiplier: 1, constant: 5))
        self.cellviewC.contentView.addConstraint(NSLayoutConstraint(item: thirdField, attribute: .leading, relatedBy: .equal, toItem: comlables, attribute: .leading, multiplier: 1, constant: 15))
    }
    
    func SelectLint(title:String, id:String, position:Int, beforetype:String, beposition:Int){
        print("SelectLint" + String(position))
        beforeObject(beforeObject: beforetype, beforeId: beposition)
        elementTitle(etitle: title, id: position)
        formoption = UserLocal.getSFODatas(formid: formid, elementid: id)
        
        let did = position
        dropdownTag.append(did)
        let title = (self.cellviewC.contentView.viewWithTag(position + 1000) as? UILabel)!
        
        let dropdown = DropDown()
        dropdown.tag = did
        dropdownElement[did] = "element_" + id
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
        self.cellviewC.contentView.addConstraint(NSLayoutConstraint(item: dropdown, attribute: .top, relatedBy: .equal, toItem: title, attribute: .bottom, multiplier: 1, constant: 5))
        self.cellviewC.contentView.addConstraint(NSLayoutConstraint(item: dropdown, attribute: .leading, relatedBy: .equal, toItem: self.cellviewC.contentView, attribute: .leading, multiplier: 1, constant: 20))
        for i in 0...formoption.count - 1{
            dropdown.optionArray.append(formoption[i].option!)
        }
        dropdown.didSelect{(selectedText , index ,id) in
            self.element_data[self.dropdownElement[did]!] = String(index + 1)
        }
    }
    
    func CheckboxLint(title:String, id:String, position:Int, beforetype:String, beposition:Int){
        print("CheckboxLint" + String(position))
        beforeObject(beforeObject: beforetype, beforeId: beposition)
        elementTitle(etitle: title, id: position)
        
        formoption = UserLocal.getSFODatas(formid: formid, elementid: id)
        
        let did = position
        let title = (self.cellviewC.contentView.viewWithTag(position + 1000) as? UILabel)!
        checktitle.append(position + 1000)
        
        for i in 0...formoption.count - 1 {
            let checkbtn = UIButton()
            checkbtn.setImage( UIImage(named:"uncheck"), for: .normal)
            checkbtn.addTarget(self, action:  #selector(buttonClicked), for: .touchUpInside)
            checkbtn.tag = did + (i + 1) * 500
            checkboxTag.append(did + (i + 1) * 500)
            checkboxEle[did + (i + 1) * 500] = "element_" + id + String(i + 1)
            if(i == formoption.count - 1){
                checkbtn.tag = did
                checkboxTag.append(did)
                checkboxEle[did] = "element_" + id + String(formoption.count)
            }
            self.cellviewC.contentView.addSubview(checkbtn)
            checkbtn.translatesAutoresizingMaskIntoConstraints = false
            let heightConstraint = checkbtn.heightAnchor.constraint(equalToConstant: 20)
            let widthConstraint = checkbtn.widthAnchor.constraint(equalToConstant: 20)
            self.cellviewC.contentView.addConstraints([widthConstraint, heightConstraint])
            self.cellviewC.contentView.addConstraint(NSLayoutConstraint(item: checkbtn, attribute: .top, relatedBy: .equal, toItem: title, attribute: .bottom, multiplier: 1, constant: CGFloat(10 + i * 23)))
            self.cellviewC.contentView.addConstraint(NSLayoutConstraint(item: checkbtn, attribute: .leading, relatedBy: .equal, toItem: self.cellviewC.contentView, attribute: .leading, multiplier: 1, constant: 20))
            
            let label = UILabel()
            label.tag = did + 600
            checklabel.append(did + 600)
            label.text = formoption[i].option
            label.numberOfLines = 30
            label.font = label.font.withSize(16)
            self.cellviewC.contentView.addSubview(label)
            label.translatesAutoresizingMaskIntoConstraints = false
            self.cellviewC.contentView.addConstraint(NSLayoutConstraint(item: label, attribute: .top, relatedBy: .equal, toItem: title, attribute: .bottom, multiplier: 1, constant: CGFloat(10 + i * 23)))
            self.cellviewC.contentView.addConstraint(NSLayoutConstraint(item: label, attribute: .leading, relatedBy: .equal, toItem: checkbtn, attribute: .leading, multiplier: 1, constant: 27))
        }
    }
    
    @objc func buttonClicked(_ sender: UIButton) {
        let btnId = sender.tag
        if unchecked {
            sender.setImage( UIImage(named:"check"), for: .normal)
            unchecked = false
            element_data[checkboxEle[btnId]!] = String(1)
       }
       else {
            sender.setImage(UIImage(named:"uncheck"), for: .normal)
            unchecked = true
            element_data[checkboxEle[btnId]!] = String(0)
       }
    }
    
    func RadioLint(title:String, id:String, position:Int, beforetype:String, beposition:Int){
        print("RadioLint" + String(position))
        beforeObject(beforeObject: beforetype, beforeId: beposition)
        elementTitle(etitle: title, id: position)
        formoption = UserLocal.getSFODatas(formid: formid, elementid: id)
        var radiotile:[String] = []
        let radio3 = position
        radioElement[radio3] = "element_" + id
        let title = (self.cellviewC.contentView.viewWithTag(position + 1000) as? UILabel)!
        
        let radioGroup = RadioGroup()
        for i in 0...formoption.count - 1{
            radiotile.append(formoption[i].option!)
        }
        radioGroup.titles = radiotile
        radioGroup.tintColor = .gray
        
        radioGroup.selectedColor = .orange
        self.cellviewC.contentView.addSubview(radioGroup)
        radioGroup.translatesAutoresizingMaskIntoConstraints = false
        radioGroup.tag = radio3
        radiogroupTag.append(radio3)
        self.cellviewC.contentView.addConstraint(NSLayoutConstraint(item: radioGroup, attribute: .top, relatedBy: .equal, toItem: title, attribute: .bottom, multiplier: 1, constant: 10))
        self.cellviewC.contentView.addConstraint(NSLayoutConstraint(item: radioGroup, attribute: .leading, relatedBy: .equal, toItem: self.cellviewC.contentView, attribute: .leading, multiplier: 1, constant: 10))
        
        radioGroup.addTarget(self, action: #selector(didSelectOption(radioGroup:)), for: .valueChanged)
        radiotile.removeAll()

    }
    
    @objc func didSelectOption(radioGroup: RadioGroup) {
        let radioid = radioGroup.tag
        element_data[radioElement[radioid]!] = String(radioGroup.selectedIndex + 1)
        print(radioGroup.selectedIndex)
    }
    
    func TimeLint(title:String, id:String, position:Int, beforetype:String, beposition:Int){
        print("TimeLint" + String(position))
        beforeObject(beforeObject: beforetype, beforeId: beposition)
        elementTitle(etitle: title, id: position)
        
        let did = position
        timetag = did
        let title = (self.cellviewC.contentView.viewWithTag(position + 1000) as? UILabel)!
       
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
        self.cellviewC.contentView.addConstraint(NSLayoutConstraint(item: timefield, attribute: .top, relatedBy: .equal, toItem: title, attribute: .bottom, multiplier: 1, constant: 5))
        self.cellviewC.contentView.addConstraint(NSLayoutConstraint(item: timefield, attribute: .leading, relatedBy: .equal, toItem: self.cellviewC.contentView, attribute: .leading, multiplier: 1, constant: 20))
       
        timefield.setInputViewTimePicker(target: self, selector: #selector(timetap))

    }
    
    @objc func timetap(sender: UITextField) {
        let tid = sender.tag
        let myTextField = self.cellviewC.contentView.viewWithTag(tid) as? UITextField
        
        if let datePicker = myTextField!.inputView as? UIDatePicker { // 2-1
            let dateformatter = DateFormatter() // 2-2
            dateformatter.dateFormat = "HH:mm:ss"
            dateformatter.dateStyle = .medium // 2-3
            myTextField!.text = dateformatter.string(from: datePicker.date) //2-4
        }
        myTextField!.resignFirstResponder()
    }
    
    func UrlLint(title:String, id:String, position:Int, beforetype:String, beposition:Int){
        print("UrlLint" + String(position))
        beforeObject(beforeObject: beforetype, beforeId: beposition)
        elementTitle(etitle: title, id: position)
        
        let urlid = position
        urlElement = "element_" + id
        let title = (self.cellviewC.contentView.viewWithTag(position + 1000) as? UILabel)!
        
        let urlfield =  UITextField()
        urlfield.tag = urlid
        urltag = urlid
        self.cellviewC.contentView.addSubview(urlfield)
        let heightConstraint = urlfield.heightAnchor.constraint(equalToConstant: 35)
        let widthConstraint = urlfield.widthAnchor.constraint(equalToConstant: CGFloat(phoneWidth))
        self.cellviewC.contentView.addConstraints([widthConstraint, heightConstraint])
        urlfield.keyboardType = .numberPad
        urlfield.translatesAutoresizingMaskIntoConstraints = false
        urlfield.text = "https://"
        urlfield.font = UIFont.systemFont(ofSize: 15)
        urlfield.borderStyle = UITextField.BorderStyle.roundedRect
        urlfield.autocorrectionType = UITextAutocorrectionType.no
        urlfield.keyboardType = UIKeyboardType.default
        urlfield.returnKeyType = UIReturnKeyType.done
        urlfield.clearButtonMode = UITextField.ViewMode.whileEditing
        urlfield.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        self.cellviewC.contentView.addConstraint(NSLayoutConstraint(item: urlfield, attribute: .top, relatedBy: .equal, toItem: title, attribute: .bottom, multiplier: 1, constant: 5))
        self.cellviewC.contentView.addConstraint(NSLayoutConstraint(item: urlfield, attribute: .leading, relatedBy: .equal, toItem: self.cellviewC.contentView, attribute: .leading, multiplier: 1, constant: 20))
        
        
    }
    
    func TextareaLint(title:String, id:String, position:Int, beforetype:String, beposition:Int){
        print("TextareaLint" + String(position))
        beforeObject(beforeObject: beforetype, beforeId: beposition)
        elementTitle(etitle: title, id: position)
        
        let areaid = position
        self.areaElement = "element_" + id
        let title = (self.cellviewC.contentView.viewWithTag(position + 1000) as? UILabel)!
        
        let areafield =  UITextView()
        areafield.tag = areaid
        areatag = areaid
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
        self.cellviewC.contentView.addConstraint(NSLayoutConstraint(item: areafield, attribute: .top, relatedBy: .equal, toItem: title, attribute: .bottom, multiplier: 1, constant: 5))
        self.cellviewC.contentView.addConstraint(NSLayoutConstraint(item: areafield, attribute: .leading, relatedBy: .equal, toItem: self.cellviewC.contentView, attribute: .leading, multiplier: 1, constant: 20))
    }
    
    func PagebreakLint(id:String, position:Int, beforetype:String, beposition:Int, pagenumber:Int){
        print("PagebreakLint:" + String(position))
        beforeObject(beforeObject: beforetype, beforeId: beposition)
        let cid = position
       
        let continueBtn = UIButton()
        let beforeBtn = UIButton()
    
        continueBtn.tag = cid
        nextTag = cid
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
        continueBtn.addTarget(self, action: #selector(nextpageBtn), for: .touchUpInside)
        
        beforeBtn.setTitleColor(UIColor.black, for: .normal)
        beforeBtn.tag = cid + 600
        beforetag = cid + 600
        beforeBtn.setTitle("Before", for: .normal)
        beforeBtn.backgroundColor = UIColor.lightGray
        self.cellviewC.contentView.addSubview(beforeBtn)
        beforeBtn.translatesAutoresizingMaskIntoConstraints = false
        let widthbe = beforeBtn.widthAnchor.constraint(equalToConstant: 140)
        let heightbe = beforeBtn.heightAnchor.constraint(equalToConstant: 35)
        self.cellviewC.contentView.addConstraints([widthbe, heightbe])
        self.cellviewC.contentView.addConstraint(NSLayoutConstraint(item: beforeBtn, attribute: .top, relatedBy: .equal, toItem: beforeobject, attribute: .bottom, multiplier: 1, constant: 10))
        self.cellviewC.contentView.addConstraint(NSLayoutConstraint(item: beforeBtn, attribute: .leading, relatedBy: .equal, toItem: continueBtn, attribute: .leading, multiplier: 1, constant: 160))
        beforeBtn.addTarget(self, action: #selector(beforepageBtn), for: .touchUpInside)
        
        if(pagenumber < 1){
            beforeBtn.isHidden = true
        }else{
            beforeBtn.isHidden = false
        }
    }
    
    @objc func nextpageBtn(){
        getElementvalue()
        removeLayElement()
        nowPage += 1
        showElemnet(PageNum: nowPage)
    }
    
    @objc func beforepageBtn(){
        getElementvalue()
        removeLayElement()
        nowPage -= 1
        showElemnet(PageNum: nowPage)
    }
    
    func AddressLint(title:String, id:String, checkline:String, position:Int, beforetype:String, beposition:Int){
        print("AddressLint" + String(position))
        
        beforeObject(beforeObject: beforetype, beforeId: beposition)
        elementTitle(etitle: title, id: position)
        
        let end = position
        let title = (self.cellviewC.contentView.viewWithTag(position + 1000) as? UILabel)!
        let aid1 = position + 4000
        let aid2 = position + 4001
        let aid3 = position + 4002
        let aid4 = position + 4003
        let aid5 = position + 4004
        let aid6 = position + 4005
        
        
        let addressfield =  UITextField()
        addressfield.tag = aid1
        addresstag1 = aid1
        addressEle1 = "element_" + id + "_1"
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
        self.cellviewC.contentView.addConstraint(NSLayoutConstraint(item: addressfield, attribute: .top, relatedBy: .equal, toItem: title, attribute: .bottom, multiplier: 1, constant: 5))
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
        addresstag2 = aid2
        addressEle2 = "element_" + id + "_2"
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
        addresstag3 = aid3
        addressEle3 = "element_" + id + "_3"
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
        addresstag5 = aid5
        addressEle5 = "element_" + id + "_5"
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
        postaltitle.tag = end
        postaltitle.text = "Postal/Zip code"
        self.cellviewC.contentView.addSubview(postaltitle)
        postaltitle.translatesAutoresizingMaskIntoConstraints = false
        postaltitle.numberOfLines = 30
        postaltitle.font = citytitle.font.withSize(17)
        self.cellviewC.contentView.addConstraint(NSLayoutConstraint(item: postaltitle, attribute: .top, relatedBy: .equal, toItem: postalfield, attribute: .bottom, multiplier: 1, constant: 5))
        self.cellviewC.contentView.addConstraint(NSLayoutConstraint(item: postaltitle, attribute: .leading, relatedBy: .equal, toItem: self.cellviewC.contentView, attribute: .leading, multiplier: 1, constant: 20))

        let statefield =  UITextField()
        statefield.tag = aid4
        addresstag4 = aid4
        addressEle4 = "element_" + id + "_4"
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
        addressdropTag = aid6
        addressdrop = "element_" + id + "_6"
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
        dropdown.optionArray = Common.countryArray
        
        dropdown.didSelect{(selectedText , index ,id) in
            self.element_data[self.addressdrop] = selectedText
        }
        
        let droptitle = UILabel()
        droptitle.text = "Country"
        self.cellviewC.contentView.addSubview(droptitle)
        droptitle.translatesAutoresizingMaskIntoConstraints = false
        droptitle.numberOfLines = 30
        droptitle.font = droptitle.font.withSize(17)
        self.cellviewC.contentView.addConstraint(NSLayoutConstraint(item: droptitle, attribute: .top, relatedBy: .equal, toItem: dropdown, attribute: .bottom, multiplier: 1, constant: 5))
        self.cellviewC.contentView.addConstraint(NSLayoutConstraint(item: droptitle, attribute: .leading, relatedBy: .equal, toItem: self.cellviewC.contentView, attribute: .leading, multiplier: 1, constant: CGFloat(phoneWidth/2 + 30)))
    }
    
    func MatrixLint(title:String, id:String, guide:String, position:Int, beforetype:String, contraint:String, beposition:Int){
        print("MatrixLint" + String(position))
        formoption = UserLocal.getSFODatas(formid: formid, elementid: id)
        beforeObject(beforeObject: beforetype, beforeId: beposition)
        
        let areaid = position
    
        if(guide != ""){
            let mtitle = UILabel()
            mtitle.text = guide
            self.cellviewC.contentView.addSubview(mtitle)
            mtitle.translatesAutoresizingMaskIntoConstraints = false
            let width = mtitle.widthAnchor.constraint(equalToConstant: CGFloat(phoneWidth))
            self.cellviewC.contentView.addConstraints([width])
            mtitle.numberOfLines = 30
            mtitle.font = mtitle.font.withSize(17)
            self.cellviewC.contentView.addConstraint(NSLayoutConstraint(item: mtitle, attribute: .top, relatedBy: .equal, toItem: beforeobject, attribute: .bottom, multiplier: 1, constant: 10))
            self.cellviewC.contentView.addConstraint(NSLayoutConstraint(item: mtitle, attribute: .leading, relatedBy: .equal, toItem: self.cellviewC.contentView, attribute: .leading, multiplier: 1, constant: 20))
            
            for j in 0...formoption.count - 1 {
                
                let itemtitle = UILabel()
                itemtitle.text = formoption[j].option
                self.cellviewC.contentView.addSubview(itemtitle)
                itemtitle.translatesAutoresizingMaskIntoConstraints = false
                let width = itemtitle.widthAnchor.constraint(equalToConstant: 55)
                self.cellviewC.contentView.addConstraints([width])
                itemtitle.font = itemtitle.font.withSize(11)
                self.cellviewC.contentView.addConstraint(NSLayoutConstraint(item: itemtitle, attribute: .top, relatedBy: .equal, toItem: mtitle, attribute: .bottom, multiplier: 1, constant: 10))
                self.cellviewC.contentView.addConstraint(NSLayoutConstraint(item: itemtitle, attribute: .leading, relatedBy: .equal, toItem: self.cellviewC.contentView, attribute: .leading, multiplier: 1, constant: CGFloat(160 + j * 55)))
            }
            
            let mainL = UILabel()
             mainL.text = title
             mainL.tag = areaid
             self.cellviewC.contentView.addSubview(mainL)
             mainL.translatesAutoresizingMaskIntoConstraints = false
             let widthm = mainL.widthAnchor.constraint(equalToConstant: 150)
             self.cellviewC.contentView.addConstraints([widthm])
             mainL.font = mainL.font.withSize(15)
             mainL.numberOfLines = 30
             self.cellviewC.contentView.addConstraint(NSLayoutConstraint(item: mainL, attribute: .top, relatedBy: .equal, toItem: mtitle, attribute: .bottom, multiplier: 1, constant: 30))
             self.cellviewC.contentView.addConstraint(NSLayoutConstraint(item: mainL, attribute: .leading, relatedBy: .equal, toItem: self.cellviewC.contentView, attribute: .leading, multiplier: 1, constant: 20))
            
            let radioGroup = RadioGroup()
            radioGroup.tag = position + 3000
//            radiogroupTag.append(position + 3000)
            radioElement[position + 3000] = "element_" + id
            radioGroup.isVertical = false
            radioGroup.spacing = 30
            radioGroup.buttonSize = 15
            radioGroup.tintColor = .gray
            radioGroup.selectedColor = .orange
            for i in 0...formoption.count - 1 {
                radioGroup.titles.append("")
                print(i)
            }
            self.cellviewC.contentView.addSubview(radioGroup)
            radioGroup.translatesAutoresizingMaskIntoConstraints = false
            self.cellviewC.contentView.addConstraint(NSLayoutConstraint(item: radioGroup, attribute: .top, relatedBy: .equal, toItem: mtitle, attribute: .bottom, multiplier: 1, constant: 25))
            self.cellviewC.contentView.addConstraint(NSLayoutConstraint(item: radioGroup, attribute: .leading, relatedBy: .equal, toItem: self.cellviewC.contentView, attribute: .leading, multiplier: 1, constant: 170))
            radioGroup.addTarget(self, action: #selector(didSelectOption(radioGroup:)), for: .valueChanged)

        }else{
            let mainL = UILabel()
             mainL.text = title
             mainL.tag = areaid
             self.cellviewC.contentView.addSubview(mainL)
             mainL.translatesAutoresizingMaskIntoConstraints = false
             let widthm = mainL.widthAnchor.constraint(equalToConstant: 150)
             self.cellviewC.contentView.addConstraints([widthm])
             mainL.font = mainL.font.withSize(15)
             mainL.numberOfLines = 30
             self.cellviewC.contentView.addConstraint(NSLayoutConstraint(item: mainL, attribute: .top, relatedBy: .equal, toItem: beforeobject, attribute: .bottom, multiplier: 1, constant: 12))
             self.cellviewC.contentView.addConstraint(NSLayoutConstraint(item: mainL, attribute: .leading, relatedBy: .equal, toItem: self.cellviewC.contentView, attribute: .leading, multiplier: 1, constant: 20))
             
             let radioGroup = RadioGroup()
             radioGroup.tag = position + 3000
             radioElement[position + 3000] = "element_" + id
             radioGroup.isVertical = false
             radioGroup.spacing = 30
             radioGroup.buttonSize = 15
            radioGroup.tintColor = .gray
            radioGroup.selectedColor = .orange
             for i in 0...formoption.count - 1 {
                radioGroup.titles.append("")
                print(i)
             }
             self.cellviewC.contentView.addSubview(radioGroup)
             radioGroup.translatesAutoresizingMaskIntoConstraints = false
             self.cellviewC.contentView.addConstraint(NSLayoutConstraint(item: radioGroup, attribute: .top, relatedBy: .equal, toItem: beforeobject, attribute: .bottom, multiplier: 1, constant: 5))
             self.cellviewC.contentView.addConstraint(NSLayoutConstraint(item: radioGroup, attribute: .leading, relatedBy: .equal, toItem: self.cellviewC.contentView, attribute: .leading, multiplier: 1, constant: 170))
            radioGroup.addTarget(self, action: #selector(didSelectOption(radioGroup:)), for: .valueChanged)
        }

    }
    
    func SectionLint(title:String, id:String, position:Int, beforetype:String, beposition:Int, des:String){
        print("SectionLint" + String(position))
        beforeObject(beforeObject: beforetype, beforeId: beposition)
        
        let did = position
        sectionTag.append(did)
        
        if(des == ""){
            print("no des")
            let Etitle = UILabel()
            Etitle.attributedText = title.htmlToAttributedString
            Etitle.tag = did
            sectiontitle.append(did)
            self.cellviewC.contentView.addSubview(Etitle)
            Etitle.translatesAutoresizingMaskIntoConstraints = false
            let width = Etitle.widthAnchor.constraint(equalToConstant: CGFloat(phoneWidth))
            self.cellviewC.contentView.addConstraints([width])
            Etitle.numberOfLines = 30
            Etitle.font = Etitle.font.withSize(17)
            self.cellviewC.contentView.addConstraint(NSLayoutConstraint(item: Etitle, attribute: .top, relatedBy: .equal, toItem: beforeobject, attribute: .bottom, multiplier: 1, constant: 10))
            self.cellviewC.contentView.addConstraint(NSLayoutConstraint(item: Etitle, attribute: .leading, relatedBy: .equal, toItem: self.cellviewC.contentView, attribute: .leading, multiplier: 1, constant: 20))
        }else{
            print("be des")
            elementTitle(etitle: title, id: position)
            let title = (self.cellviewC.contentView.viewWithTag(position + 1000) as? UILabel)!

            let elemendes = UILabel()
            elemendes.text = des
            elemendes.attributedText = des.htmlToAttributedString
            elemendes.tag = did
            self.cellviewC.contentView.addSubview(elemendes)
            let width = elemendes.widthAnchor.constraint(equalToConstant: CGFloat(phoneWidth))
            self.cellviewC.contentView.addConstraints([width])
            elemendes.translatesAutoresizingMaskIntoConstraints = false
            elemendes.numberOfLines = 30
            elemendes.font = elemendes.font.withSize(17)
            self.cellviewC.contentView.addConstraint(NSLayoutConstraint(item: elemendes, attribute: .top, relatedBy: .equal, toItem: title, attribute: .bottom, multiplier: 1, constant: 10))
            self.cellviewC.contentView.addConstraint(NSLayoutConstraint(item: elemendes, attribute: .leading, relatedBy: .equal, toItem: self.cellviewC.contentView, attribute: .leading, multiplier: 1, constant: 20))
        }
    }
    
    func beforeObject(beforeObject:String, beforeId:Int){
        if(beforeId == 0){
            beforeobject = mainguideL
        }else{
            switch beforeObject {
                case "maintitle":
                    beforeobject = mainguideL
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
                    beforeobject = (self.cellviewC.contentView.viewWithTag(beforeId) as? Canvas)!
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
                    beforeobject = (self.cellviewC.contentView.viewWithTag(beforeId) as? RadioGroup)!
                case "time":
                    beforeobject = (self.cellviewC.contentView.viewWithTag(beforeId) as? UITextField)!
                case "url":
                    beforeobject = (self.cellviewC.contentView.viewWithTag(beforeId) as? UITextField)!
                case "textarea":
                    beforeobject = (self.cellviewC.contentView.viewWithTag(beforeId) as? UITextView)!
                case "pagebreak":
                    beforeobject = mainguideL
                case "address":
                    beforeobject = (self.cellviewC.contentView.viewWithTag(beforeId) as? UILabel)!
                case "matrix":
                    beforeobject = (self.cellviewC.contentView.viewWithTag(beforeId) as? UILabel)!
                case "section":
                    beforeobject = (self.cellviewC.contentView.viewWithTag(beforeId) as? UILabel)!
                default:
                    beforeobject = mainguideL
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
    
    
    func removeLayElement(){
        if(signatureTag.count != 0){
            for i in 0...signatureTag.count - 1 {
                let signature = self.cellviewC.contentView.viewWithTag(signatureTag[i]) as? Canvas
                let signTitle = self.cellviewC.contentView.viewWithTag(signatureTag[i] + 1000) as? UILabel
                signature?.removeFromSuperview()
                signTitle?.removeFromSuperview()
            }
            for j in 0...signaturebtntag.count - 1 {
                let btn = self.cellviewC.contentView.viewWithTag(signaturebtntag[j]) as? UIButton
                btn?.removeFromSuperview()
            }
            signatruetag.removeAll()
            signaturebtntag.removeAll()
        }
        
        if(beforetag != 0){
            let btn = self.cellviewC.contentView.viewWithTag(beforetag) as? UIButton
            btn?.removeFromSuperview()
            beforetag = 0
        }
        
        if(nextTag != 0){
            let btn = self.cellviewC.contentView.viewWithTag(nextTag) as? UIButton
            btn?.removeFromSuperview()
            nextTag = 0
        }
        
        if(dropdownTag.count != 0){
            for i in 0...dropdownTag.count - 1 {
                let dropdown = self.cellviewC.contentView.viewWithTag(dropdownTag[i]) as? DropDown
                let droptitle = self.cellviewC.contentView.viewWithTag(dropdownTag[i] + 1000) as? UILabel
                dropdown?.removeFromSuperview()
                droptitle?.removeFromSuperview()
            }
            dropdownTag.removeAll()
        }
        
        if(radiogroupTag.count != 0){
            for i in 0...radiogroupTag.count - 1 {
                let radio = self.cellviewC.contentView.viewWithTag(radiogroupTag[i]) as? RadioGroup
                let radiotitle = self.cellviewC.contentView.viewWithTag(radiogroupTag[i] + 1000) as? UILabel
                radio?.removeFromSuperview()
                radiotitle?.removeFromSuperview()
            }
            radiogroupTag.removeAll()
        }
        
        if(mediaTag.count != 0){
            for i in 0...mediaTag.count - 1 {
                let media = self.cellviewC.contentView.viewWithTag(mediaTag[i]) as? UIImageView
                media?.removeFromSuperview()
            }
            mediaTag.removeAll()
        }
        
        if(fileimageTag.count != 0){
            for i in 0...fileimageTag.count - 1 {
                let filetitle = self.cellviewC.contentView.viewWithTag(fileimageTag[i] + 1000) as? UILabel
                let filebtn = self.cellviewC.contentView.viewWithTag(fileimageTag[i] + 5000) as? UIButton
                let fileimage = self.cellviewC.contentView.viewWithTag(fileimageTag[i]) as? UIImageView
                filebtn?.removeFromSuperview()
                filetitle?.removeFromSuperview()
                fileimage?.removeFromSuperview()
            }
            fileimageTag.removeAll()
        }
        
        
        if(sectionTag.count != 0){
            for i in 0...sectionTag.count - 1 {
                let sectiontitle = self.cellviewC.contentView.viewWithTag(sectionTag[i] + 1000) as? UILabel
                let sectiondes = self.cellviewC.contentView.viewWithTag(sectionTag[i]) as? UILabel
                sectiontitle?.removeFromSuperview()
                sectiondes?.removeFromSuperview()
            }
            sectionTag.removeAll()
        }
        
        if(sectiontitle.count != 0){
            for i in 0...sectiontitle.count - 1 {
                let section = self.cellviewC.contentView.viewWithTag(sectiontitle[i]) as? UILabel
                section?.removeFromSuperview()
            }
            sectiontitle.removeAll()
        }
        
        if(checkboxTag.count != 0) {
            for i in 0...checkboxTag.count - 1 {
                let checkbtn = self.cellviewC.contentView.viewWithTag(checkboxTag[i]) as? UIButton
                checkbtn?.removeFromSuperview()
            }
            for j in 0...checktitle.count - 1 {
                let title = self.cellviewC.contentView.viewWithTag(checktitle[j]) as? UILabel
                title?.removeFromSuperview()
            }
            for k in 0...checklabel.count - 1 {
                let label = self.cellviewC.contentView.viewWithTag(checklabel[k]) as? UILabel
                label?.removeFromSuperview()
            }
            checklabel.removeAll()
            checktitle.removeAll()
            checkboxTag.removeAll()
        }
        
    }
    
    func getElementvalue() {
        if(numberTag.count != 0){
            for i in 0...numberTag.count - 1 {
                let numberEdit = self.cellviewC.contentView.viewWithTag(numberTag[i]) as? UITextField
                let title = self.cellviewC.contentView.viewWithTag(numberTag[i] + 1000) as? UILabel
                let number = numberEdit?.text
                element_data[numberElement[numberTag[i]]!] = number
                numberEdit?.removeFromSuperview()
                title?.removeFromSuperview()
            }
            numberTag.removeAll()
        }
        
        if(textTag.count != 0){
            for i in 0...textTag.count - 1 {
                let textEdit = self.cellviewC.contentView.viewWithTag(textTag[i]) as? UITextField
                let title = self.cellviewC.contentView.viewWithTag(textTag[i] + 1000) as? UILabel
                let text = textEdit?.text
                element_data[textElement[textTag[i]]!] = text
                textEdit?.removeFromSuperview()
                title?.removeFromSuperview()
            }
            textTag.removeAll()
            textElement.removeAll()
        }
        
        
        if(dateTag != 0) {
            let datetedit = self.cellviewC.contentView.viewWithTag(dateTag) as? UITextField
            let datetitle = self.cellviewC.contentView.viewWithTag(dateTag + 1000) as? UILabel
            let date = datetedit?.text
            element_data[dateElement] = date
            datetedit?.removeFromSuperview()
            datetitle?.removeFromSuperview()
            dateTag = 0
        }
        
        if(eurodatetag != 0) {
            let datetedit = self.cellviewC.contentView.viewWithTag(eurodatetag) as? UITextField
            let datetitle = self.cellviewC.contentView.viewWithTag(eurodatetag + 1000) as? UILabel
            let date = datetedit?.text
            element_data[eurodateEle] = date
            datetedit?.removeFromSuperview()
            datetitle?.removeFromSuperview()
            eurodatetag = 0
        }
        
        if(emailtag != 0){
            let emailedit = self.cellviewC.contentView.viewWithTag(emailtag) as? UITextField
            let emailtitle = self.cellviewC.contentView.viewWithTag(emailtag + 1000) as? UILabel
            let email = emailedit?.text
            element_data[emailElement] = email
            emailedit?.removeFromSuperview()
            emailtitle?.removeFromSuperview()
            emailtag = 0
        }
        
        if(moneytag1 != 0){
            let doller = self.cellviewC.contentView.viewWithTag(moneytag1) as? UITextField
            let cent = self.cellviewC.contentView.viewWithTag(moneytag2) as? UITextField
            let moneytitle = self.cellviewC.contentView.viewWithTag(moneytag1 + 1000) as? UILabel
            let money = doller!.text! + "." + cent!.text!
            element_data[moneyElement] = money
            doller?.removeFromSuperview()
            cent?.removeFromSuperview()
            moneytitle?.removeFromSuperview()
            moneytag1 = 0
            moneytag2 = 0
        }
        
        if(nametag1.count != 0) {
            for i in 0...nametag1.count - 1 {
                let firstname = self.cellviewC.contentView.viewWithTag(nametag1[i]) as? UITextField
                let lastname = self.cellviewC.contentView.viewWithTag(nametag2[i]) as? UITextField
                let nametitle = self.cellviewC.contentView.viewWithTag(nametag1[i] + 1000) as? UILabel
                let name = firstname!.text! + " " + lastname!.text!
                element_data[nameElement[nametag1[i]]!] = name
                firstname?.removeFromSuperview()
                lastname?.removeFromSuperview()
                nametitle?.removeFromSuperview()
            }
            nametag1.removeAll()
            nametag2.removeAll()
        }
        
        if(phonetag1 != 0){
            let phone1 = self.cellviewC.contentView.viewWithTag(phonetag1) as? UITextField
            let phone2 = self.cellviewC.contentView.viewWithTag(phonetag2) as? UITextField
            let phone3 = self.cellviewC.contentView.viewWithTag(phonetag3) as? UITextField
            let phonetitle = self.cellviewC.contentView.viewWithTag(phonetag1 + 1000) as? UILabel
            let phonenumber = phone1!.text! + phone2!.text! + phone3!.text!
            element_data[phoneElement] = phonenumber
            phonetitle?.removeFromSuperview()
            phone1?.removeFromSuperview()
            phone2?.removeFromSuperview()
            phone2?.removeFromSuperview()
            phonetag1 = 0
            phonetag2 = 0
            phonetag3 = 0
        }
        
        if(timetag != 0) {
            let timeedit = self.cellviewC.contentView.viewWithTag(timetag) as? UITextField
            let timetitle = self.cellviewC.contentView.viewWithTag(timetag + 1000) as? UILabel
            let time = timeedit?.text
            element_data[timeElement] = time
            timeedit?.removeFromSuperview()
            timetitle?.removeFromSuperview()
            timetag = 0
        }
        
        if(urltag != 0) {
            let urledit = self.cellviewC.contentView.viewWithTag(urltag) as? UITextField
            let urltitle = self.cellviewC.contentView.viewWithTag(urltag + 1000) as? UILabel
            let url = urledit?.text
            element_data[urlElement] = url
            urltitle?.removeFromSuperview()
            urledit?.removeFromSuperview()
            urltag = 0
        }
        
        if(areatag != 0){
            let areaedit = self.cellviewC.contentView.viewWithTag(areatag) as? UITextView
            let areatitle = self.cellviewC.contentView.viewWithTag(areatag + 1000) as? UILabel
            let area = areaedit?.text
            element_data[areaElement] = area
            areatitle?.removeFromSuperview()
            areaedit?.removeFromSuperview()
            areatag = 0
        }
        
        if(addresstag1 != 0) {
            let addresseidt1 = self.cellviewC.contentView.viewWithTag(addresstag1) as? UITextField
            let addresseidt2 = self.cellviewC.contentView.viewWithTag(addresstag2) as? UITextField
            let addresseidt3 = self.cellviewC.contentView.viewWithTag(addresstag3) as? UITextField
            let addresseidt4 = self.cellviewC.contentView.viewWithTag(addresstag4) as? UITextField
            let addresseidt5 = self.cellviewC.contentView.viewWithTag(addresstag5) as? UITextField
            let addressdrop = self.cellviewC.contentView.viewWithTag(addressdropTag) as? DropDown
            let addresstitle = self.cellviewC.contentView.viewWithTag(addresstag1 - 1000) as? UILabel
            element_data[addressEle1] = addresseidt1?.text
            element_data[addressEle2] = addresseidt2?.text
            element_data[addressEle3] = addresseidt3?.text
            element_data[addressEle4] = addresseidt4?.text
            element_data[addressEle5] = addresseidt5?.text
            addresseidt1?.removeFromSuperview()
            addresstitle?.removeFromSuperview()
            addresseidt2?.removeFromSuperview()
            addresseidt3?.removeFromSuperview()
            addresseidt4?.removeFromSuperview()
            addresseidt5?.removeFromSuperview()
            addressdrop?.removeFromSuperview()
            addresstag1 = 0
            addresstag2 = 0
            addresstag3 = 0
            addresstag4 = 0
            addresstag5 = 0
            addressdropTag = 0
        }
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
