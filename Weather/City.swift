//
//  City.swift
//  Weather
//
//  Created by PSJ on 2021/07/19.
//

import Foundation

/*
 {
    "city_name":"파리",
    "state":10,
    "celsius":11.3,
    "rainfall_probability":90
 }
 */

struct City {
    let cityName: String
    let state: Int
    let celsius: Float
    let rainfallProbability: Int
    
    enum CodingKeys: String, CodingKey {
        case state, celsius
        case cityName = "city_name"
        case rainfallProbability = "rainfall_probability"
    }
}
