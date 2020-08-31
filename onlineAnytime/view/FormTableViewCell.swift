//
//  FormTableViewCell.swift
//  onlineAnytime
//
//  Created by Admin on 30/08/2020.
//  Copyright © 2020 Admin. All rights reserved.
//

import UIKit

class FormTableViewCell: UITableViewCell, UITextFieldDelegate {
    
    @IBOutlet weak var contentCell: UIView!
    @IBOutlet weak var ll: UILabel!
    var phoneWidth:Int = 0
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let screenSize = UIScreen.main.bounds
        let screenWidth = screenSize.width
        phoneWidth = Int(screenWidth - 40)
        
        numberLint()
        emailLint()
        urlLint()
        textLint()
        moneyLint()
        nameLint()
        phoneLint()
        sectionLint()
        dateLint()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    

    func numberLint(){
       let tid = 11
       let numbereid = 12
       let elementtitle = UILabel()
       elementtitle.tag = tid
       elementtitle.text = "NumbertTitle"
       
       self.contentView.addSubview(elementtitle)
       elementtitle.translatesAutoresizingMaskIntoConstraints = false
       elementtitle.numberOfLines = 30
       elementtitle.font = elementtitle.font.withSize(17)
       self.contentView.addConstraint(NSLayoutConstraint(item: elementtitle, attribute: .top, relatedBy: .equal, toItem: self.ll, attribute: .bottom, multiplier: 1, constant: 10))
       self.contentView.addConstraint(NSLayoutConstraint(item: elementtitle, attribute: .leading, relatedBy: .equal, toItem: self.contentView, attribute: .leading, multiplier: 1, constant: 20))
       self.contentView.addConstraint(NSLayoutConstraint(item: elementtitle, attribute: .trailing, relatedBy: .equal, toItem: self.contentView, attribute: .trailing, multiplier: 1, constant: 20))
        
        self.textFieldlayout(hint: "Please wirte number", tagId: tid, edittagId: numbereid, type: "number")
    }
    
    func emailLint() {
        let tid = 13
        let eid = 14
        self.titlelayout(title: "EmailTitle", titleId: tid, beforeId: 12)
        self.textFieldlayout(hint: "Please wirte email", tagId: tid, edittagId: eid, type: "text")
    }
    
    func urlLint() {
        let tid = 15
        let eid = 16
        self.titlelayout(title: "UrlTitle", titleId: tid, beforeId: 14)
        self.textFieldlayout(hint: "Please wirte url", tagId: tid, edittagId: eid, type: "text")
    }
    
    func textLint() {
        let tid = 17
        let eid = 18
        self.titlelayout(title: "TextTitle", titleId: tid, beforeId: 16)
        self.textFieldlayout(hint: "Please wirte text", tagId: tid, edittagId: eid, type: "text")
    }
    
    func moneyLint() {
        let tid = 19
        let did = 20
        let sid = 21
        self.titlelayout(title: "UrlTitle", titleId: tid, beforeId: 18)
        
        let theLabel = self.contentView.viewWithTag(tid) as? UILabel
        
        let startlable = UILabel()
        startlable.text = "$"
        self.contentView.addSubview(startlable)
        startlable.translatesAutoresizingMaskIntoConstraints = false
        startlable.font = startlable.font.withSize(17)
        self.contentView.addConstraint(NSLayoutConstraint(item: startlable, attribute: .top, relatedBy: .equal, toItem: theLabel, attribute: .bottom, multiplier: 1, constant: 10))
        self.contentView.addConstraint(NSLayoutConstraint(item: startlable, attribute: .leading, relatedBy: .equal, toItem: self.contentView, attribute: .leading, multiplier: 1, constant: 20))
        
        let dollerField =  UITextField()
        dollerField.tag = did
        dollerField.delegate = self
        self.contentView.addSubview(dollerField)
        let heightConstraint = dollerField.heightAnchor.constraint(equalToConstant: 35)
        let widthConstraint = dollerField.widthAnchor.constraint(equalToConstant: 130)
        self.contentView.addConstraints([widthConstraint, heightConstraint])
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
        self.contentView.addConstraint(NSLayoutConstraint(item: dollerField, attribute: .top, relatedBy: .equal, toItem: theLabel, attribute: .bottom, multiplier: 1, constant: 5))
        self.contentView.addConstraint(NSLayoutConstraint(item: dollerField, attribute: .leading, relatedBy: .equal, toItem: startlable, attribute: .leading, multiplier: 1, constant: 15))
        
        let comlable = UILabel()
        comlable.text = "."
        self.contentView.addSubview(comlable)
        comlable.translatesAutoresizingMaskIntoConstraints = false
        comlable.font = comlable.font.withSize(17)
        self.contentView.addConstraint(NSLayoutConstraint(item: comlable, attribute: .top, relatedBy: .equal, toItem: theLabel, attribute: .bottom, multiplier: 1, constant: 20))
        self.contentView.addConstraint(NSLayoutConstraint(item: comlable, attribute: .leading, relatedBy: .equal, toItem: dollerField, attribute: .leading, multiplier: 1, constant: 135))
        
        let sentfield =  UITextField()
        sentfield.tag = sid
        sentfield.delegate = self
        self.contentView.addSubview(sentfield)
        let heightConstraintc = sentfield.heightAnchor.constraint(equalToConstant: 35)
        let widthConstraintc = sentfield.widthAnchor.constraint(equalToConstant: 100)
        self.contentView.addConstraints([widthConstraintc, heightConstraintc])
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
        self.contentView.addConstraint(NSLayoutConstraint(item: sentfield, attribute: .top, relatedBy: .equal, toItem: theLabel, attribute: .bottom, multiplier: 1, constant: 5))
        self.contentView.addConstraint(NSLayoutConstraint(item: sentfield, attribute: .leading, relatedBy: .equal, toItem: comlable, attribute: .leading, multiplier: 1, constant: 10))
    }
    
