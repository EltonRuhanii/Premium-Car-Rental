//
//  FleetVC.swift
//  HomeScreen
//
//  Created by EltonR on 26.9.22.
//

import UIKit

class FleetViewController: UIViewController {
    // MARK: PROPERTIES
    @IBOutlet weak var helloLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet var swipeGesture: UISwipeGestureRecognizer!
    
    // VARIABLES
    private var menu = false
    private let screen = UIScreen.main.bounds
    private var home = CGAffineTransform()
    private var colums: Bool = true
    var name: String = ""
    // MODELS
    var menuOptions: [MenuOptions] = CarDatasource().menuModel
    let datasource = CarDatasource()
    var carCategory: CarCategory = .suv
    let userDefaults = UserDefaults()
    
    // MARK: BODY
    override func viewDidLoad() {
        super.viewDidLoad()
        home = containerView.transform
        setupUsername()
        setupTableView()
        navigationItem.hidesBackButton = true
    }
}

// MARK: FUNCTIONS
extension FleetViewController {
    // Takes an value that is saved under key "name" and uses it as users name which will be shown on top of screen
    func setupUsername() {
        if let value = userDefaults.value(forKey: "name") as? String {
            name = value
        }
        helloLabel.text = "Take a look \(name)"
    }
    
    // MARK: Show / Hide Menu functions
    // Show
    func showMenu(){
        self.containerView.layer.cornerRadius = 40
        let x = screen.width * 0.8
        let originalTransform = self.containerView.transform
        let scaledTransorm = originalTransform.scaledBy(x: 0.8, y: 0.8)
        let scaleAndTranslatedTransform = scaledTransorm.translatedBy(x: x, y: 0)
        
        UIView.animate(withDuration: 0.7) {
            self.containerView.transform = scaleAndTranslatedTransform
        }
    }
    
    @IBAction func showMenu(_ sender: Any) {
        if menu == false && swipeGesture.direction == .right {
            showMenu()
            menu = true
        }
    }
    // Hide
    func hideMenu(){
        UIView.animate(withDuration: 0.7) {
            self.containerView.transform = self.home // sets container view to its original place
            self.containerView.layer.cornerRadius = 0
        }
    }
    
    @IBAction func hideMenu(_ sender: Any) {
        if menu == true {
            hideMenu()
            menu = false
        }
    }
    
    // MARK: Change flow layout
    // Small Cells
    @IBAction func smallClicked(_ sender: Any) {
        colums = false
        UIView.animate(withDuration: 1) {
            self.collectionView.reloadData()
        }
    }
    // Big Cells
    @IBAction func columsClicked(_ sender: Any) {
        colums = true
        UIView.animate(withDuration: 1) {
            self.collectionView.reloadData()
        }
    }
    
    // MARK: Change car category
    @IBAction func luxury(_ sender: Any) {
        carCategory = .luxury
        collectionView.reloadData()
    }
    
    @IBAction func supercars(_ sender: Any) {
        carCategory = .supercars
        collectionView.reloadData()
    }
    
    @IBAction func suv(_ sender: Any) {
        carCategory = .suv
        collectionView.reloadData()
    }
    
    @IBAction func sedan(_ sender: Any) {
        carCategory = .sedan
        collectionView.reloadData()
    }
}

// MARK: COLLECTION & TABLE VIEWS
extension FleetViewController: UITableViewDelegate, UITableViewDataSource, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func setupTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "MenuCell", bundle: nil), forCellReuseIdentifier: "MenuCell")
        tableView.backgroundColor = .clear
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "ColumsCarCell", bundle: nil), forCellWithReuseIdentifier: "ColumsCarCell")
        collectionView.register(UINib(nibName: "PopularCell", bundle: nil), forCellWithReuseIdentifier: "PopularCell")
    }
    
    // MARK: Menu TableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuOptions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuCell", for: indexPath) as! MenuCell
        
        cell.descriptionLabel.text = menuOptions[indexPath.row].title
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
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
    }
    
    // MARK: Car Collection View
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return datasource.getCars(category: carCategory).count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if colums == true {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ColumsCarCell", for: indexPath) as! ColumsCarCell
            
            let carModel = datasource.getCars(category: carCategory)[indexPath.item]
            
            cell.containerView.backgroundColor = carModel.carColor
            cell.carImage.image = UIImage(named: carModel.bigPhoto)
            cell.nameLabel.text = "\(carModel.name1) \(carModel.name2)"
            cell.horsepowerLabel.text = carModel.horsepower
            cell.accelerationLabel.text = carModel.acceleration
            cell.priceLabel.text = "\(String(describing: carModel.rentalPrice)) / 3h"
            
            return cell
            
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PopularCell", for: indexPath) as! PopularCell
            
            let carModel = datasource.getCars(category: carCategory)[indexPath.item]
            
            cell.containerView.backgroundColor = carModel.carColor
            cell.carImage.image = UIImage(named: carModel.smallPhoto)
            cell.nameOne.text = carModel.name1
            cell.nameTwo.text = carModel.name2
            cell.priceLabel.text = "\(String(describing: carModel.rentalPrice)) / 3h"
            
            return cell
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if colums == true {
            let width = collectionView.frame.width
            let height = width * 0.697
            return CGSize(width: width, height: height)
        } else {
            let width = collectionView.frame.width / 2 - 12
            let height = width * 1.4
            return CGSize(width: width, height: height)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let carModel = datasource.getCars(category: carCategory)[indexPath.item]
        if let carDetailsVC = storyboard?.instantiateViewController(withIdentifier: "CarDetailsVC") as? CarDetailsViewController {
            carDetailsVC.carModel = carModel
            self.navigationController?.pushViewController(carDetailsVC, animated: false)
        }
    }
}

