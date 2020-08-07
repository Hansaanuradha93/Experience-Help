import UIKit
import MessageUI


class MainViewController: UIViewController {
    
    @IBOutlet weak var mobileNumberTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

    @IBAction func NikeButtonPressed(_ sender: Any) {
//        guard let mobileNumber = mobileNumberTextField.text, !mobileNumber.isEmpty else { return }
//        facetime(phoneNumber: mobileNumber)
        presentAlert(sender)
    }
    
    
    fileprivate func facetime(phoneNumber:String) {
        guard let faceTimeUrl = URL(string: "facetime-audio://\(phoneNumber)") else { return }
        UIApplication.shared.open(faceTimeUrl)
    }
    
    fileprivate func presentAlert(_ sender: Any) {
        let alert = UIAlertController(title: "Get Help", message: "Please call or send a text message to our receptionist", preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Call", style: .default, handler: { (action) in
            print("Call")
        }))
        
        alert.addAction(UIAlertAction(title: "Send message", style: .default, handler: { (action) in
            print("Send Message")
        }))

        if let popoverController = alert.popoverPresentationController {
            popoverController.sourceView = self.view
            popoverController.sourceRect = CGRect(x: self.view.bounds.midX, y: self.view.bounds.midY, width: 0, height: 0)
            popoverController.permittedArrowDirections = []
        }
        self.present(alert, animated: true, completion: nil)
        
    }
}



