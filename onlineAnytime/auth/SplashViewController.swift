import UIKit

class SplashViewController: UIViewController {
    var userdata:[UserData] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        userdata = UserLocal.getuserDatas()
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            print(self.userdata.count)
            if(self.userdata.count > 0){
                let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let newViewController = storyBoard.instantiateViewController(withIdentifier: "mainView") as! MainViewController
                self.present(newViewController, animated: true, completion: nil)
            }else{
                self.gotoNextScreen()
               
            }
        }
    }
    
    func gotoNextScreen() {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "loginView") as! LoginViewController
        self.present(newViewController, animated: true, completion: nil)
    }
}
