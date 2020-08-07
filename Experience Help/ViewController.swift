//
//  ViewController.swift
//  Experience Help
//
//  Created by John Peter Pascual on 8/4/20.
//  Copyright © 2020 Testing. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    
    }

    @IBAction func NikeButtonPressed(_ sender: Any) {
        UIApplication.shared.open(URL(string:"facetime://Experience")! as URL, options: [:], completionHandler: nil)
    
}
    
}



