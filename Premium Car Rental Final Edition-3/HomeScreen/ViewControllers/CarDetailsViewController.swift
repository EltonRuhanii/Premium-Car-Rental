//
//  CarDetailsVC.swift
//  HomeScreen
//
//  Created by WIZZARDI on 1.10.22.
//

import UIKit

class CarDetailsViewController: UIViewController {
    // MARK: PROPERTIES
    @IBOutlet weak var carImagesScrollView: UIScrollView!
    @IBOutlet weak var carNameLabel: UILabel!
    @IBOutlet weak var detailsLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var engineType: UILabel!
    @IBOutlet weak var topspeedLabel: UILabel!
    @IBOutlet weak var horsepowerLabel: UILabel!
    @IBOutlet weak var interiorColorLabel: UILabel!
    @IBOutlet weak var numberOfSeatsLabel: UILabel!
    @IBOutlet weak var materialLabel: UILabel!
    @IBOutlet weak var weatherValueLabel: UILabel!
    
    var carModel: CarModel?
    
    // MARK: BODY
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCarModel()
        setupScrollView()
        WeatherRequest.getWeatherFunc { weather, error in
            if let weather = weather {
                let weatherValue = Int(weather.value ?? 0)
                self.weatherValueLabel.text = "\(weatherValue) °C"
            }
        }
    }
    
}

// MARK: FUNCTIONS
extension CarDetailsViewController {
    
    // Car images scroll view
    func setupScrollView(){
        for i in 0...(carModel?.aditionalImages.count)! - 1 {
            let image = UIImageView()
            
            image.frame = CGRect(x: (CGFloat(i) * self.view.frame.width) + 24,
                                 y: 0,
                                 width: carImagesScrollView.frame.width - 48,
                                 height: carImagesScrollView.frame.height)
            image.image = UIImage(named: carModel!.aditionalImages[i])
            image.contentMode = .scaleAspectFill
            image.layer.cornerRadius = 25
            image.layer.masksToBounds = true
            
            carImagesScrollView.addSubview(image)
        }
        carImagesScrollView.contentSize = CGSize(width: self.view.frame.width * CGFloat((carModel?.aditionalImages.count)!), height: 200)
    }
    // Setup information to show on screen
    func setupCarModel() {
        carNameLabel.text = " \(carModel!.name1) \(carModel!.name2)"
        engineType.text = carModel?.engineType
        topspeedLabel.text = carModel?.topSpeed
        horsepowerLabel.text = carModel?.horsepower
        interiorColorLabel.text = carModel?.interiorColor
        numberOfSeatsLabel.text = "\(carModel?.numberOfSeats ?? 2)"
        materialLabel.text = carModel?.interiorMaterial
        detailsLabel.text = carModel?.description
        priceLabel.text = "\(carModel?.rentalPrice ?? "0") / 3 hours"
    }
}
