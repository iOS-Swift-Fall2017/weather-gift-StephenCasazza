//
//  WeatherLocation.swift .swift
//  weatherGift
//
//  Created by Stephen Casazza on 10/22/17.
//  Copyright © 2017 Casazza. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class WeatherLocation {
    var name = ""
    var coordinates = ""
    var currentTemp = "--"
    var dailySummary = ""
    var currentIcon = ""
    
    func getWeather(completed: @escaping () -> ()) {
        
        let weatherURL = urlBase + urlApiKey + coordinates
        
        Alamofire.request(weatherURL).responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                if let temperature = json["currently"]["temperature"].double {
                    let roundedTemp = String(format: "%3.f", temperature)
                    self.currentTemp = roundedTemp + "°"
                } else {
                    print("could not return temp")
                }
                if let summary = json["daily"]["summary"].string {
                    self.dailySummary = summary
                } else {
                     print("could not return summary")
                }
                if let icon = json["currently"]["icon"].string {
                    self.currentIcon = icon
                } else {
                    print("could not return icon")
                }
            case .failure(let error):
                print(error)
            }
            completed()
        }
    }
}
