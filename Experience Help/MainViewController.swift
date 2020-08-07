import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var mobileNumberTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

    @IBAction func NikeButtonPressed(_ sender: Any) {
        guard let mobileNumber = mobileNumberTextField.text, !mobileNumber.isEmpty else { return }
        facetime(phoneNumber: mobileNumber)
    }
    
    
    fileprivate func facetime(phoneNumber:String) {
        guard let faceTimeUrl = URL(string: "facetime-audio://\(phoneNumber)") else { return }
        UIApplication.shared.open(faceTimeUrl)
    }
}