    func nameLint() {
        let tid = 22
        let fid = 23
        let lid = 24
        self.titlelayout(title: "NameTitle", titleId: tid, beforeId: 20)
        let theLabel = self.contentView.viewWithTag(tid) as? UILabel
        
        let firstField =  UITextField()
        firstField.tag = fid
        self.contentView.addSubview(firstField)
        let heightConstraint = firstField.heightAnchor.constraint(equalToConstant: 35)
        let widthConstraint = firstField.widthAnchor.constraint(equalToConstant: 130)
        self.contentView.addConstraints([widthConstraint, heightConstraint])
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
        self.contentView.addConstraint(NSLayoutConstraint(item: firstField, attribute: .top, relatedBy: .equal, toItem: theLabel, attribute: .bottom, multiplier: 1, constant: 5))
        self.contentView.addConstraint(NSLayoutConstraint(item: firstField, attribute: .leading, relatedBy: .equal, toItem: self.contentView, attribute: .leading, multiplier: 1, constant: 20))
        
        let lastfield =  UITextField()
        lastfield.tag = lid
        self.contentView.addSubview(lastfield)
        let heightConstraintc = lastfield.heightAnchor.constraint(equalToConstant: 35)
        let widthConstraintc = lastfield.widthAnchor.constraint(equalToConstant: 150)
        self.contentView.addConstraints([widthConstraintc, heightConstraintc])
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
        self.contentView.addConstraint(NSLayoutConstraint(item: lastfield, attribute: .top, relatedBy: .equal, toItem: theLabel, attribute: .bottom, multiplier: 1, constant: 5))
        self.contentView.addConstraint(NSLayoutConstraint(item: lastfield, attribute: .leading, relatedBy: .equal, toItem: firstField, attribute: .leading, multiplier: 1, constant: 140))
    }
    
