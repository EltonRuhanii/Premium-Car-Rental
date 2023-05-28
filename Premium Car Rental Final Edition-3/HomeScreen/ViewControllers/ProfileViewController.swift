//
//  ProfileViewController.swift
//  HomeScreen
//
//  Created by TDI Student on 14.10.22.
//

import UIKit
import CoreData

class ProfileViewController: UIViewController {
    // MARK: PROPERTIES
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var expireLabel: UILabel!
    @IBOutlet weak var name: UILabel!
    
    let userDefaults = UserDefaults()
    var cardName: String = ""
    var cardNumber: String = ""
    var expiryDate: String = ""
    
    // MARK: BODY
    override func viewDidLoad() {
        super.viewDidLoad()
        if let value = userDefaults.value(forKey: "name") as? String {
            name.text = value
        }
        fetchData()
    }
}

// MARK: FUNCTIONS
extension ProfileViewController: CardDetailsDelegate {
    @IBAction func newCardPressed(_ sender: Any) {
        let childVC = storyboard!.instantiateViewController(withIdentifier: "CardDetailsViewController") as! CardDetailsViewController
        self.addChild(childVC)
        childVC.view.frame = CGRect(x: 0, y: 0, width: self.view.frame.width , height: self.view.frame.height )
        self.view.addSubview(childVC.view)
        childVC.didMove(toParent: self)
        childVC.delegate = self
    }
    
    // Fetch Data
    func fetchData() {
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        let context = appDelegate?.persistentContainer.viewContext
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "CardEntity")
        
        do {
            let results = try context!.fetch(request)
            
            if results.isEmpty {
                nameLabel.text = "There's no card on your profile."
                numberLabel.text = "Press add new card to add a credit card to your profile."
                expireLabel.isHidden = true
            }
            
            for cardMO in ((results as? [NSManagedObject])!) {
                nameLabel.text =  (cardMO.value(forKey: "name") ?? "") as? String
                numberLabel.text = (cardMO.value(forKey: "number") ?? "") as? String
                expireLabel.isHidden = false
                expireLabel.text = (cardMO.value(forKey: "expireDate") ?? "") as? String
            }
        } catch {
            print("Could not fetch data.")
        }
    }
    
    
    @IBAction func backButtonPressed(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    func submitCard(name: String, card: String, expiryDate: String) {
        nameLabel.text = name
        numberLabel.text = card
        expireLabel.text = expiryDate
    }
}
