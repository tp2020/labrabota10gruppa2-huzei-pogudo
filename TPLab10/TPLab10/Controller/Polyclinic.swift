//
//  Polyclinic.swift
//  TPLab10
//
//  Created by Ilya Huzei on 03.06.2020.
//  Copyright © 2020 Ilya Huzei. All rights reserved.
//

import Foundation
import UIKit

class Polyclinic{
    
    private var id:Int
    private var name:String
    private var photo:UIImage
    
    public init(id:Int, name:String,photo:UIImage){
        self.id = id
        self.name = name
        self.photo = photo
    }
    
    public func getId()->Int{
        return id
    }
    
    public func getName()->String{
        return name
    }
    
    public func getPhoto()->UIImage{
        return photo
    }
}
