//
//  NewsItem.swift
//  StretchyHeaders
//
//  Created by 洪德晟 on 2017/7/27.
//  Copyright © 2017年 洪德晟. All rights reserved.
//

import UIKit

struct NewsItem {
    enum NewsCateory {
        case World
        case Americas
        case Eurpoe
        case MiddleEast
        case Africa
        case AsiaPacific
        
        func toString() -> String {
            switch self {
            case .World:
                return "World"
            case .Americas:
                return "Americas"
            case .Eurpoe:
                return "Eurpoe"
            case .MiddleEast:
                return "MiddleEast"
            case .Africa:
                return "Africa"
            case .AsiaPacific:
                return "AsiaPacific"
            }
        }
        
        func toColor() -> UIColor {
            switch self {
            case .World:
                return UIColor(red: 0.106, green: 0.686, blue: 0.125, alpha: 1)
            case .Americas:
                return UIColor(red: 0.114, green: 0.639, blue: 0.984, alpha: 1)
            case .Eurpoe:
                return UIColor(red: 0.322, green: 0.459, blue: 0.984, alpha: 1)
            case .MiddleEast:
                return UIColor(red: 0.502, green: 0.290, blue: 0.984, alpha: 1)
            case .Africa:
                return UIColor(red: 0.988, green: 0.271, blue: 0.282, alpha: 1)
            case .AsiaPacific:
                return UIColor(red: 0.620, green: 0.776, blue: 0.153, alpha: 1)
            }
        }
    }
    
    let category: NewsCateory
    let summary: String
}