    func phoneLint(){
        let tid = 25
        let pid1 = 26
        let pid2 = 27
        let pid3 = 28
        
        self.titlelayout(title: "phoneTitle", titleId: tid, beforeId: 23)
        let theLabel = self.contentView.viewWithTag(tid) as? UILabel
        
        let firstField =  UITextField()
        firstField.tag = pid1
        firstField.delegate = self
        self.contentView.addSubview(firstField)
        let heightConstraint = firstField.heightAnchor.constraint(equalToConstant: 35)
        let widthConstraint = firstField.widthAnchor.constraint(equalToConstant: 76)
        self.contentView.addConstraints([widthConstraint, heightConstraint])
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
        self.contentView.addConstraint(NSLayoutConstraint(item: firstField, attribute: .top, relatedBy: .equal, toItem: theLabel, attribute: .bottom, multiplier: 1, constant: 5))
        self.contentView.addConstraint(NSLayoutConstraint(item: firstField, attribute: .leading, relatedBy: .equal, toItem: self.contentView, attribute: .leading, multiplier: 1, constant: 20))
        
        let comlable = UILabel()
        comlable.text = "-"
        self.contentView.addSubview(comlable)
        comlable.translatesAutoresizingMaskIntoConstraints = false
        comlable.font = comlable.font.withSize(17)
        self.contentView.addConstraint(NSLayoutConstraint(item: comlable, attribute: .top, relatedBy: .equal, toItem: theLabel, attribute: .bottom, multiplier: 1, constant: 10))
        self.contentView.addConstraint(NSLayoutConstraint(item: comlable, attribute: .leading, relatedBy: .equal, toItem: firstField, attribute: .leading, multiplier: 1, constant: 81))
        
        let secontField =  UITextField()
        secontField.tag = pid2
        secontField.delegate = self
        self.contentView.addSubview(secontField)
        let heightConstraints = secontField.heightAnchor.constraint(equalToConstant: 35)
        let widthConstraints = secontField.widthAnchor.constraint(equalToConstant: 76)
        self.contentView.addConstraints([widthConstraints, heightConstraints])
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
        self.contentView.addConstraint(NSLayoutConstraint(item: secontField, attribute: .top, relatedBy: .equal, toItem: theLabel, attribute: .bottom, multiplier: 1, constant: 5))
        self.contentView.addConstraint(NSLayoutConstraint(item: secontField, attribute: .leading, relatedBy: .equal, toItem: comlable, attribute: .leading, multiplier: 1, constant: 15))
        
        let comlables = UILabel()
        comlables.text = "-"
        self.contentView.addSubview(comlables)
        comlables.translatesAutoresizingMaskIntoConstraints = false
        comlables.font = comlables.font.withSize(17)
        self.contentView.addConstraint(NSLayoutConstraint(item: comlables, attribute: .top, relatedBy: .equal, toItem: theLabel, attribute: .bottom, multiplier: 1, constant: 10))
        self.contentView.addConstraint(NSLayoutConstraint(item: comlables, attribute: .leading, relatedBy: .equal, toItem: secontField, attribute: .leading, multiplier: 1, constant: 81))
        
        let thirdField =  UITextField()
        thirdField.tag = pid3
        thirdField.delegate = self
        self.contentView.addSubview(thirdField)
        let heightConstraintt = thirdField.heightAnchor.constraint(equalToConstant: 35)
        let widthConstraintt = thirdField.widthAnchor.constraint(equalToConstant: 87)
        self.contentView.addConstraints([widthConstraintt, heightConstraintt])
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
        self.contentView.addConstraint(NSLayoutConstraint(item: thirdField, attribute: .top, relatedBy: .equal, toItem: theLabel, attribute: .bottom, multiplier: 1, constant: 5))
        self.contentView.addConstraint(NSLayoutConstraint(item: thirdField, attribute: .leading, relatedBy: .equal, toItem: comlables, attribute: .leading, multiplier: 1, constant: 15))
    }
    
    func sectionLint(){
        let tid = 29
        let did = 30
        titlelayout(title: "sectiontile", titleId: tid, beforeId: 26)
        
        let beforeE = self.contentView.viewWithTag(tid) as? UILabel
        
        let elemendes = UILabel()
        elemendes.tag = did
        elemendes.text = "title descrtption"
        
        self.contentView.addSubview(elemendes)
        elemendes.translatesAutoresizingMaskIntoConstraints = false
        elemendes.numberOfLines = 30
        elemendes.font = elemendes.font.withSize(17)
        self.contentView.addConstraint(NSLayoutConstraint(item: elemendes, attribute: .top, relatedBy: .equal, toItem: beforeE, attribute: .bottom, multiplier: 1, constant: 10))
        self.contentView.addConstraint(NSLayoutConstraint(item: elemendes, attribute: .leading, relatedBy: .equal, toItem: self.contentView, attribute: .leading, multiplier: 1, constant: 20))
        self.contentView.addConstraint(NSLayoutConstraint(item: elemendes, attribute: .trailing, relatedBy: .equal, toItem: self.contentView, attribute: .trailing, multiplier: 1, constant: 20))
    }
    
