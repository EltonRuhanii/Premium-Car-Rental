//
//  FaqVC.swift
//  HomeScreen
//
//  Created by EltonR on 24.9.22.
//

import UIKit

class FaqViewController: UIViewController {
    // MARK: PROPERTIES
    // OUTLETS
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var fleetPhoto: UIImageView!
    @IBOutlet weak var blur: UIVisualEffectView!
    @IBOutlet var swipeGesture: UISwipeGestureRecognizer!
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var questionsTableView: UITableView!
    
    // VARIABLES
    var menu = false
    let screen = UIScreen.main.bounds
    var home = CGAffineTransform()
    var menuOptions: [MenuOptions] = CarDatasource().menuModel
    var faqsArray: [FAQ] = CarDatasource().faqModel
    var selectedQuestionIndex: Int = -1
    
    // MARK: BODY
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        home = containerView.transform
        setupTable()
    }
}

// MARK: FUNCTIONS
extension FaqViewController {
    func setupTable(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "MenuCell", bundle: nil), forCellReuseIdentifier: "MenuCell")
        tableView.backgroundColor = .clear

        questionsTableView.delegate = self
        questionsTableView.dataSource = self
        questionsTableView.register(UINib(nibName: "QuestionCell", bundle: nil), forCellReuseIdentifier: "QuestionCell")
    }
    
    // MARK: Show / Hide Menu Functions
    func showMenu(){
        self.containerView.layer.cornerRadius = 40
        topView.layer.cornerRadius = 40
        bottomView.layer.cornerRadius = 40
        bottomView.layer.maskedCorners = [.layerMinXMaxYCorner]
        fleetPhoto.layer.cornerRadius = 40
        blur.layer.cornerRadius = 40
        let x = screen.width * 0.8 // Sets up the future postion for the container view
        let originalTransform = self.containerView.transform // Original Postion
        let scaledTransorm = originalTransform.scaledBy(x: 0.8, y: 0.8) // Scales down the view
        let scaleAndTranslatedTransform = scaledTransorm.translatedBy(x: x, y: 0) // Moves the view to the right, y stays same
        
        UIView.animate(withDuration: 0.7) {
            self.containerView.transform = scaleAndTranslatedTransform
        }
    }
    
    @IBAction func showMenu(_ sender: Any) {
        if menu == false && swipeGesture.direction == .right{
            showMenu()
            menu = true
        }
    }
    
    // Hide Menu Functions
    func hideMenu(){
        UIView.animate(withDuration: 0.7) {
            self.containerView.transform = self.home // sets container view to its original place
            self.containerView.layer.cornerRadius = 0
            self.fleetPhoto.layer.cornerRadius = 0
            self.topView.layer.cornerRadius = 0
            self.bottomView.layer.cornerRadius = 0
        }
    }
    
    @IBAction func hideMenu(_ sender: Any) {
        if menu == true {
            hideMenu()
            menu = false
        }
    }
    
    @IBAction func getLocationVC(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewcontroller = storyboard.instantiateViewController(withIdentifier: "MapVC") as! MapViewController
        self.navigationController?.pushViewController(viewcontroller, animated: true)
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}

// MARK: TABLE VIEW'S
extension FaqViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == self.tableView {
            return menuOptions.count
        } else {
            return faqsArray.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == self.tableView {
            let cell = tableView.dequeueReusableCell(withIdentifier: "MenuCell", for: indexPath) as! MenuCell
            cell.descriptionLabel.text = menuOptions[indexPath.row].title
            return cell
        }
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "QuestionCell", for: indexPath) as! QuestionCell
            cell.questionLabel.text = faqsArray[indexPath.row].question
            cell.answerLabel.text = faqsArray[indexPath.row].answer
            cell.delegate = self
            cell.setDetails(faq: faqsArray[indexPath.row])
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView == self.tableView {
            let menuOption = menuOptions[indexPath.item]
            if let indexPath = tableView.indexPathForSelectedRow {
                let currentCell = (tableView.cellForRow(at: indexPath) ?? UITableViewCell()) as UITableViewCell
                currentCell.alpha = 0.5
                UIView.animate(withDuration: 0.1) {
                    currentCell.alpha = 1
                    tableView.deselectRow(at: indexPath, animated: true)
                }
                
                if menuOption.segue == "" {
                    let alert = UIAlertController(title: "You already are here", message: "", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Continue", style: .default))
                    self.present(alert, animated: true, completion: nil)
                } else {
                    self.parent?.performSegue(withIdentifier: menuOptions[indexPath.row].segue, sender: self)
                }
            }
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "QuestionCell", for: indexPath) as! QuestionCell
            if faqsArray[indexPath.row].isOpen {
                cell.expandImage.image = UIImage(named: "collapsed")
                faqsArray[indexPath.row].isOpen = false
            } else {
                cell.expandImage.image = UIImage(named: "expanded")
                faqsArray[indexPath.row].isOpen = true
            }
            let index = IndexPath(item: indexPath.row, section: 0)
            questionsTableView.reloadRows(at: [index], with: .fade)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if tableView == self.tableView {
            return 90
        } else {
            if faqsArray[indexPath.row].isOpen {
                return 175
            } else {
                return 60
            }
        }
    }
    
}

extension FaqViewController: FAQDelegate {
    func expandButtonPressed(faq: FAQ) {
        for i in 0...faqsArray.count - 1 {
            if faqsArray[i].id == faq.id {
                let indexPath = IndexPath(row: i, section: 0)
                questionsTableView.selectRow(at: indexPath, animated: true, scrollPosition: .top)
                questionsTableView.delegate?.tableView!(questionsTableView, didSelectRowAt: indexPath)
                break
            }
        }
    }
}
