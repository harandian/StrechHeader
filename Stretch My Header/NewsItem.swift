//
//  NewsItem.swift
//  Stretch My Header
//
//  Created by Hirad on 2017-08-29.
//  Copyright © 2017 Hirad. All rights reserved.
//

import Foundation
import UIKit


struct  NewsItem {
    
   
    enum type {
        case world, americas, europe, middleEast, africa, asiaPacific
    }
    
    var newsColor = UIColor()
    var newsHeadLine = String()
    var newsBody = String ()
    
    init(withType: type) {
        switch withType {
        case .world:
            newsColor = UIColor.red
            newsHeadLine = "World"
            newsBody = "Climate change protests, divestments meet fossil fuels realities"
        case .middleEast:
            newsColor = UIColor.yellow
            newsHeadLine = "Middle East"
            newsBody = "Airstrikes boost Islamic State, FBI director warns more hostages possible"
        case .africa:
            newsColor = UIColor.orange
            newsHeadLine = "Africa"
            newsBody = "Nigeria says 70 dead in building collapse; questions S. Africa victim claim"
        case .europe:
            newsColor = UIColor.green
            newsHeadLine = "Europe"
            newsBody = "Scotland's 'Yes' leader says independence vote is 'once in a lifetime'"
        case .americas:
            newsColor = UIColor.blue
            newsHeadLine = "Americas"
            newsBody = "Officials: FBI is tracking 100 Americans who fought alongside IS in Syria"
        case .asiaPacific:
            newsColor = UIColor.purple
            newsHeadLine = "Asia Pacific"
            newsBody = "Despite UN ruling, Japan seeks backing for whale hunting"            
//        default:
//            <#code#>
        }
    }
    
}

