
import UIKit
import iOSDropDown
import SwiftSignatureView
import CoreData

class FormTableViewCell: UITableViewCell{
    
    @IBOutlet weak var contentCell: UIView!
    @IBOutlet weak var ll: UILabel!
//    var phoneWidth:Int = 0
//    var unchecked = true
//    var radioButtonController: SSRadioButtonsController?
//    var signImage = UIImageView()
//    var signature = Canvas()
//    var formelement:[FormElementData] = []
//    private var groupkey:NSMutableArray!
//    private var grouplist:NSMutableArray!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
//        let screenSize = UIScreen.main.bounds
//        let screenWidth = screenSize.width
//        phoneWidth = Int(screenWidth - 40)
//
//        groupkey = NSMutableArray()
//        grouplist = NSMutableArray()
//
//        numberLint()
//        emailLint()
//        urlLint()
//        textLint()
//        moneyLint()
//        nameLint()
//        phoneLint()
//        sectionLint()
//        dateLint()
//        timeLint()
//        textareaLint()
//        dropdownLint()
//        addressLint()
//        checkboxLint()
//        radiobuttonLint()
//        signatureLint()
//        pagebreakLint()
//        fileLint()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

//    func numberLint(){
//       let tid = 11
//       let numbereid = 12
//       let elementtitle = UILabel()
//       elementtitle.tag = tid
//       elementtitle.text = "NumbertTitle"
//
//       self.contentView.addSubview(elementtitle)
//       elementtitle.translatesAutoresizingMaskIntoConstraints = false
//       elementtitle.numberOfLines = 30
//       elementtitle.font = elementtitle.font.withSize(17)
//       self.contentView.addConstraint(NSLayoutConstraint(item: elementtitle, attribute: .top, relatedBy: .equal, toItem: self.ll, attribute: .bottom, multiplier: 1, constant: 10))
//       self.contentView.addConstraint(NSLayoutConstraint(item: elementtitle, attribute: .leading, relatedBy: .equal, toItem: self.contentView, attribute: .leading, multiplier: 1, constant: 20))
//       self.contentView.addConstraint(NSLayoutConstraint(item: elementtitle, attribute: .trailing, relatedBy: .equal, toItem: self.contentView, attribute: .trailing, multiplier: 1, constant: 20))
//
//        self.textFieldlayout(hint: "Please wirte number", tagId: tid, edittagId: numbereid, type: "number")
//    }
//
//    func radiobuttonLint(){
//        let tid = 13
//        let radio3 = 23
//        self.titlelayout(title: "radioTitle", titleId: tid, beforeId: 12)
//        let theLabel = self.contentView.viewWithTag(tid) as? UILabel
//
//        let button1 = SSRadioButton()
//        button1.tag = 21
//        button1.setTitle("option 1", for: .normal)
//        button1.setTitleColor(UIColor.black, for: .normal)
//        self.contentView.addSubview(button1)
//        button1.translatesAutoresizingMaskIntoConstraints = false
//        let heightConstraint = button1.heightAnchor.constraint(equalToConstant: 30)
//        let widthConstraint = button1.widthAnchor.constraint(equalToConstant: 230)
//        self.contentView.addConstraints([widthConstraint, heightConstraint])
//        self.contentView.addConstraint(NSLayoutConstraint(item: button1, attribute: .top, relatedBy: .equal, toItem: theLabel, attribute: .bottom, multiplier: 1, constant: 10))
//        self.contentView.addConstraint(NSLayoutConstraint(item: button1, attribute: .leading, relatedBy: .equal, toItem: self.contentView, attribute: .leading, multiplier: 1, constant: 20))
//
//        let button2 = SSRadioButton()
//        button2.tag = 22
//        self.contentView.addSubview(button2)
//        button2.translatesAutoresizingMaskIntoConstraints = false
//        let heightConstrain2 = button2.heightAnchor.constraint(equalToConstant: 30)
//        let widthConstrain2 = button2.widthAnchor.constraint(equalToConstant: 30)
//        self.contentView.addConstraints([widthConstrain2, heightConstrain2])
//        self.contentView.addConstraint(NSLayoutConstraint(item: button2, attribute: .top, relatedBy: .equal, toItem: button1, attribute: .bottom, multiplier: 1, constant: 10))
//        self.contentView.addConstraint(NSLayoutConstraint(item: button2, attribute: .leading, relatedBy: .equal, toItem: self.contentView, attribute: .leading, multiplier: 1, constant: 20))
//
//        let button3 = SSRadioButton()
//        button3.tag = radio3
//        self.contentView.addSubview(button3)
//        button3.translatesAutoresizingMaskIntoConstraints = false
//        let heightConstrain3 = button3.heightAnchor.constraint(equalToConstant: 30)
//        let widthConstrain3 = button3.widthAnchor.constraint(equalToConstant: 30)
//        self.contentView.addConstraints([widthConstrain3, heightConstrain3])
//        self.contentView.addConstraint(NSLayoutConstraint(item: button3, attribute: .top, relatedBy: .equal, toItem: button2, attribute: .bottom, multiplier: 1, constant: 10))
//        self.contentView.addConstraint(NSLayoutConstraint(item: button3, attribute: .leading, relatedBy: .equal, toItem: self.contentView, attribute: .leading, multiplier: 1, constant: 20))
//
//        radioButtonController = SSRadioButtonsController(buttons: button1, button2, button3)
//        radioButtonController!.delegate = self
//        radioButtonController!.shouldLetDeSelect = true
//
//    }
//
//    func didSelectButton(selectedButton: UIButton?) {
//        print("  \(String(describing: selectedButton?.tag))")
//    }
//
//    func signatureLint(){
//        let tid = 14
//        let bsid = 15
//        let bdid = 16
//        let beforeE = self.contentView.viewWithTag(23) as? SSRadioButton
//
//        let elementtitle = UILabel()
//        elementtitle.tag = tid
//        elementtitle.text = "signaturetitle"
//
//        self.contentView.addSubview(elementtitle)
//        elementtitle.translatesAutoresizingMaskIntoConstraints = false
//        elementtitle.numberOfLines = 30
//        elementtitle.font = elementtitle.font.withSize(17)
//        self.contentView.addConstraint(NSLayoutConstraint(item: elementtitle, attribute: .top, relatedBy: .equal, toItem: beforeE, attribute: .bottom, multiplier: 1, constant: 10))
//        self.contentView.addConstraint(NSLayoutConstraint(item: elementtitle, attribute: .leading, relatedBy: .equal, toItem: self.contentView, attribute: .leading, multiplier: 1, constant: 20))
//        self.contentView.addConstraint(NSLayoutConstraint(item: elementtitle, attribute: .trailing, relatedBy: .equal, toItem: self.contentView, attribute: .trailing, multiplier: 1, constant: 20))
//
//
////        signature.isUserInteractionEnabled = true
//        signature.setStrokeColor(color: .black)
//        signature.backgroundColor = UIColor.white
//        signature.layer.borderWidth = 1
//        signature.layer.borderColor = UIColor(red: 0.945, green: 0.945, blue: 0.945, alpha: 1.0).cgColor
//        signature.layer.cornerRadius = 10
//        signature.setStrokeWidth(width: 1)
//        self.contentView.addSubview(signature)
//        signature.translatesAutoresizingMaskIntoConstraints = false
//        let widthsign = signature.widthAnchor.constraint(equalToConstant: CGFloat(phoneWidth))
//        let hightsign = signature.heightAnchor.constraint(equalToConstant: 100)
//        self.contentView.addConstraints([widthsign, hightsign])
//        self.contentView.addConstraint(NSLayoutConstraint(item: signature, attribute: .top, relatedBy: .equal, toItem: elementtitle, attribute: .bottom, multiplier: 1, constant: 10))
//        self.contentView.addConstraint(NSLayoutConstraint(item: signature, attribute: .leading, relatedBy: .equal, toItem: self.contentView, attribute: .leading, multiplier: 1, constant: 20))
//
//        let saveBtn = UIButton()
//        saveBtn.tag = bsid
//        saveBtn.backgroundColor = UIColor.lightGray
//        saveBtn.setTitle("SAVE", for: .normal)
//        self.contentView.addSubview(saveBtn)
//        saveBtn.translatesAutoresizingMaskIntoConstraints = false
//        let btnwidth =  saveBtn.widthAnchor.constraint(equalToConstant: 130)
//        let btnheight = saveBtn.heightAnchor.constraint(equalToConstant: 35)
//        self.contentView.addConstraints([btnwidth, btnheight])
//        self.contentView.addConstraint(NSLayoutConstraint(item: saveBtn, attribute: .top, relatedBy: .equal, toItem: signature, attribute: .bottom, multiplier: 1, constant: 10))
//        self.contentView.addConstraint(NSLayoutConstraint(item: saveBtn, attribute: .leading, relatedBy: .equal, toItem: self.contentView, attribute: .leading, multiplier: 1, constant: 20))
//        saveBtn.addTarget(self, action: #selector(saveSignature), for: .touchUpInside)
//
//        let deleteBtn = UIButton()
//        deleteBtn.setTitle("CLEAR", for: .normal)
//        deleteBtn.backgroundColor = UIColor.lightGray
//        deleteBtn.tag = bdid
//        self.contentView.addSubview(deleteBtn)
//        deleteBtn.translatesAutoresizingMaskIntoConstraints = false
//        let btnwidthd =  deleteBtn.widthAnchor.constraint(equalToConstant: 130)
//        let btnheightd = deleteBtn.heightAnchor.constraint(equalToConstant: 35)
//        self.contentView.addConstraints([btnwidthd, btnheightd])
//        self.contentView.addConstraint(NSLayoutConstraint(item: deleteBtn, attribute: .top, relatedBy: .equal, toItem: signature, attribute: .bottom, multiplier: 1, constant: 10))
//        self.contentView.addConstraint(NSLayoutConstraint(item: deleteBtn, attribute: .leading, relatedBy: .equal, toItem: saveBtn, attribute: .leading, multiplier: 1, constant: 140))
//        deleteBtn.addTarget(self, action: #selector(clearSignature), for: .touchUpInside)
//
//    }
//
//    @objc func saveSignature(){
////        signImage.image = savecontact(with: signature)
////        print("fullRender \(signImage.image?.size ?? CGSize.zero)")
//        FormViewController.table.isScrollEnabled = true
//    }
//
//    @objc func clearSignature() {
//        signature.clear()
//        signImage.image = nil
//        FormViewController.table.isScrollEnabled = true
//    }
//
//    func savecontact(with view: UIView) -> UIImage? {
//        UIGraphicsBeginImageContextWithOptions(view.bounds.size, view.isOpaque, 0.0)
//        defer { UIGraphicsEndImageContext() }
//        if let context = UIGraphicsGetCurrentContext() {
//            view.layer.render(in: context)
//            let image = UIGraphicsGetImageFromCurrentImageContext()
//            return image
//        }
//        return nil
//    }
//
//    func pagebreakLint(){
//        let bid = 103
//        let cid = 102
//
//        let beforeE = self.contentView.viewWithTag(15) as? UIButton
//
//        let continueBtn = UIButton()
//        continueBtn.tag = cid
//        continueBtn.setTitle("Continue", for: .normal)
//        continueBtn.setTitleColor(UIColor.black, for: .normal)
//        continueBtn.backgroundColor = UIColor.lightGray
//        self.contentView.addSubview(continueBtn)
//        let widthcon = continueBtn.widthAnchor.constraint(equalToConstant: 140)
//        let heightcon = continueBtn.heightAnchor.constraint(equalToConstant: 35)
//        self.addConstraints([widthcon,heightcon])
//        continueBtn.translatesAutoresizingMaskIntoConstraints = false
//        self.contentView.addConstraint(NSLayoutConstraint(item: continueBtn, attribute: .top, relatedBy: .equal, toItem: beforeE, attribute: .bottom, multiplier: 1, constant: 10))
//        self.contentView.addConstraint(NSLayoutConstraint(item: continueBtn, attribute: .leading, relatedBy: .equal, toItem: self.contentView, attribute: .leading, multiplier: 1, constant: 20))
//
//        let beforeBtn = UIButton()
//        beforeBtn.tag = bid
//        beforeBtn.setTitleColor(UIColor.black, for: .normal)
//        beforeBtn.setTitle("Before", for: .normal)
//        beforeBtn.backgroundColor = UIColor.lightGray
//        self.contentView.addSubview(beforeBtn)
//        beforeBtn.translatesAutoresizingMaskIntoConstraints = false
//        let widthbe = beforeBtn.widthAnchor.constraint(equalToConstant: 140)
//        let heightbe = beforeBtn.heightAnchor.constraint(equalToConstant: 35)
//        self.contentView.addConstraints([widthbe, heightbe])
//        self.contentView.addConstraint(NSLayoutConstraint(item: beforeBtn, attribute: .top, relatedBy: .equal, toItem: beforeE, attribute: .bottom, multiplier: 1, constant: 10))
//        self.contentView.addConstraint(NSLayoutConstraint(item: beforeBtn, attribute: .leading, relatedBy: .equal, toItem: continueBtn, attribute: .leading, multiplier: 1, constant: 160))
//
//    }
//
//    func fileLint(){
//        let tid = 37
//        let did = 38
//        let imageid = 39
//
//        let beforeE = self.contentView.viewWithTag(102) as? UIButton
//
//        let elementtitle = UILabel()
//        elementtitle.tag = tid
//        elementtitle.text = "file title"
//
//        self.contentView.addSubview(elementtitle)
//        elementtitle.translatesAutoresizingMaskIntoConstraints = false
//        elementtitle.numberOfLines = 30
//        elementtitle.font = elementtitle.font.withSize(17)
//        self.contentView.addConstraint(NSLayoutConstraint(item: elementtitle, attribute: .top, relatedBy: .equal, toItem: beforeE, attribute: .bottom, multiplier: 1, constant: 10))
//        self.contentView.addConstraint(NSLayoutConstraint(item: elementtitle, attribute: .leading, relatedBy: .equal, toItem: self.contentView, attribute: .leading, multiplier: 1, constant: 20))
//        self.contentView.addConstraint(NSLayoutConstraint(item: elementtitle, attribute: .trailing, relatedBy: .equal, toItem: self.contentView, attribute: .trailing, multiplier: 1, constant: 20))
//
//
//        let button = UIButton()
//        button.tag = did
//        self.contentView.addSubview(button)
//        button.translatesAutoresizingMaskIntoConstraints = false
//        let heightConstraint = button.heightAnchor.constraint(equalToConstant: 35)
//        let widthConstraint = button.widthAnchor.constraint(equalToConstant: 150)
//        self.contentView.addConstraints([widthConstraint, heightConstraint])
//        button.layer.cornerRadius = 17.5
//        button.backgroundColor = UIColor.gray
//        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
//        button.setTitle("FileUpload", for: .normal)
//        self.contentView.addConstraint(NSLayoutConstraint(item: button, attribute: .top, relatedBy: .equal, toItem: elementtitle, attribute: .bottom, multiplier: 1, constant: 5))
//        self.contentView.addConstraint(NSLayoutConstraint(item: button, attribute: .leading, relatedBy: .equal, toItem: self.contentView, attribute: .leading, multiplier: 1, constant: 20))
//
//        let fileimage = UIImageView()
//        fileimage.isHidden = true
//        fileimage.tag = imageid
//        fileimage.image = UIImage(named: "app_logo")
//        self.contentView.addSubview(fileimage)
//        fileimage.translatesAutoresizingMaskIntoConstraints = false
//        let widthimage = fileimage.widthAnchor.constraint(equalToConstant: 140)
//        let heightimage = fileimage.heightAnchor.constraint(equalToConstant: 160)
//        self.contentView.addConstraints([widthimage, heightimage])
//        self.contentView.addConstraint(NSLayoutConstraint(item: fileimage, attribute: .top, relatedBy: .equal, toItem: button, attribute: .bottom, multiplier: 1, constant: 10))
//        self.contentView.addConstraint(NSLayoutConstraint(item: fileimage, attribute: .leading, relatedBy: .equal, toItem: self.contentView, attribute: .leading, multiplier: 1, constant: 20))
//
//    }
//
//    func emailLint() {
//        let tid = 13
//        let eid = 14
//        self.titlelayout(title: "EmailTitle", titleId: tid, beforeId: 12)
//        self.textFieldlayout(hint: "Please wirte email", tagId: tid, edittagId: eid, type: "text")
//    }
//
//    func urlLint() {
//        let tid = 15
//        let eid = 16
//        self.titlelayout(title: "UrlTitle", titleId: tid, beforeId: 14)
//        self.textFieldlayout(hint: "Please wirte url", tagId: tid, edittagId: eid, type: "text")
//    }
//
//    func textLint() {
//        let tid = 17
//        let eid = 18
//        self.titlelayout(title: "TextTitle", titleId: tid, beforeId: 16)
//        self.textFieldlayout(hint: "Please wirte text", tagId: tid, edittagId: eid, type: "text")
//    }
//
//    func moneyLint() {
//        let tid = 19
//        let did = 20
//        let sid = 21
//        self.titlelayout(title: "UrlTitle", titleId: tid, beforeId: 18)
//
//        let theLabel = self.contentView.viewWithTag(tid) as? UILabel
//
//        let startlable = UILabel()
//        startlable.text = "$"
//        self.contentView.addSubview(startlable)
//        startlable.translatesAutoresizingMaskIntoConstraints = false
//        startlable.font = startlable.font.withSize(17)
//        self.contentView.addConstraint(NSLayoutConstraint(item: startlable, attribute: .top, relatedBy: .equal, toItem: theLabel, attribute: .bottom, multiplier: 1, constant: 10))
//        self.contentView.addConstraint(NSLayoutConstraint(item: startlable, attribute: .leading, relatedBy: .equal, toItem: self.contentView, attribute: .leading, multiplier: 1, constant: 20))
//
//        let dollerField =  UITextField()
//        dollerField.tag = did
//        dollerField.delegate = self
//        self.contentView.addSubview(dollerField)
//        let heightConstraint = dollerField.heightAnchor.constraint(equalToConstant: 35)
//        let widthConstraint = dollerField.widthAnchor.constraint(equalToConstant: 130)
//        self.contentView.addConstraints([widthConstraint, heightConstraint])
//        dollerField.keyboardType = .numberPad
//        dollerField.translatesAutoresizingMaskIntoConstraints = false
//        dollerField.placeholder = "Doller"
//        dollerField.font = UIFont.systemFont(ofSize: 15)
//        dollerField.borderStyle = UITextField.BorderStyle.roundedRect
//        dollerField.autocorrectionType = UITextAutocorrectionType.no
//        dollerField.keyboardType = UIKeyboardType.default
//        dollerField.returnKeyType = UIReturnKeyType.done
//        dollerField.clearButtonMode = UITextField.ViewMode.whileEditing
//        dollerField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
//        self.contentView.addConstraint(NSLayoutConstraint(item: dollerField, attribute: .top, relatedBy: .equal, toItem: theLabel, attribute: .bottom, multiplier: 1, constant: 5))
//        self.contentView.addConstraint(NSLayoutConstraint(item: dollerField, attribute: .leading, relatedBy: .equal, toItem: startlable, attribute: .leading, multiplier: 1, constant: 15))
//
//        let comlable = UILabel()
//        comlable.text = "."
//        self.contentView.addSubview(comlable)
//        comlable.translatesAutoresizingMaskIntoConstraints = false
//        comlable.font = comlable.font.withSize(17)
//        self.contentView.addConstraint(NSLayoutConstraint(item: comlable, attribute: .top, relatedBy: .equal, toItem: theLabel, attribute: .bottom, multiplier: 1, constant: 20))
//        self.contentView.addConstraint(NSLayoutConstraint(item: comlable, attribute: .leading, relatedBy: .equal, toItem: dollerField, attribute: .leading, multiplier: 1, constant: 135))
//
//        let sentfield =  UITextField()
//        sentfield.tag = sid
//        sentfield.delegate = self
//        self.contentView.addSubview(sentfield)
//        let heightConstraintc = sentfield.heightAnchor.constraint(equalToConstant: 35)
//        let widthConstraintc = sentfield.widthAnchor.constraint(equalToConstant: 100)
//        self.contentView.addConstraints([widthConstraintc, heightConstraintc])
//        sentfield.keyboardType = .numberPad
//        sentfield.translatesAutoresizingMaskIntoConstraints = false
//        sentfield.placeholder = "sent"
//        sentfield.font = UIFont.systemFont(ofSize: 15)
//        sentfield.borderStyle = UITextField.BorderStyle.roundedRect
//        sentfield.autocorrectionType = UITextAutocorrectionType.no
//        sentfield.keyboardType = UIKeyboardType.default
//        sentfield.returnKeyType = UIReturnKeyType.done
//        sentfield.clearButtonMode = UITextField.ViewMode.whileEditing
//        sentfield.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
//        self.contentView.addConstraint(NSLayoutConstraint(item: sentfield, attribute: .top, relatedBy: .equal, toItem: theLabel, attribute: .bottom, multiplier: 1, constant: 5))
//        self.contentView.addConstraint(NSLayoutConstraint(item: sentfield, attribute: .leading, relatedBy: .equal, toItem: comlable, attribute: .leading, multiplier: 1, constant: 10))
//    }
//
//    func nameLint() {
//        let tid = 22
//        let fid = 23
//        let lid = 24
//        self.titlelayout(title: "NameTitle", titleId: tid, beforeId: 20)
//        let theLabel = self.contentView.viewWithTag(tid) as? UILabel
//
//        let firstField =  UITextField()
//        firstField.tag = fid
//        self.contentView.addSubview(firstField)
//        let heightConstraint = firstField.heightAnchor.constraint(equalToConstant: 35)
//        let widthConstraint = firstField.widthAnchor.constraint(equalToConstant: 130)
//        self.contentView.addConstraints([widthConstraint, heightConstraint])
//        firstField.keyboardType = .numberPad
//        firstField.translatesAutoresizingMaskIntoConstraints = false
//        firstField.placeholder = "First Name"
//        firstField.font = UIFont.systemFont(ofSize: 15)
//        firstField.borderStyle = UITextField.BorderStyle.roundedRect
//        firstField.autocorrectionType = UITextAutocorrectionType.no
//        firstField.keyboardType = UIKeyboardType.default
//        firstField.returnKeyType = UIReturnKeyType.done
//        firstField.clearButtonMode = UITextField.ViewMode.whileEditing
//        firstField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
//        self.contentView.addConstraint(NSLayoutConstraint(item: firstField, attribute: .top, relatedBy: .equal, toItem: theLabel, attribute: .bottom, multiplier: 1, constant: 5))
//        self.contentView.addConstraint(NSLayoutConstraint(item: firstField, attribute: .leading, relatedBy: .equal, toItem: self.contentView, attribute: .leading, multiplier: 1, constant: 20))
//
//        let lastfield =  UITextField()
//        lastfield.tag = lid
//        self.contentView.addSubview(lastfield)
//        let heightConstraintc = lastfield.heightAnchor.constraint(equalToConstant: 35)
//        let widthConstraintc = lastfield.widthAnchor.constraint(equalToConstant: 150)
//        self.contentView.addConstraints([widthConstraintc, heightConstraintc])
//        lastfield.keyboardType = .numberPad
//        lastfield.translatesAutoresizingMaskIntoConstraints = false
//        lastfield.placeholder = "Last Name"
//        lastfield.font = UIFont.systemFont(ofSize: 15)
//        lastfield.borderStyle = UITextField.BorderStyle.roundedRect
//        lastfield.autocorrectionType = UITextAutocorrectionType.no
//        lastfield.keyboardType = UIKeyboardType.default
//        lastfield.returnKeyType = UIReturnKeyType.done
//        lastfield.clearButtonMode = UITextField.ViewMode.whileEditing
//        lastfield.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
//        self.contentView.addConstraint(NSLayoutConstraint(item: lastfield, attribute: .top, relatedBy: .equal, toItem: theLabel, attribute: .bottom, multiplier: 1, constant: 5))
//        self.contentView.addConstraint(NSLayoutConstraint(item: lastfield, attribute: .leading, relatedBy: .equal, toItem: firstField, attribute: .leading, multiplier: 1, constant: 140))
//    }
//
//    func phoneLint(){
//        let tid = 25
//        let pid1 = 26
//        let pid2 = 27
//        let pid3 = 28
//
//        self.titlelayout(title: "phoneTitle", titleId: tid, beforeId: 23)
//        let theLabel = self.contentView.viewWithTag(tid) as? UILabel
//
//        let firstField =  UITextField()
//        firstField.tag = pid1
//        firstField.delegate = self
//        self.contentView.addSubview(firstField)
//        let heightConstraint = firstField.heightAnchor.constraint(equalToConstant: 35)
//        let widthConstraint = firstField.widthAnchor.constraint(equalToConstant: 76)
//        self.contentView.addConstraints([widthConstraint, heightConstraint])
//        firstField.keyboardType = .numberPad
//        firstField.translatesAutoresizingMaskIntoConstraints = false
//        firstField.placeholder = "###"
//        firstField.font = UIFont.systemFont(ofSize: 15)
//        firstField.borderStyle = UITextField.BorderStyle.roundedRect
//        firstField.autocorrectionType = UITextAutocorrectionType.no
//        firstField.keyboardType = UIKeyboardType.default
//        firstField.returnKeyType = UIReturnKeyType.done
//        firstField.clearButtonMode = UITextField.ViewMode.whileEditing
//        firstField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
//        self.contentView.addConstraint(NSLayoutConstraint(item: firstField, attribute: .top, relatedBy: .equal, toItem: theLabel, attribute: .bottom, multiplier: 1, constant: 5))
//        self.contentView.addConstraint(NSLayoutConstraint(item: firstField, attribute: .leading, relatedBy: .equal, toItem: self.contentView, attribute: .leading, multiplier: 1, constant: 20))
//
//        let comlable = UILabel()
//        comlable.text = "-"
//        self.contentView.addSubview(comlable)
//        comlable.translatesAutoresizingMaskIntoConstraints = false
//        comlable.font = comlable.font.withSize(17)
//        self.contentView.addConstraint(NSLayoutConstraint(item: comlable, attribute: .top, relatedBy: .equal, toItem: theLabel, attribute: .bottom, multiplier: 1, constant: 10))
//        self.contentView.addConstraint(NSLayoutConstraint(item: comlable, attribute: .leading, relatedBy: .equal, toItem: firstField, attribute: .leading, multiplier: 1, constant: 81))
//
//        let secontField =  UITextField()
//        secontField.tag = pid2
//        secontField.delegate = self
//        self.contentView.addSubview(secontField)
//        let heightConstraints = secontField.heightAnchor.constraint(equalToConstant: 35)
//        let widthConstraints = secontField.widthAnchor.constraint(equalToConstant: 76)
//        self.contentView.addConstraints([widthConstraints, heightConstraints])
//        secontField.keyboardType = .numberPad
//        secontField.translatesAutoresizingMaskIntoConstraints = false
//        secontField.placeholder = "###"
//        secontField.font = UIFont.systemFont(ofSize: 15)
//        secontField.borderStyle = UITextField.BorderStyle.roundedRect
//        secontField.autocorrectionType = UITextAutocorrectionType.no
//        secontField.keyboardType = UIKeyboardType.default
//        secontField.returnKeyType = UIReturnKeyType.done
//        secontField.clearButtonMode = UITextField.ViewMode.whileEditing
//        secontField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
//        self.contentView.addConstraint(NSLayoutConstraint(item: secontField, attribute: .top, relatedBy: .equal, toItem: theLabel, attribute: .bottom, multiplier: 1, constant: 5))
//        self.contentView.addConstraint(NSLayoutConstraint(item: secontField, attribute: .leading, relatedBy: .equal, toItem: comlable, attribute: .leading, multiplier: 1, constant: 15))
//
//        let comlables = UILabel()
//        comlables.text = "-"
//        self.contentView.addSubview(comlables)
//        comlables.translatesAutoresizingMaskIntoConstraints = false
//        comlables.font = comlables.font.withSize(17)
//        self.contentView.addConstraint(NSLayoutConstraint(item: comlables, attribute: .top, relatedBy: .equal, toItem: theLabel, attribute: .bottom, multiplier: 1, constant: 10))
//        self.contentView.addConstraint(NSLayoutConstraint(item: comlables, attribute: .leading, relatedBy: .equal, toItem: secontField, attribute: .leading, multiplier: 1, constant: 81))
//
//        let thirdField =  UITextField()
//        thirdField.tag = pid3
//        thirdField.delegate = self
//        self.contentView.addSubview(thirdField)
//        let heightConstraintt = thirdField.heightAnchor.constraint(equalToConstant: 35)
//        let widthConstraintt = thirdField.widthAnchor.constraint(equalToConstant: 87)
//        self.contentView.addConstraints([widthConstraintt, heightConstraintt])
//        thirdField.keyboardType = .numberPad
//        thirdField.translatesAutoresizingMaskIntoConstraints = false
//        thirdField.placeholder = "####"
//        thirdField.font = UIFont.systemFont(ofSize: 15)
//        thirdField.borderStyle = UITextField.BorderStyle.roundedRect
//        thirdField.autocorrectionType = UITextAutocorrectionType.no
//        thirdField.keyboardType = UIKeyboardType.default
//        thirdField.returnKeyType = UIReturnKeyType.done
//        thirdField.clearButtonMode = UITextField.ViewMode.whileEditing
//        thirdField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
//        self.contentView.addConstraint(NSLayoutConstraint(item: thirdField, attribute: .top, relatedBy: .equal, toItem: theLabel, attribute: .bottom, multiplier: 1, constant: 5))
//        self.contentView.addConstraint(NSLayoutConstraint(item: thirdField, attribute: .leading, relatedBy: .equal, toItem: comlables, attribute: .leading, multiplier: 1, constant: 15))
//    }
//
//    func sectionLint(){
//        let tid = 29
//        let did = 30
//        titlelayout(title: "sectiontile", titleId: tid, beforeId: 26)
//
//        let beforeE = self.contentView.viewWithTag(tid) as? UILabel
//
//        let elemendes = UILabel()
//        elemendes.tag = did
//        elemendes.text = "title descrtption"
//
//        self.contentView.addSubview(elemendes)
//        elemendes.translatesAutoresizingMaskIntoConstraints = false
//        elemendes.numberOfLines = 30
//        elemendes.font = elemendes.font.withSize(17)
//        self.contentView.addConstraint(NSLayoutConstraint(item: elemendes, attribute: .top, relatedBy: .equal, toItem: beforeE, attribute: .bottom, multiplier: 1, constant: 10))
//        self.contentView.addConstraint(NSLayoutConstraint(item: elemendes, attribute: .leading, relatedBy: .equal, toItem: self.contentView, attribute: .leading, multiplier: 1, constant: 20))
//        self.contentView.addConstraint(NSLayoutConstraint(item: elemendes, attribute: .trailing, relatedBy: .equal, toItem: self.contentView, attribute: .trailing, multiplier: 1, constant: 20))
//    }
//
//    func dateLint(){
//        let tid = 31
//        let did = 32
//
//        let beforeE = self.contentView.viewWithTag(30) as? UILabel
//
//        let elementtitle = UILabel()
//        elementtitle.tag = tid
//        elementtitle.text = "datetitle"
//
//        self.contentView.addSubview(elementtitle)
//        elementtitle.translatesAutoresizingMaskIntoConstraints = false
//        elementtitle.numberOfLines = 30
//        elementtitle.font = elementtitle.font.withSize(17)
//        self.contentView.addConstraint(NSLayoutConstraint(item: elementtitle, attribute: .top, relatedBy: .equal, toItem: beforeE, attribute: .bottom, multiplier: 1, constant: 10))
//        self.contentView.addConstraint(NSLayoutConstraint(item: elementtitle, attribute: .leading, relatedBy: .equal, toItem: self.contentView, attribute: .leading, multiplier: 1, constant: 20))
//        self.contentView.addConstraint(NSLayoutConstraint(item: elementtitle, attribute: .trailing, relatedBy: .equal, toItem: self.contentView, attribute: .trailing, multiplier: 1, constant: 20))
//
//        let date = Date()
//        let formatter = DateFormatter()
//        formatter.dateFormat = "dd.MMM.yyyy"
//        let result = formatter.string(from: date)
//
//
//        let theLabel = self.contentView.viewWithTag(tid) as? UILabel
//
//        let datefield =  UITextField()
//        datefield.tag = did
//        self.contentView.addSubview(datefield)
//        let heightConstraint = datefield.heightAnchor.constraint(equalToConstant: 35)
//        let widthConstraint = datefield.widthAnchor.constraint(equalToConstant: CGFloat(phoneWidth))
//        self.contentView.addConstraints([widthConstraint, heightConstraint])
//        datefield.keyboardType = .numberPad
//        datefield.translatesAutoresizingMaskIntoConstraints = false
//        datefield.text = result
//        datefield.font = UIFont.systemFont(ofSize: 15)
//        datefield.borderStyle = UITextField.BorderStyle.roundedRect
//        datefield.autocorrectionType = UITextAutocorrectionType.no
//        datefield.keyboardType = UIKeyboardType.default
//        datefield.returnKeyType = UIReturnKeyType.done
//        datefield.clearButtonMode = UITextField.ViewMode.whileEditing
//        datefield.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
//        self.contentView.addConstraint(NSLayoutConstraint(item: datefield, attribute: .top, relatedBy: .equal, toItem: theLabel, attribute: .bottom, multiplier: 1, constant: 5))
//        self.contentView.addConstraint(NSLayoutConstraint(item: datefield, attribute: .leading, relatedBy: .equal, toItem: self.contentView, attribute: .leading, multiplier: 1, constant: 20))
//
//        datefield.setInputViewDatePicker(target: self, selector: #selector(tapDone))
//    }
//
//    @objc func tapDone() {
//        let myTextField = self.contentView.viewWithTag(32) as? UITextField
//
//        if let datePicker = myTextField!.inputView as? UIDatePicker { // 2-1
//            let dateformatter = DateFormatter() // 2-2
//            dateformatter.dateStyle = .medium // 2-3
//            myTextField!.text = dateformatter.string(from: datePicker.date) //2-4
//        }
//        myTextField!.resignFirstResponder() // 2-5
//    }
//
//    func timeLint(){
//        let tid = 33
//        let did = 34
//        titlelayout(title: "sectiontile", titleId: tid, beforeId: 32)
//        let theLabel = self.contentView.viewWithTag(tid) as? UILabel
//
//        let date = Date()
//        let formatter = DateFormatter()
//        formatter.dateFormat = "HH:mm:ss"
//        let result = formatter.string(from: date)
//
//        let datefield =  UITextField()
//        datefield.tag = did
//        datefield.delegate = self
//        self.contentView.addSubview(datefield)
//        let heightConstraint = datefield.heightAnchor.constraint(equalToConstant: 35)
//        let widthConstraint = datefield.widthAnchor.constraint(equalToConstant: CGFloat(phoneWidth))
//        self.contentView.addConstraints([widthConstraint, heightConstraint])
//        datefield.keyboardType = .numberPad
//        datefield.translatesAutoresizingMaskIntoConstraints = false
//        datefield.text = result
//        datefield.font = UIFont.systemFont(ofSize: 15)
//        datefield.borderStyle = UITextField.BorderStyle.roundedRect
//        datefield.autocorrectionType = UITextAutocorrectionType.no
//        datefield.keyboardType = UIKeyboardType.default
//        datefield.returnKeyType = UIReturnKeyType.done
//        datefield.clearButtonMode = UITextField.ViewMode.whileEditing
//        datefield.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
//        self.contentView.addConstraint(NSLayoutConstraint(item: datefield, attribute: .top, relatedBy: .equal, toItem: theLabel, attribute: .bottom, multiplier: 1, constant: 5))
//        self.contentView.addConstraint(NSLayoutConstraint(item: datefield, attribute: .leading, relatedBy: .equal, toItem: self.contentView, attribute: .leading, multiplier: 1, constant: 20))
//
//        datefield.setInputViewTimePicker(target: self, selector: #selector(tapDone))
//    }
//
//    func textareaLint(){
//        let tid = 35
//        let did = 36
//        titlelayout(title: "textaretitle", titleId: tid, beforeId: 34)
//        let theLabel = self.contentView.viewWithTag(tid) as? UILabel
//
//
//        let areafield =  UITextView()
//        areafield.tag = did
//        self.contentView.addSubview(areafield)
//        let heightConstraint = areafield.heightAnchor.constraint(equalToConstant: 105)
//        let widthConstraint = areafield.widthAnchor.constraint(equalToConstant: CGFloat(phoneWidth))
//        self.contentView.addConstraints([widthConstraint, heightConstraint])
//        areafield.keyboardType = .numberPad
//        areafield.isEditable = true
//        areafield.layer.borderWidth = 1
//        areafield.layer.borderColor = UIColor(red: 0.945, green: 0.945, blue: 0.945, alpha: 1.0).cgColor
//        areafield.layer.cornerRadius = 5
//        areafield.translatesAutoresizingMaskIntoConstraints = false
//        areafield.font = UIFont.systemFont(ofSize: 15)
//        areafield.autocorrectionType = UITextAutocorrectionType.no
//        areafield.keyboardType = UIKeyboardType.default
//        areafield.returnKeyType = UIReturnKeyType.done
//        self.contentView.addConstraint(NSLayoutConstraint(item: areafield, attribute: .top, relatedBy: .equal, toItem: theLabel, attribute: .bottom, multiplier: 1, constant: 5))
//        self.contentView.addConstraint(NSLayoutConstraint(item: areafield, attribute: .leading, relatedBy: .equal, toItem: self.contentView, attribute: .leading, multiplier: 1, constant: 20))
//    }
//
//
//    func dropdownLint(){
//        let tid = 39
//        let did = 40
//
//        let beforeE = self.contentView.viewWithTag(38) as? UIButton
//
//        let elementtitle = UILabel()
//        elementtitle.tag = tid
//        elementtitle.text = "Dropdown title"
//
//        self.contentView.addSubview(elementtitle)
//        elementtitle.translatesAutoresizingMaskIntoConstraints = false
//        elementtitle.numberOfLines = 30
//        elementtitle.font = elementtitle.font.withSize(17)
//        self.contentView.addConstraint(NSLayoutConstraint(item: elementtitle, attribute: .top, relatedBy: .equal, toItem: beforeE, attribute: .bottom, multiplier: 1, constant: 10))
//        self.contentView.addConstraint(NSLayoutConstraint(item: elementtitle, attribute: .leading, relatedBy: .equal, toItem: self.contentView, attribute: .leading, multiplier: 1, constant: 20))
//        self.contentView.addConstraint(NSLayoutConstraint(item: elementtitle, attribute: .trailing, relatedBy: .equal, toItem: self.contentView, attribute: .trailing, multiplier: 1, constant: 20))
//
//        let dropdown = DropDown()
//        dropdown.tag = did
//        self.contentView.addSubview(dropdown)
//        dropdown.translatesAutoresizingMaskIntoConstraints = false
//        let heightConstraint = dropdown.heightAnchor.constraint(equalToConstant: 35)
//        let widthConstraint = dropdown.widthAnchor.constraint(equalToConstant: CGFloat(phoneWidth))
//        dropdown.layer.borderWidth = 1
//        dropdown.layer.cornerRadius = 5
//        dropdown.arrowSize = 0
//        dropdown.selectedRowColor = UIColor.lightGray
//        dropdown.layer.borderColor = UIColor(red: 0.945, green: 0.945, blue: 0.945, alpha: 1.0).cgColor
//        self.contentView.addConstraints([widthConstraint, heightConstraint])
//        self.contentView.addConstraint(NSLayoutConstraint(item: dropdown, attribute: .top, relatedBy: .equal, toItem: elementtitle, attribute: .bottom, multiplier: 1, constant: 5))
//        self.contentView.addConstraint(NSLayoutConstraint(item: dropdown, attribute: .leading, relatedBy: .equal, toItem: self.contentView, attribute: .leading, multiplier: 1, constant: 20))
//        dropdown.optionArray = ["Option 1", "Option 2", "Option 3"]
//        dropdown.optionIds = [1,23,54,22]
//        dropdown.didSelect{(selectedText , index ,id) in
////        dropdown.text = "Selected String: \(selectedText) \n index: \(index)"
//            }
//    }
//
//    func addressLint(){
//        let tid = 41
//        let eid = 48
//        let aid1 = 42
//        let aid2 = 43
//        let aid3 = 44
//        let aid4 = 45
//        let aid5 = 46
//        let aid6 = 47
//
//        let beforeE = self.contentView.viewWithTag(40) as? DropDown
//
//        let elementtitle = UILabel()
//        elementtitle.tag = tid
//        elementtitle.text = "Address title"
//
//        self.contentView.addSubview(elementtitle)
//        elementtitle.translatesAutoresizingMaskIntoConstraints = false
//        elementtitle.numberOfLines = 30
//        elementtitle.font = elementtitle.font.withSize(17)
//        self.contentView.addConstraint(NSLayoutConstraint(item: elementtitle, attribute: .top, relatedBy: .equal, toItem: beforeE, attribute: .bottom, multiplier: 1, constant: 10))
//        self.contentView.addConstraint(NSLayoutConstraint(item: elementtitle, attribute: .leading, relatedBy: .equal, toItem: self.contentView, attribute: .leading, multiplier: 1, constant: 20))
//        self.contentView.addConstraint(NSLayoutConstraint(item: elementtitle, attribute: .trailing, relatedBy: .equal, toItem: self.contentView, attribute: .trailing, multiplier: 1, constant: 20))
//
//        let addressfield =  UITextField()
//        addressfield.tag = aid1
//        self.contentView.addSubview(addressfield)
//        let heightConstraint = addressfield.heightAnchor.constraint(equalToConstant: 35)
//        let widthConstraint = addressfield.widthAnchor.constraint(equalToConstant: CGFloat(phoneWidth))
//        self.contentView.addConstraints([widthConstraint, heightConstraint])
//        addressfield.keyboardType = .numberPad
//        addressfield.translatesAutoresizingMaskIntoConstraints = false
//        addressfield.font = UIFont.systemFont(ofSize: 15)
//        addressfield.placeholder = "street address"
//        addressfield.borderStyle = UITextField.BorderStyle.roundedRect
//        addressfield.autocorrectionType = UITextAutocorrectionType.no
//        addressfield.keyboardType = UIKeyboardType.default
//        addressfield.returnKeyType = UIReturnKeyType.done
//        addressfield.clearButtonMode = UITextField.ViewMode.whileEditing
//        addressfield.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
//        self.contentView.addConstraint(NSLayoutConstraint(item: addressfield, attribute: .top, relatedBy: .equal, toItem: elementtitle, attribute: .bottom, multiplier: 1, constant: 5))
//        self.contentView.addConstraint(NSLayoutConstraint(item: addressfield, attribute: .leading, relatedBy: .equal, toItem: self.contentView, attribute: .leading, multiplier: 1, constant: 20))
//
//        let streettitle = UILabel()
//        streettitle.text = "Street Address"
//
//        self.contentView.addSubview(streettitle)
//        streettitle.translatesAutoresizingMaskIntoConstraints = false
//        streettitle.numberOfLines = 30
//        streettitle.font = streettitle.font.withSize(17)
//        self.contentView.addConstraint(NSLayoutConstraint(item: streettitle, attribute: .top, relatedBy: .equal, toItem: addressfield, attribute: .bottom, multiplier: 1, constant: 5))
//        self.contentView.addConstraint(NSLayoutConstraint(item: streettitle, attribute: .leading, relatedBy: .equal, toItem: self.contentView, attribute: .leading, multiplier: 1, constant: 20))
//        self.contentView.addConstraint(NSLayoutConstraint(item: streettitle, attribute: .trailing, relatedBy: .equal, toItem: self.contentView, attribute: .trailing, multiplier: 1, constant: 20))
//
//        let streetfield =  UITextField()
//        streetfield.tag = aid2
//        self.contentView.addSubview(streetfield)
//        let heightConstrains = streetfield.heightAnchor.constraint(equalToConstant: 35)
//        let widthConstrains = streetfield.widthAnchor.constraint(equalToConstant: CGFloat(phoneWidth))
//        self.contentView.addConstraints([widthConstrains, heightConstrains])
//        streetfield.translatesAutoresizingMaskIntoConstraints = false
//        streetfield.font = UIFont.systemFont(ofSize: 15)
//        streetfield.placeholder = "address line2"
//        streetfield.borderStyle = UITextField.BorderStyle.roundedRect
//        streetfield.autocorrectionType = UITextAutocorrectionType.no
//        streetfield.keyboardType = UIKeyboardType.default
//        streetfield.returnKeyType = UIReturnKeyType.done
//        streetfield.clearButtonMode = UITextField.ViewMode.whileEditing
//        streetfield.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
//        self.contentView.addConstraint(NSLayoutConstraint(item: streetfield, attribute: .top, relatedBy: .equal, toItem: streettitle, attribute: .bottom, multiplier: 1, constant: 5))
//        self.contentView.addConstraint(NSLayoutConstraint(item: streetfield, attribute: .leading, relatedBy: .equal, toItem: self.contentView, attribute: .leading, multiplier: 1, constant: 20))
//
//        let linetitle = UILabel()
//        linetitle.text = "Address Line2"
//
//        self.contentView.addSubview(linetitle)
//        linetitle.translatesAutoresizingMaskIntoConstraints = false
//        linetitle.numberOfLines = 30
//        linetitle.font = streettitle.font.withSize(17)
//        self.contentView.addConstraint(NSLayoutConstraint(item: linetitle, attribute: .top, relatedBy: .equal, toItem: streetfield, attribute: .bottom, multiplier: 1, constant: 5))
//        self.contentView.addConstraint(NSLayoutConstraint(item: linetitle, attribute: .leading, relatedBy: .equal, toItem: self.contentView, attribute: .leading, multiplier: 1, constant: 20))
//        self.contentView.addConstraint(NSLayoutConstraint(item: linetitle, attribute: .trailing, relatedBy: .equal, toItem: self.contentView, attribute: .trailing, multiplier: 1, constant: 20))
////
//        let cityfield =  UITextField()
//        cityfield.tag = aid3
//        self.contentView.addSubview(cityfield)
//        let heightConstrainc = cityfield.heightAnchor.constraint(equalToConstant: 35)
//        let widthConstrainc = cityfield.widthAnchor.constraint(equalToConstant: CGFloat(phoneWidth/2 - 10))
//        self.contentView.addConstraints([widthConstrainc, heightConstrainc])
//        cityfield.translatesAutoresizingMaskIntoConstraints = false
//        cityfield.font = UIFont.systemFont(ofSize: 15)
//        cityfield.placeholder = "city"
//        cityfield.borderStyle = UITextField.BorderStyle.roundedRect
//        cityfield.autocorrectionType = UITextAutocorrectionType.no
//        cityfield.keyboardType = UIKeyboardType.default
//        cityfield.returnKeyType = UIReturnKeyType.done
//        cityfield.clearButtonMode = UITextField.ViewMode.whileEditing
//        cityfield.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
//        self.contentView.addConstraint(NSLayoutConstraint(item: cityfield, attribute: .top, relatedBy: .equal, toItem: linetitle, attribute: .bottom, multiplier: 1, constant: 5))
//        self.contentView.addConstraint(NSLayoutConstraint(item: cityfield, attribute: .leading, relatedBy: .equal, toItem: self.contentView, attribute: .leading, multiplier: 1, constant: 20))
//
//        let citytitle = UILabel()
//        citytitle.text = "City"
//        self.contentView.addSubview(citytitle)
//        citytitle.translatesAutoresizingMaskIntoConstraints = false
//        citytitle.numberOfLines = 30
//        citytitle.font = citytitle.font.withSize(17)
//        self.contentView.addConstraint(NSLayoutConstraint(item: citytitle, attribute: .top, relatedBy: .equal, toItem: cityfield, attribute: .bottom, multiplier: 1, constant: 5))
//        self.contentView.addConstraint(NSLayoutConstraint(item: citytitle, attribute: .leading, relatedBy: .equal, toItem: self.contentView, attribute: .leading, multiplier: 1, constant: 20))
//
//        let postalfield =  UITextField()
//        postalfield.tag = aid5
//        self.contentView.addSubview(postalfield)
//        let heightConstrainp = postalfield.heightAnchor.constraint(equalToConstant: 35)
//        let widthConstrainp = postalfield.widthAnchor.constraint(equalToConstant: CGFloat(phoneWidth/2 - 10))
//        self.contentView.addConstraints([widthConstrainp, heightConstrainp])
//        postalfield.translatesAutoresizingMaskIntoConstraints = false
//        postalfield.font = UIFont.systemFont(ofSize: 15)
//        postalfield.placeholder = "Postal/Zip code"
//        postalfield.borderStyle = UITextField.BorderStyle.roundedRect
//        postalfield.autocorrectionType = UITextAutocorrectionType.no
//        postalfield.keyboardType = UIKeyboardType.default
//        postalfield.returnKeyType = UIReturnKeyType.done
//        postalfield.clearButtonMode = UITextField.ViewMode.whileEditing
//        postalfield.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
//        self.contentView.addConstraint(NSLayoutConstraint(item: postalfield, attribute: .top, relatedBy: .equal, toItem: citytitle, attribute: .bottom, multiplier: 1, constant: 5))
//        self.contentView.addConstraint(NSLayoutConstraint(item: postalfield, attribute: .leading, relatedBy: .equal, toItem: self.contentView, attribute: .leading, multiplier: 1, constant: 20))
//
//        let postaltitle = UILabel()
//        postaltitle.tag = eid
//        postaltitle.text = "Postal/Zip code"
//        self.contentView.addSubview(postaltitle)
//        postaltitle.translatesAutoresizingMaskIntoConstraints = false
//        postaltitle.numberOfLines = 30
//        postaltitle.font = citytitle.font.withSize(17)
//        self.contentView.addConstraint(NSLayoutConstraint(item: postaltitle, attribute: .top, relatedBy: .equal, toItem: postalfield, attribute: .bottom, multiplier: 1, constant: 5))
//        self.contentView.addConstraint(NSLayoutConstraint(item: postaltitle, attribute: .leading, relatedBy: .equal, toItem: self.contentView, attribute: .leading, multiplier: 1, constant: 20))
//
//        let statefield =  UITextField()
//        statefield.tag = aid4
//        self.contentView.addSubview(statefield)
//        let heightConstraine = statefield.heightAnchor.constraint(equalToConstant: 35)
//        let widthConstraine = statefield.widthAnchor.constraint(equalToConstant: CGFloat(phoneWidth/2 - 10))
//        self.contentView.addConstraints([widthConstraine, heightConstraine])
//        statefield.translatesAutoresizingMaskIntoConstraints = false
//        statefield.font = UIFont.systemFont(ofSize: 15)
//        statefield.placeholder = "State/province"
//        statefield.borderStyle = UITextField.BorderStyle.roundedRect
//        statefield.autocorrectionType = UITextAutocorrectionType.no
//        statefield.keyboardType = UIKeyboardType.default
//        statefield.returnKeyType = UIReturnKeyType.done
//        statefield.clearButtonMode = UITextField.ViewMode.whileEditing
//        statefield.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
//        self.contentView.addConstraint(NSLayoutConstraint(item: statefield, attribute: .top, relatedBy: .equal, toItem: linetitle, attribute: .bottom, multiplier: 1, constant: 5))
//        self.contentView.addConstraint(NSLayoutConstraint(item: statefield, attribute: .leading, relatedBy: .equal, toItem: cityfield, attribute: .leading, multiplier: 1, constant: CGFloat(phoneWidth/2 + 10)))
//
//        let statetitle = UILabel()
//        statetitle.text = "State/Province/Region"
//        self.contentView.addSubview(statetitle)
//        statetitle.translatesAutoresizingMaskIntoConstraints = false
//        statetitle.numberOfLines = 30
//        statetitle.font = statetitle.font.withSize(17)
//        self.contentView.addConstraint(NSLayoutConstraint(item: statetitle, attribute: .top, relatedBy: .equal, toItem: statefield, attribute: .bottom, multiplier: 1, constant: 5))
//        self.contentView.addConstraint(NSLayoutConstraint(item: statetitle, attribute: .leading, relatedBy: .equal, toItem: self.contentView, attribute: .leading, multiplier: 1, constant: CGFloat(phoneWidth/2 + 30)))
//
//        let dropdown = DropDown()
//        dropdown.tag = aid6
//        self.contentView.addSubview(dropdown)
//        dropdown.translatesAutoresizingMaskIntoConstraints = false
//        let heightConstraind = dropdown.heightAnchor.constraint(equalToConstant: 35)
//        let widthConstraind = dropdown.widthAnchor.constraint(equalToConstant: CGFloat(phoneWidth/2 - 10))
//        dropdown.layer.borderWidth = 1
//        dropdown.layer.cornerRadius = 5
//        dropdown.arrowSize = 0
//        dropdown.selectedRowColor = UIColor.lightGray
//        dropdown.layer.borderColor = UIColor(red: 0.945, green: 0.945, blue: 0.945, alpha: 1.0).cgColor
//        self.contentView.addConstraints([widthConstraind, heightConstraind])
//        self.contentView.addConstraint(NSLayoutConstraint(item: dropdown, attribute: .top, relatedBy: .equal, toItem: statetitle, attribute: .bottom, multiplier: 1, constant: 5))
//        self.contentView.addConstraint(NSLayoutConstraint(item: dropdown, attribute: .leading, relatedBy: .equal, toItem: statefield, attribute: .leading, multiplier: 1, constant: 0))
//        dropdown.optionArray = ["Option 1", "Option 2", "Option 3"]
//        dropdown.optionIds = [1,23,54,22]
//
//        let droptitle = UILabel()
//        droptitle.text = "Country"
//        self.contentView.addSubview(droptitle)
//        droptitle.translatesAutoresizingMaskIntoConstraints = false
//        droptitle.numberOfLines = 30
//        droptitle.font = droptitle.font.withSize(17)
//        self.contentView.addConstraint(NSLayoutConstraint(item: droptitle, attribute: .top, relatedBy: .equal, toItem: dropdown, attribute: .bottom, multiplier: 1, constant: 5))
//        self.contentView.addConstraint(NSLayoutConstraint(item: droptitle, attribute: .leading, relatedBy: .equal, toItem: self.contentView, attribute: .leading, multiplier: 1, constant: CGFloat(phoneWidth/2 + 30)))
//    }
//
//    func checkboxLint(){
//        let tid = 49
//        let did = 50
//
//        let beforeE = self.contentView.viewWithTag(48) as? UILabel
//
//        let elementtitle = UILabel()
//        elementtitle.tag = tid
//        elementtitle.text = "checkbox title"
//
//        self.contentView.addSubview(elementtitle)
//        elementtitle.translatesAutoresizingMaskIntoConstraints = false
//        elementtitle.numberOfLines = 30
//        elementtitle.font = elementtitle.font.withSize(17)
//        self.contentView.addConstraint(NSLayoutConstraint(item: elementtitle, attribute: .top, relatedBy: .equal, toItem: beforeE, attribute: .bottom, multiplier: 1, constant: 10))
//        self.contentView.addConstraint(NSLayoutConstraint(item: elementtitle, attribute: .leading, relatedBy: .equal, toItem: self.contentView, attribute: .leading, multiplier: 1, constant: 20))
//        self.contentView.addConstraint(NSLayoutConstraint(item: elementtitle, attribute: .trailing, relatedBy: .equal, toItem: self.contentView, attribute: .trailing, multiplier: 1, constant: 20))
//
//
//        let checkbtn = UIButton()
//        checkbtn.setImage( UIImage(named:"uncheck"), for: .normal)
//        checkbtn.addTarget(self, action:  #selector(buttonClicked), for: .touchUpInside)
//
//        checkbtn.tag = did
//        self.contentView.addSubview(checkbtn)
//        checkbtn.translatesAutoresizingMaskIntoConstraints = false
//        let heightConstraint = checkbtn.heightAnchor.constraint(equalToConstant: 20)
//        let widthConstraint = checkbtn.widthAnchor.constraint(equalToConstant: 20)
//        self.contentView.addConstraints([widthConstraint, heightConstraint])
//        self.contentView.addConstraint(NSLayoutConstraint(item: checkbtn, attribute: .top, relatedBy: .equal, toItem: elementtitle, attribute: .bottom, multiplier: 1, constant: 10))
//        self.contentView.addConstraint(NSLayoutConstraint(item: checkbtn, attribute: .leading, relatedBy: .equal, toItem: self.contentView, attribute: .leading, multiplier: 1, constant: 20))
//
//        let label = UILabel()
//        label.text = "option 1"
//        label.numberOfLines = 30
//        label.font = elementtitle.font.withSize(16)
//        self.contentView.addSubview(label)
//        label.translatesAutoresizingMaskIntoConstraints = false
//        self.contentView.addConstraint(NSLayoutConstraint(item: label, attribute: .top, relatedBy: .equal, toItem: elementtitle, attribute: .bottom, multiplier: 1, constant: 10))
//        self.contentView.addConstraint(NSLayoutConstraint(item: label, attribute: .leading, relatedBy: .equal, toItem: checkbtn, attribute: .leading, multiplier: 1, constant: 27))
//
//    }
//
//    @objc func buttonClicked(_ sender: UIButton) {
//        if unchecked {
//            sender.setImage( UIImage(named:"check"), for: .normal)
//            unchecked = false
//       }
//       else {
//            sender.setImage(UIImage(named:"uncheck"), for: .normal)
//            unchecked = true
//       }
//    }
//
//    func titlelayout(title:String, titleId:Int, beforeId:Int){
//
//        let beforeE = self.contentView.viewWithTag(beforeId) as? UITextField
//
//        let elementtitle = UILabel()
//        elementtitle.tag = titleId
//        elementtitle.text = title
//
//        self.contentView.addSubview(elementtitle)
//        elementtitle.translatesAutoresizingMaskIntoConstraints = false
//        elementtitle.numberOfLines = 30
//        elementtitle.font = elementtitle.font.withSize(17)
//        self.contentView.addConstraint(NSLayoutConstraint(item: elementtitle, attribute: .top, relatedBy: .equal, toItem: beforeE, attribute: .bottom, multiplier: 1, constant: 10))
//        self.contentView.addConstraint(NSLayoutConstraint(item: elementtitle, attribute: .leading, relatedBy: .equal, toItem: self.contentView, attribute: .leading, multiplier: 1, constant: 20))
//        self.contentView.addConstraint(NSLayoutConstraint(item: elementtitle, attribute: .trailing, relatedBy: .equal, toItem: self.contentView, attribute: .trailing, multiplier: 1, constant: 20))
//
//    }
//
//    func textFieldlayout(hint:String, tagId:Int, edittagId:Int, type:String) {
//
//        let theLabel = self.contentView.viewWithTag(tagId) as? UILabel
//
//        let sampleTextField =  UITextField()
//        if(type == "number"){
//            sampleTextField.delegate = self
//        }
//        sampleTextField.tag = edittagId
//        self.contentView.addSubview(sampleTextField)
//        let heightConstraint = sampleTextField.heightAnchor.constraint(equalToConstant: 35)
//        let widthConstraint = sampleTextField.widthAnchor.constraint(equalToConstant: CGFloat(phoneWidth))
//        self.contentView.addConstraints([widthConstraint, heightConstraint])
//        sampleTextField.keyboardType = .numberPad
//        sampleTextField.translatesAutoresizingMaskIntoConstraints = false
//        sampleTextField.placeholder = hint
//        sampleTextField.font = UIFont.systemFont(ofSize: 15)
//        sampleTextField.borderStyle = UITextField.BorderStyle.roundedRect
//        sampleTextField.autocorrectionType = UITextAutocorrectionType.no
//        sampleTextField.keyboardType = UIKeyboardType.default
//        sampleTextField.returnKeyType = UIReturnKeyType.done
//        sampleTextField.clearButtonMode = UITextField.ViewMode.whileEditing
//        sampleTextField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
//        self.contentView.addConstraint(NSLayoutConstraint(item: sampleTextField, attribute: .top, relatedBy: .equal, toItem: theLabel, attribute: .bottom, multiplier: 1, constant: 5))
//        self.contentView.addConstraint(NSLayoutConstraint(item: sampleTextField, attribute: .leading, relatedBy: .equal, toItem: self.contentView, attribute: .leading, multiplier: 1, constant: 20))
//    }
//
//    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange,
//                           replacementString string: String) -> Bool{
////        let maxLength = 3
////        let currentString: NSString = textField.text! as NSString
////        let newString: NSString =
////            currentString.replacingCharacters(in: range, with: string) as NSString
////        return newString.length <= maxLength
//        if string.rangeOfCharacter(from: NSCharacterSet.decimalDigits) != nil {
//           return true
//        } else {
//        return false
//        }
//    }
}

