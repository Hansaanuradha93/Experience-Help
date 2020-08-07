import UIKit
import MessageUI

class MainViewController: UIViewController {
    
    // MARK: IBOutets
    @IBOutlet weak var mobileNumberTextField: UITextField!
    
    
    // MARK: View Controller
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    // MARK: IBActions
    @IBAction func NikeButtonPressed(_ sender: Any) {
        presentAlert(sender)
    }
}


// MARK: - Methods
extension MainViewController {
    
    fileprivate func facetime(phoneNumber:String) {
        guard let faceTimeUrl = URL(string: "facetime-audio://\(phoneNumber)") else { return }
        UIApplication.shared.open(faceTimeUrl)
    }
    
    fileprivate func presentAlert(_ sender: Any) {
        guard let mobileNumber = self.mobileNumberTextField.text, !mobileNumber.isEmpty else { return }
        let alert = UIAlertController(title: "Get Help", message: "Please call or send a text message to our receptionist", preferredStyle: .actionSheet)
        
        alert.addAction(UIAlertAction(title: "Call", style: .default, handler: { (action) in
            self.facetime(phoneNumber: mobileNumber)
        }))
        
        alert.addAction(UIAlertAction(title: "Send message", style: .default, handler: { (action) in
            self.send(mobileNumber: mobileNumber, message: "Predefined Message")
        }))

        if let popoverController = alert.popoverPresentationController {
            popoverController.sourceView = self.view
            popoverController.sourceRect = CGRect(x: self.view.bounds.midX, y: self.view.bounds.midY, width: 0, height: 0)
            popoverController.permittedArrowDirections = []
        }
        self.present(alert, animated: true, completion: nil)
    }
    
    
    fileprivate func send(mobileNumber: String, message: String) {
        let messageVC = MFMessageComposeViewController()
        messageVC.body = message;
        messageVC.recipients = [mobileNumber]
        messageVC.messageComposeDelegate = self
        if MFMessageComposeViewController.canSendText() {
            self.present(messageVC, animated: true, completion: nil)
        }
    }
}


// MARK: - MFMessageComposeViewControllerDelegate
extension MainViewController: MFMessageComposeViewControllerDelegate {
    
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
        switch (result) {
        case .cancelled:
            print("Message was cancelled")
        case .failed:
            print("Message failed")
        case .sent:
            print("Message was sent")
        default:
            return
        }
        dismiss(animated: true, completion: nil)
    }
}


