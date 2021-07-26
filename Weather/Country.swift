//
//  Country.swift
//  Weather
//
//  Created by PSJ on 2021/07/19.
//

import Foundation

/*
 {"korean_name":"한국","asset_name":"kr"}
 */

struct Country: Codable {
    let koreanName: String
    let assetName: String
    
    
    enum CodingKeys: String, CodingKey {
        case koreanName = "korean_name"
        case assetName = "asset_name"
    }
}
