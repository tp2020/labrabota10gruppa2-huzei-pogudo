//
//  Hospital.swift
//  TPLab10
//
//  Created by Ilya Huzei on 02.06.2020.
//  Copyright © 2020 Ilya Huzei. All rights reserved.
//

import Foundation
import UIKit

class Hospital{
    private var id:Int
    private var name:String
    private var longitude:Double
    private var latitude:Double
    private var img:UIImage
    private var isAdult:Bool
    
    public init(id:Int, name:String, longitude:Double, latitude:Double,img:UIImage,isAdult:Bool = false){
        self.id = id
        self.name = name
        self.longitude = longitude
        self.latitude = latitude
        self.img = img
        self.isAdult = isAdult
    }
    
    public func getId()->Int{
        return id
    }
    
    public func getName()->String{
        return name
    }
    
    public func getLongitude()->Double{
        return longitude
    }
    
    public func getLatitude()->Double{
        return latitude
    }
    
    public func getImg()->UIImage{
        return img
    }
    
    public func getIsAdult()->Bool{
        return isAdult
    }
    
}
