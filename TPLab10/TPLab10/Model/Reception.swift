//
//  Reception.swift
//  TPLab10
//
//  Created by Ilya Huzei on 03.06.2020.
//  Copyright © 2020 Ilya Huzei. All rights reserved.
//

import Foundation

class Reception{
    private let id:Int
    private var date:String
    private var patient_id:Int
    private var polyclinic_id:Int
    private var doctor:String
    
    public init(id:Int,date:String,patient_id:Int,polyclinic_id:Int,doctor:String){
        self.id = id
        self.date = date
        self.patient_id = patient_id
        self.polyclinic_id = polyclinic_id
        self.doctor = doctor
    }
    
    public func getId()->Int{
        return id
    }
    
    public func getDate()->String{
        return date
    }
    
    public func getPtientId()->Int{
        return patient_id
    }
    
    public func getPolyclinicId()->Int{
        return polyclinic_id
    }
    
    public func getDoctor()->String{
        return doctor
    }
}
