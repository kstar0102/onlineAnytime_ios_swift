
import UIKit

class CheckButton: UIButton {
    let checkimage = UIImage(named: "check")!
    let uncheckimage = UIImage(named: "uncheck")!
    
    var ischecked:Bool = false{
        didSet{
            if ischecked == true{
                self.setImage(checkimage, for: .normal)
            }else{
                self.setImage(uncheckimage, for: .normal)
            }
        }
    }

    override func awakeFromNib() {
        self.addTarget(self, action: Selector(("buttonClicked")), for: .touchUpInside)
        self.ischecked = false
    }
    
    func buttonClicked(sender:UIButton){
        if(sender == self){
            if ischecked == true{
                ischecked = false
            }else{
                ischecked = true
            }
        }
    }
}
