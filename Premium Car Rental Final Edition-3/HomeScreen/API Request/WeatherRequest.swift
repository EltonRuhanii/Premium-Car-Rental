//
//  WeatherAPI.swift
//  HomeScreen
//
//  Created by TDI Student on 12.10.22.
//

import Foundation
import Alamofire
import SwiftyJSON

class WeatherRequest: NSObject {
    static func getWeatherFunc (completionHandler: @escaping(_ weather: Weather?, _ error: Error?) -> Void) {
        let urlString = "http://dataservice.accuweather.com/currentconditions/v1/298740?apikey=qf7FGuq9KwNm1ttAkhTUnZionqc1Mg3d"
        
        AF.request(urlString, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseJSON { response in
            switch response.result {
            case .success(let data):
                let jsonData = JSON(data)
                
                if jsonData.array?.count ?? 0 > 0 {
                    if let jsonObject = jsonData.array?[0] {
                        if let temperature = jsonObject["Temperature"].dictionaryObject {
                            if let weather = Weather.transform(json: JSON(rawValue: temperature["Metric"]!) ?? [:]) {
                                completionHandler(weather, nil)
                            }
                        }

                    }
                }
            case .failure(let error):
                completionHandler(nil, error)
            }
        }
    }
}
