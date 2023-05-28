//
//  AboutUsViewController.swift
//  HomeScreen
//
//  Created by TDI Student on 14.10.22.
//

import UIKit

class AboutUsViewController: UIViewController {
    // MARK: PROPERTIES
    @IBOutlet weak var eltonInfoHolder: UIVisualEffectView!
    var eltonInformation: Bool = false
    
    // MARK: BODY
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: FUNCTIONS
extension AboutUsViewController {
    @IBAction func backButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func eltonButtonPressed(_ sender: Any) {
        if eltonInformation == false {
            UIView.animate(withDuration: 0.7) {
                self.eltonInfoHolder.isHidden = false
            }
            eltonInformation = true
        } else {
            UIView.animate(withDuration: 0.7) {
                self.eltonInfoHolder.isHidden = true
            }
            eltonInformation = false
        }
    }

}
