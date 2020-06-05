//
//  Helper.swift
//  TPLab10
//
//  Created by Ilya Huzei on 03.06.2020.
//  Copyright © 2020 Ilya Huzei. All rights reserved.
//

import Foundation
import MapKit
import CoreLocation
class Helper{
  
    
    
    private var userLong:Double
    private var userLat:Double
    public init(userLong:Double, userLat:Double){
        self.userLong = userLong
        self.userLat = userLat
        
    }
    
    
    private func getDistance(longA:Double,latA:Double,longB:Double,latB:Double)->Double{
        return abs(acos(sin(latA) * sin(latB) + cos(latA) * cos(latB) * cos(longA - longB)))
    }
    
    public func sortByCoord( list:inout [Hospital]){
       
        list.sort {getDistance(longA: $0.getLongitude(), latA: $0.getLatitude(), longB: userLong, latB: userLat) < getDistance(longA: $1.getLongitude(), latA: $1.getLatitude(), longB: userLong, latB: userLat)}
        
    }
}
