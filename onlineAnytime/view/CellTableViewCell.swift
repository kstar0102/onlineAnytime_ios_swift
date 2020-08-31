//
//  CellTableViewCell.swift
//  onlineAnytime
//
//  Created by Admin on 28/08/2020.
//  Copyright © 2020 Admin. All rights reserved.
//

import UIKit

class CellTableViewCell: UITableViewCell {

    @IBOutlet weak var mainL: UILabel!
    var fomrid:String = ""
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
//        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
//        let newViewController = storyBoard.instantiateViewController(withIdentifier: "formView") as! FormViewController
//        self.present(newViewController, animated: true, completion: nil)
        
    }

}
