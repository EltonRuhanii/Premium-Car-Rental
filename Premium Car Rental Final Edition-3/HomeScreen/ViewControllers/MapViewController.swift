//
//  MapVC.swift
//  HomeScreen
//
//  Created by Era Statovci on 30.9.22.
//
import UIKit
import MapKit

class MapViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    // MARK: PROPERTIES
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var pristinaHolder: UIView!
    @IBOutlet weak var airportHolder: UIView!
    
    let locationManager = CLLocationManager()
    var locationsArray: [MKPointAnnotation] = []
    
    // MARK: BODY
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
        createStops()
        setupLocationManager()
    }
}


    
// MARK: FUNCTIONS
extension MapViewController {
    func setupLocationManager() {
        locationManager.requestAlwaysAuthorization()
        locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.startUpdatingLocation()
        }
    }
    // Create stops at our locations
    func createStops() {
        // Prishtina Location
        let prishtinaLoc = MKPointAnnotation()
        prishtinaLoc.title = "Premium Car Rental - Prishtina Center"
        prishtinaLoc.coordinate = CLLocationCoordinate2D(latitude: 42.66141287531018, longitude: 21.154395483431585)
        locationsArray.append(prishtinaLoc)
        // Airport Location
        let airportLoc = MKPointAnnotation()
        airportLoc.title = "Aeroporti Adem Jashari - Prishtine"
        airportLoc.coordinate = CLLocationCoordinate2D(latitude: 42.57459, longitude: 21.03373)
        locationsArray.append(airportLoc)
        mapView.addAnnotations(locationsArray)
        // Region
        let region = MKCoordinateRegion(center: prishtinaLoc.coordinate, latitudinalMeters: 100000, longitudinalMeters: 100000)
        mapView.setRegion(region, animated: true)
    }
    
    // MARK: Button's pressed to zoom to location
    // Prishtina location
    @IBAction func prishtinaButtonPressed(_ sender: Any) {
        let prishtinaLoc = MKPointAnnotation()
        prishtinaLoc.coordinate = CLLocationCoordinate2D(latitude: 42.66141287531018, longitude: 21.154395483431585)
        let region = MKCoordinateRegion(center: prishtinaLoc.coordinate, latitudinalMeters: 1000, longitudinalMeters: 1000)
        UIView.animate(withDuration: 1) {
            self.mapView.setRegion(region, animated: true)
            self.pristinaHolder.layer.borderWidth = 2
            self.pristinaHolder.layer.borderColor = UIColor.lightGray.cgColor
            self.airportHolder.layer.borderWidth = 0
        }
        
    }
    // Airport location
    @IBAction func airportButtonPressed(_ sender: Any) {
        let airportLoc = MKPointAnnotation()
        airportLoc.coordinate = CLLocationCoordinate2D(latitude: 42.57459, longitude: 21.03373)
        let region = MKCoordinateRegion(center: airportLoc.coordinate, latitudinalMeters: 1000, longitudinalMeters: 1000)
        UIView.animate(withDuration: 1) {
            self.mapView.setRegion(region, animated: true)
            self.airportHolder.layer.borderWidth = 2
            self.airportHolder.layer.borderColor = UIColor.lightGray.cgColor
            self.pristinaHolder.layer.borderWidth = 0
        }
    }
    
    @IBAction func backButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
