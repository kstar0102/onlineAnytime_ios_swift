import UIKit
import CoreData

class MainTableViewCell: UITableViewCell {

    @IBOutlet weak var mainL: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    internal func initData(todoData: [FormData], ind: Int){
        mainL.text = todoData[ind].ftitle
    }
    
}
