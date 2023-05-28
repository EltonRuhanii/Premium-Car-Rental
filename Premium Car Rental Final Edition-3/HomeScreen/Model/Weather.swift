//
//  Weather.swift
//  HomeScreen
//
//  Created by TDI Student on 12.10.22.
//

import Foundation
import SwiftyJSON

struct Weather {
    var value: Double?

    static func transform(json: JSON) -> Weather? {
        var weather = Weather()
        
        if let weatherValue =  json["Value"].double{
            weather.value = weatherValue
        }
        return weather
    }
}
