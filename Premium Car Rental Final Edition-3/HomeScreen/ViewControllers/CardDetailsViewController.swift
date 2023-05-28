//
//  CarDetailsViewController.swift
//  HomeScreen
//
//  Created by TDI Student on 14.10.22.
//

import UIKit
import CoreData

protocol CardDetailsDelegate {
    func submitCard(name: String, card: String, expiryDate: String)
}

class CardDetailsViewController: UIViewController {
    // MARK: PROPERTIES
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var cardTextField: UITextField!
    @IBOutlet weak var expiryDateField: UITextField!
    var delegate: CardDetailsDelegate?
    
    // MARK: BODY
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: FUNCTIONS
extension CardDetailsViewController {
    @IBAction func dismissButtonPressed(_ sender: Any) {
        remove()
    }
    
    @IBAction func submitButtonPressed(_ sender: Any) {
        remove()
        saveData()
        delegate?.submitCard(name: nameTextField.text ?? "", card: cardTextField.text ?? "", expiryDate: expiryDateField.text ?? "")
    }
    
    func remove() {
        self.view.removeFromSuperview()
        self.willMove(toParent: self.parent)
        self.removeFromParent()
    }

    //save Card details
    func saveData() {
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        let context = appDelegate?.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "CardEntity", in: context!)!
        
        let cardMO = NSManagedObject(entity: entity, insertInto: context)
        cardMO.setValue(nameTextField.text, forKey: "name")
        cardMO.setValue(cardTextField.text, forKey: "number")
        cardMO.setValue(expiryDateField.text, forKey: "expireDate")
        
        do {
            try context!.save()
            print("Card saved successfully on CoreData.")
        } catch {
            print("Card could not be saved.")
        }
    }
}