    func dateLint(){
        let tid = 31
        let did = 32
        
        let beforeE = self.contentView.viewWithTag(30) as? UILabel
               
        let elementtitle = UILabel()
        elementtitle.tag = tid
        elementtitle.text = "datetitle"
       
        self.contentView.addSubview(elementtitle)
        elementtitle.translatesAutoresizingMaskIntoConstraints = false
        elementtitle.numberOfLines = 30
        elementtitle.font = elementtitle.font.withSize(17)
        self.contentView.addConstraint(NSLayoutConstraint(item: elementtitle, attribute: .top, relatedBy: .equal, toItem: beforeE, attribute: .bottom, multiplier: 1, constant: 10))
        self.contentView.addConstraint(NSLayoutConstraint(item: elementtitle, attribute: .leading, relatedBy: .equal, toItem: self.contentView, attribute: .leading, multiplier: 1, constant: 20))
        self.contentView.addConstraint(NSLayoutConstraint(item: elementtitle, attribute: .trailing, relatedBy: .equal, toItem: self.contentView, attribute: .trailing, multiplier: 1, constant: 20))
        
        
        let theLabel = self.contentView.viewWithTag(tid) as? UILabel
        
        let datefield =  UITextField()
        datefield.tag = did
        datefield.delegate = self
        self.contentView.addSubview(datefield)
        let heightConstraint = datefield.heightAnchor.constraint(equalToConstant: 35)
        let widthConstraint = datefield.widthAnchor.constraint(equalToConstant: CGFloat(phoneWidth))
        self.contentView.addConstraints([widthConstraint, heightConstraint])
        datefield.keyboardType = .numberPad
        datefield.translatesAutoresizingMaskIntoConstraints = false
        datefield.placeholder = "###"
        datefield.font = UIFont.systemFont(ofSize: 15)
        datefield.borderStyle = UITextField.BorderStyle.roundedRect
        datefield.autocorrectionType = UITextAutocorrectionType.no
        datefield.keyboardType = UIKeyboardType.default
        datefield.returnKeyType = UIReturnKeyType.done
        datefield.clearButtonMode = UITextField.ViewMode.whileEditing
        datefield.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        self.contentView.addConstraint(NSLayoutConstraint(item: datefield, attribute: .top, relatedBy: .equal, toItem: theLabel, attribute: .bottom, multiplier: 1, constant: 5))
        self.contentView.addConstraint(NSLayoutConstraint(item: datefield, attribute: .leading, relatedBy: .equal, toItem: self.contentView, attribute: .leading, multiplier: 1, constant: 20))
        
        datefield.setInputViewDatePicker(target: self, selector: #selector(tapDone))
    }
    
    @objc func tapDone() {
        let myTextField = self.contentView.viewWithTag(32) as? UITextField

        if let datePicker = myTextField!.inputView as? UIDatePicker { // 2-1
            let dateformatter = DateFormatter() // 2-2
            dateformatter.dateStyle = .medium // 2-3
            myTextField!.text = dateformatter.string(from: datePicker.date) //2-4
        }
        myTextField!.resignFirstResponder() // 2-5
    }
    
    func titlelayout(title:String, titleId:Int, beforeId:Int){
        
        let beforeE = self.contentView.viewWithTag(beforeId) as? UITextField
        
        let elementtitle = UILabel()
        elementtitle.tag = titleId
        elementtitle.text = title
        
        self.contentView.addSubview(elementtitle)
        elementtitle.translatesAutoresizingMaskIntoConstraints = false
        elementtitle.numberOfLines = 30
        elementtitle.font = elementtitle.font.withSize(17)
        self.contentView.addConstraint(NSLayoutConstraint(item: elementtitle, attribute: .top, relatedBy: .equal, toItem: beforeE, attribute: .bottom, multiplier: 1, constant: 10))
        self.contentView.addConstraint(NSLayoutConstraint(item: elementtitle, attribute: .leading, relatedBy: .equal, toItem: self.contentView, attribute: .leading, multiplier: 1, constant: 20))
        self.contentView.addConstraint(NSLayoutConstraint(item: elementtitle, attribute: .trailing, relatedBy: .equal, toItem: self.contentView, attribute: .trailing, multiplier: 1, constant: 20))
    }
    
    func textFieldlayout(hint:String, tagId:Int, edittagId:Int, type:String) {
        
        let theLabel = self.contentView.viewWithTag(tagId) as? UILabel
        
        let sampleTextField =  UITextField()
        if(type == "number"){
            sampleTextField.delegate = self
        }
        sampleTextField.tag = edittagId
        self.contentView.addSubview(sampleTextField)
        let heightConstraint = sampleTextField.heightAnchor.constraint(equalToConstant: 35)
        let widthConstraint = sampleTextField.widthAnchor.constraint(equalToConstant: CGFloat(phoneWidth))
        self.contentView.addConstraints([widthConstraint, heightConstraint])
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
        self.contentView.addConstraint(NSLayoutConstraint(item: sampleTextField, attribute: .top, relatedBy: .equal, toItem: theLabel, attribute: .bottom, multiplier: 1, constant: 5))
        self.contentView.addConstraint(NSLayoutConstraint(item: sampleTextField, attribute: .leading, relatedBy: .equal, toItem: self.contentView, attribute: .leading, multiplier: 1, constant: 20))
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

