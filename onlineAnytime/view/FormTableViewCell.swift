
import UIKit
import iOSDropDown
import SwiftSignatureView
import CoreData

class FormTableViewCell: UITableViewCell{
    
    @IBOutlet weak var contentCell: UIView!
    @IBOutlet weak var ll: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

