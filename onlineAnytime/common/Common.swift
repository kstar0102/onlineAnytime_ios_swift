import UIKit

class Common {
    
    static let loginUrl = "http://192.168.107.90:89/login"
    static let Register_url = "https://civilsafety.edu.au/appinquire/"
    
    static let error = "Error"
    static let yesBtn = "Yes"
    static let nobtn = "No"
    static let offlineLb = "It is currently offline."
    
    static let BASE = UIColor(red: 0.0, green: 44/255, blue: 115/255, alpha: 1.0)
    
    static func NoticeAlert(vc: UIViewController, Ntitle: String, Nmessage: String){
        let dialogMessage = UIAlertController(title: Ntitle, message: Nmessage, preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
            dialogMessage.dismiss(animated: true, completion: nil)
         })
        
        dialogMessage.addAction(ok)
        vc.present(dialogMessage, animated: true, completion: nil)
    }
}
