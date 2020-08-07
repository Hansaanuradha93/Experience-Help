import UIKit
import MessageUI

class MainViewController: UIViewController {
    
    // MARK: IBOutets
    @IBOutlet weak var mobileNumberTextField: UITextField!
    
    
    // MARK: View Controller
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    
    // MARK: IBActions
    @IBAction func NikeButtonPressed(_ sender: Any) {
        presentAlert(sender)
    }
}


// MARK: - Methods
extension MainViewController {
    
    @objc fileprivate func dismissKeyboard() {
        view.endEditing(true)
    }
    
    
    fileprivate func facetime(phoneNumber:String) {
        guard let faceTimeUrl = URL(string: "facetime://\(phoneNumber)") else { return }
        UIApplication.shared.open(faceTimeUrl)
    }
    
    
    fileprivate func presentAlert(_ sender: Any) {
        guard let mobileNumber = self.mobileNumberTextField.text, !mobileNumber.isEmpty else { return }
        let alert = UIAlertController(title: Strings.getHelp, message: Strings.pleaseCallOrMessage, preferredStyle: .actionSheet)
        
        alert.addAction(UIAlertAction(title: Strings.call, style: .default, handler: { (action) in
            self.facetime(phoneNumber: mobileNumber)
        }))
        
        alert.addAction(UIAlertAction(title: Strings.sendMessage, style: .default, handler: { (action) in
            self.send(mobileNumber: mobileNumber, message: Strings.predifinedTextMessage)
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
    
    
    fileprivate func setupUI() {
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard)))
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


