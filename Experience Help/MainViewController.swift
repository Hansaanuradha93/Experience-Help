import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func NikeButtonPressed(_ sender: Any) {
        UIApplication.shared.open(URL(string:"facetime://Experience")! as URL, options: [:], completionHandler: nil)
    }
}



