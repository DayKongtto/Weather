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

struct City: Codable {
    let cityName: String
    let state: Int
    let celsius: Float
    let rainfallProbability: Int
    
    func getTemperatureText() -> String {
        return "섭씨 \(celsius)도 / 화씨 \((celsius * 9 / 5) + 32)도"
    }
    
    func getStateKoreanText() -> String {
        switch state {
        case 10:
            return "맑음"
        case 11:
            return "흐림"
        case 12:
            return "비"
        case 13:
            return "눈"
        default:
            return "\(state)"
        }
    }
    
    func getStateAssetText() -> String {
        switch state {
        case 10:
            return "sunny"
        case 11:
            return "cloudy"
        case 12:
            return "rainy"
        case 13:
            return "snowy"
        default:
            return "\(state)"
        }
    }
    
    func getRainFallText() -> String {
        return "강수확률 \(rainfallProbability)%"
    }
    
    enum CodingKeys: String, CodingKey {
        case state, celsius
        case cityName = "city_name"
        case rainfallProbability = "rainfall_probability"
    }
}
