//
//  Patient.swift
//  TPLab10
//
//  Created by Ilya Huzei on 03.06.2020.
//  Copyright © 2020 Ilya Huzei. All rights reserved.
//

import Foundation

class Patient{
    
    private let name:String
    private let login:String
    private let password:String
    
    public init( name:String, login:String, password:String){
        self.name = name
        self.login = login
        self.password = password
    }
    
    public func getName()->String{
        return name
    }
    
    public func getLogin()->String{
        return login
    }
    
    public func getPassword()->String{
        return password
    }
}
