//
//  ViewController.swift
//  HomeScreen
//
//  Created by EltonR on 10.9.22.
//

import UIKit

class ViewController: UIViewController {
    // MARK: PROPERTIES
    // Outlets
    @IBOutlet var swipeGesture: UISwipeGestureRecognizer!
    @IBOutlet weak var helloLabel: UILabel!
    @IBOutlet weak var menuTableView: UITableView!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var promotionScrollView: UIScrollView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    // Variables
    var menu = false
    let screen = UIScreen.main.bounds
    var home = CGAffineTransform()
    var name: String = ""
    let userDefaults = UserDefaults()
    
    // Model Configurationfunc 
    var carsModel: [CarModel] = CarDatasource().getPopularCars()
    var menuOptions: [MenuOptions] = CarDatasource().menuModel
    var promotionModel: [PromotionModel] = CarDatasource().promotionModel
    
    // MARK: BODY
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUsername()
        setUpTableView()
        setupScrollView()
        setupCollection()
        navigationItem.hidesBackButton = true
    }
}



// MARK: FUNCTIONS
extension ViewController {
    func setupUsername() {
        if let value = userDefaults.value(forKey: "name") as? String {
            name = value
        }
        helloLabel.text = "Hello, \(name)"
    }
    
    func setupScrollView(){
        for i in 0...promotionModel.count - 1 {
            let view = UIView()
            let imageView = UIImageView()
            let labelHolder = UIView()
            let label = UILabel()
             
            // Positions
            view.frame = CGRect(x: (CGFloat(i) * self.view.frame.width) + 24, y: 0, width: self.view.frame.width - 48, height: promotionScrollView.frame.height)
            imageView.frame = CGRect(x: (CGFloat(i) * self.view.frame.width) + 24, y: 0, width: self.view.frame.width - 48, height: promotionScrollView.frame.height)
            labelHolder.frame = CGRect(x: CGFloat(i) * self.view.frame.width + 30, y: promotionScrollView.frame.height - 66, width: self.view.frame.width - 60, height: 60)
            label.frame = CGRect(x: CGFloat(i) * self.view.frame.width + 38, y: promotionScrollView.frame.height - 66, width: self.view.frame.width - 72, height: 60)
            
            // Changes acording to model
            imageView.image = UIImage(named: promotionModel[i].photo ?? "")
            label.text = promotionModel[i].text ?? ""
            
            // Visual changes
            view.layer.borderWidth = 2
            view.layer.cornerRadius =  25
            view.layer.masksToBounds = true
            
            imageView.layer.cornerRadius = 25
            imageView.contentMode = .scaleAspectFill
            imageView.layer.masksToBounds = true
            
            labelHolder.layer.cornerRadius = 19
            labelHolder.backgroundColor = UIColor(red: 0.93, green: 0.93, blue: 0.93, alpha: 0.5)
            
            label.numberOfLines = 2
            label.textColor = .black
            label.font = UIFont.init(name: "Futura-Medium", size: 14)
            label.font = .boldSystemFont(ofSize: 18)
            
            // Adding Subviews
            promotionScrollView.addSubview(view)
            promotionScrollView.addSubview(imageView)
            promotionScrollView.addSubview(labelHolder)
            promotionScrollView.addSubview(label)
        }
        promotionScrollView.contentSize = CGSize(width: self.view.frame.width * CGFloat(promotionModel.count), height: promotionScrollView.frame.width * 0.22)
    }
    
    func setUpTableView(){
        menuTableView.delegate = self
        menuTableView.dataSource = self
        menuTableView.backgroundColor = .clear
        menuTableView.register(UINib(nibName: "MenuCell", bundle: nil), forCellReuseIdentifier: "MenuCell")
        home = containerView.transform
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .clear
    }
    
    @IBAction func viewCarsPressed(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let viewcontroller = storyboard.instantiateViewController(withIdentifier: "FleetVC") as? FleetViewController {
            viewcontroller.name = name
            self.navigationController?.pushViewController(viewcontroller, animated: false)
            
        }
    }
    
    // MARK: Menu Hide / Show
    func showMenu(){
        self.containerView.layer.cornerRadius = 40
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
        }
    }
    
    @IBAction func hideMenu(_ sender: Any) {
        if menu == true {
            hideMenu()
            menu = false
        }
    }
    
    @IBAction func faqButtonPressed(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewcontroller = storyboard.instantiateViewController(withIdentifier: "FaqVC") as! FaqViewController
        self.navigationController?.pushViewController(viewcontroller, animated: true)
    }
    
    @IBAction func profileButtonPressed(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let viewcontroller = storyboard.instantiateViewController(withIdentifier: "ProfileViewController") as? ProfileViewController {
            self.navigationController?.pushViewController(viewcontroller, animated: false)
            
        }
    }
}

// MARK: COLLECTION & TABLE VIEW
extension ViewController: UITableViewDelegate, UITableViewDataSource, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func setupCollection(){
        collectionView.register(UINib(nibName: "PopularCell", bundle: nil), forCellWithReuseIdentifier: "PopularCell")
    }
    
    // Table View Setup
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuOptions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuCell", for: indexPath) as! MenuCell
        
        cell.backgroundColor = .clear
        cell.descriptionLabel.text = menuOptions[indexPath.row].title
        cell.descriptionLabel.textColor = .white
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let indexPath = tableView.indexPathForSelectedRow {
            let menuOption = menuOptions[indexPath.item]
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
    
    // Collection View Setup
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return carsModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PopularCell", for: indexPath) as! PopularCell
        
        let carsModel = carsModel[indexPath.item]
        
        cell.carImage.image = UIImage(named: carsModel.smallPhoto)
        cell.nameOne.text = carsModel.name1
        cell.nameTwo.text = carsModel.name2
        cell.containerView.backgroundColor = carsModel.carColor
        
        return cell
    }
        
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width / 2 - 12
        let height = width * 1.4
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let carModel = carsModel[indexPath.item]
        if let carDetailsVC = storyboard?.instantiateViewController(withIdentifier: "CarDetailsVC") as? CarDetailsViewController {
            carDetailsVC.carModel = carModel
            self.navigationController?.pushViewController(carDetailsVC, animated: false)
        }
    }
    
    
}
