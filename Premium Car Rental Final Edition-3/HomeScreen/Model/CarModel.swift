//
//  PopularModel.swift
//  HomeScreen
//
//  Created by TDI Student on 16.9.22.
//

import Foundation
import UIKit

enum CarCategory: String {
    case supercars = "Supercars"
    case suv = "Suv"
    case luxury = "Luxury"
    case sedan = "Sedan"
}

// Ja shton ni : Hashable nese pickUnique prej array
struct CarModel {
    var category: CarCategory
    var rating: Double
    var name1: String
    var name2: String
    var smallPhoto: String
    var bigPhoto: String
    var rentalPrice: String
    var carColor: UIColor
    var horsepower: String
    var acceleration: String
    var aditionalImages: [String]
    var description: String
    var engineType: String
    var topSpeed: String
    var interiorColor: String
    var numberOfSeats: Int
    var interiorMaterial: String
}

