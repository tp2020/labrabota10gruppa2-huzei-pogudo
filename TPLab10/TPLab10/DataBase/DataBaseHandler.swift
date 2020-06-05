//
//  DataBaseHandler.swift
//  TPLab10
//
//  Created by Ilya Huzei on 02.06.2020.
//  Copyright © 2020 Ilya Huzei. All rights reserved.
//

import Foundation
import SQLite3
import UIKit

class DataBaseHandler{
    func openDb() -> OpaquePointer?{
    let databaseFilePath = Bundle.main.path(forResource: "Hospital", ofType: "db")!
    var db: OpaquePointer?
       if sqlite3_open(databaseFilePath, &db) != SQLITE_OK {
           print("error opening database")
       }
    
    return db
    }
    
    func closeDb(db: OpaquePointer?)->Bool{
        if sqlite3_close(db) != SQLITE_OK {
            print("error closing database")
            return false
        }
        return true
    }
    
    func getAllPolys()->[Hospital]{
        var hospitalList = [Hospital]()
        var statement: OpaquePointer?
        let db = openDb()
        if sqlite3_prepare_v2(db, "select * from polyclinic ", -1, &statement, nil) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("error preparing select: \(errmsg)")
        }

        while sqlite3_step(statement) == SQLITE_ROW {
            let idDb = sqlite3_column_int64(statement, 0)
            let nameDb = sqlite3_column_text(statement, 1)!
            var imgDb: UIImage!
            if let dataBlob = sqlite3_column_blob(statement, 2){
                               let dataBlobLength = sqlite3_column_bytes(statement, 2)

                               let blobNSData = NSData(bytes: dataBlob, length: Int(dataBlobLength))
                               //CRASH
                               imgDb = UIImage(data: blobNSData as Data)!
                           }
            
            let longDb = sqlite3_column_double(statement, 3)
            let latDb = sqlite3_column_double(statement, 4)
            let flag:Int = (Int(sqlite3_column_int(statement, 5)))
            var isAdult:Bool = false
            if(flag == 1){
                isAdult = true
            }
            let poly = Hospital(id: Int(idDb), name: String(cString: nameDb), longitude: longDb, latitude: latDb, img: imgDb,isAdult: isAdult)
            
            hospitalList.append(poly)

            if let cString = sqlite3_column_text(statement, 1) {
                let name = String(cString: cString)
                print("name = \(name)")
            } else {
                print("name not found")
            }
        }

        if sqlite3_finalize(statement) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("error finalizing prepared statement: \(errmsg)")
        }
        return hospitalList
        
    }
    
    func getAllHosps()->[Hospital]{
        var hospitalList = [Hospital]()
        var statement: OpaquePointer?
        let db = openDb()
        if sqlite3_prepare_v2(db, "select * from hospital ", -1, &statement, nil) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("error preparing select: \(errmsg)")
        }

        while sqlite3_step(statement) == SQLITE_ROW {
            let idDb = sqlite3_column_int64(statement, 0)
            let nameDb = sqlite3_column_text(statement, 1)!
            var imgDb: UIImage!
            if let dataBlob = sqlite3_column_blob(statement, 2){
                               let dataBlobLength = sqlite3_column_bytes(statement, 2)

                               let blobNSData = NSData(bytes: dataBlob, length: Int(dataBlobLength))
                               //CRASH
                               imgDb = UIImage(data: blobNSData as Data)!

                               //album.artworkData = NSData(bytes: dataBlob, length: Int(dataBlobLength)) as Data
                           }
            
           
            let poly = Hospital(id: Int(idDb), name: String(cString: nameDb), longitude: 0, latitude: 0, img: imgDb)
            
            hospitalList.append(poly)

            if let cString = sqlite3_column_text(statement, 1) {
                let name = String(cString: cString)
                print("name = \(name)")
            } else {
                print("name not found")
            }
        }

        if sqlite3_finalize(statement) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("error finalizing prepared statement: \(errmsg)")
        }
        return hospitalList
        
    }
    public func checkPatient(login:String, password:String)->Patient?{
        
        var statement: OpaquePointer?
        let db = openDb()
        if sqlite3_prepare_v2(db, "select * from patient where login = '\(login)' ", -1, &statement, nil) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("error preparing select: \(errmsg)")
        }

        var pat:Patient? = nil
        while sqlite3_step(statement) == SQLITE_ROW {
            if let cString = sqlite3_column_text(statement, 3) {
                let pass = String(cString: cString)
                if(pass == password){
                    //closeDb(db: db)
                    pat =  Patient(name: String(cString: sqlite3_column_text(statement, 1)), login: login, password: pass)
                }
            } else {
                print("name not found")
            }
        }

        if sqlite3_finalize(statement) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("error finalizing prepared statement: \(errmsg)")
        }
        closeDb(db: db)
        return pat
        
    }
    
    public func addPatient(pat:Patient){
        
         var statement: OpaquePointer?
               let db = openDb()
       let insertStatementString = "INSERT INTO patient (name, login, password) VALUES (?, ?, ?);"
        var insertStatement: OpaquePointer? = nil
              if sqlite3_prepare_v2(db, insertStatementString, -1, &insertStatement, nil) == SQLITE_OK {
                
                sqlite3_bind_text(insertStatement, 1, (pat.getName() as NSString).utf8String, -1,nil)
                sqlite3_bind_text(insertStatement, 2, (pat.getLogin() as NSString).utf8String, -1, nil)
                   sqlite3_bind_text(insertStatement, 3, (pat.getPassword() as NSString).utf8String, -1, nil)
                  
                  if sqlite3_step(insertStatement) == SQLITE_DONE {
                      print("Successfully inserted row.")
                  } else {
                      print("Could not insert row.")
                  }
              } else {
                  print("INSERT statement could not be prepared.")
              }
              sqlite3_finalize(insertStatement)
        closeDb(db: db)
    }
    
    public func addReception(reception:Reception){
        let db = openDb()
        let insertStatementString = "INSERT INTO reception (date, patient_id, polyclinic_id, doctor) VALUES (?, ?, ?, ?);"
         var insertStatement: OpaquePointer? = nil
               if sqlite3_prepare_v2(db, insertStatementString, -1, &insertStatement, nil) == SQLITE_OK {
                 
            sqlite3_bind_text(insertStatement, 1, (reception.getDate() as NSString).utf8String, -1,nil)
            sqlite3_bind_int(insertStatement, 2, Int32(reception.getPtientId()))
            sqlite3_bind_int(insertStatement, 3, Int32(reception.getPolyclinicId()))
                sqlite3_bind_text(insertStatement, 4, (reception.getDoctor() as NSString).utf8String, -1,nil)
                if sqlite3_step(insertStatement) == SQLITE_DONE {
                    print("Successfully inserted row.")
                
            } else {
                print("Could not insert row.")
                }
                
               } else {
                   print("INSERT statement could not be prepared.")
               }
            sqlite3_finalize(insertStatement)
         closeDb(db: db)
        
    }
    
    public func getPatId(login:String)->Int{
         var statement: OpaquePointer?
               let db = openDb()
               if sqlite3_prepare_v2(db, "select id from patient where login = '\(login)' ", -1, &statement, nil) != SQLITE_OK {
                   let errmsg = String(cString: sqlite3_errmsg(db)!)
                   print("error preparing select: \(errmsg)")
               }
        var id:Int = -1
               while sqlite3_step(statement) == SQLITE_ROW {
                id = Int(sqlite3_column_int(statement, 0))
                //closeDb(db: db)
             //   return Int(id)
               }

               if sqlite3_finalize(statement) != SQLITE_OK {
                   let errmsg = String(cString: sqlite3_errmsg(db)!)
                   print("error finalizing prepared statement: \(errmsg)")
               }
               closeDb(db: db)
        return id
        
    }
    
    public func getPatReceptions(patient:Patient, polyclinic:Hospital)->[Reception]{
        var receptionlList = [Reception]()
        var statement: OpaquePointer?
        let id = getPatId(login: patient.getLogin())
        let db = openDb()
        if sqlite3_prepare_v2(db, "select * from reception where patient_id = \(id)  and polyclinic_id = \(polyclinic.getId())", -1, &statement, nil) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("error preparing select: \(errmsg)")
        }

        while sqlite3_step(statement) == SQLITE_ROW {
            let idDb = sqlite3_column_int64(statement, 0)
            let dateDb = sqlite3_column_text(statement, 1)!
            let patientId = sqlite3_column_int(statement, 2)
            let polyclinicId = sqlite3_column_int(statement, 3)
            let doctor = sqlite3_column_text(statement, 4)!
            receptionlList.append(Reception(id: Int(idDb), date: String(cString: dateDb), patient_id: Int(patientId), polyclinic_id: Int(polyclinicId), doctor: String(cString: doctor)))
        }

        if sqlite3_finalize(statement) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("error finalizing prepared statement: \(errmsg)")
        }
        closeDb(db: db)
        return receptionlList
    }
    
    public func deleteReception(reception:Reception){
        let db = openDb()
        if sqlite3_exec(db, "delete from reception where id = \(reception.getId())", nil, nil, nil) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("error creating table: \(errmsg)")
        }
        closeDb(db: db)
    }
    
    public func insertReceptionDate(date:String,id:Int){
       // UPDATE table1 SET name = ‘Людмила Иванова’ WHERE id = 2
        let db = openDb()
        let insertStatementString = "UPDATE reception SET date = ? WHERE id = ?;"
        var insertStatement: OpaquePointer? = nil
        if sqlite3_prepare_v2(db, insertStatementString, -1, &insertStatement, nil) == SQLITE_OK {
            sqlite3_bind_text(insertStatement, 1, (date as NSString).utf8String, -1,nil)
            sqlite3_bind_int(insertStatement, 2, Int32(id))
        if sqlite3_step(insertStatement) == SQLITE_DONE {
            print("Successfully inserted row.")
            
        } else {
            print("Could not insert row.")
        }
                       
        } else {
            print("INSERT statement could not be prepared.")
        }
        sqlite3_finalize(insertStatement)
        closeDb(db: db)
        
        
    }
    
    public func getReceptionPolyclinic(id:Int)->[Reception]{
         var receptionlList = [Reception]()
               var statement: OpaquePointer?
               let db = openDb()
               if sqlite3_prepare_v2(db, "select * from reception where polyclinic_id = \(id)  ", -1, &statement, nil) != SQLITE_OK {
                   let errmsg = String(cString: sqlite3_errmsg(db)!)
                   print("error preparing select: \(errmsg)")
               }

               while sqlite3_step(statement) == SQLITE_ROW {
                   let idDb = sqlite3_column_int64(statement, 0)
                   let dateDb = sqlite3_column_text(statement, 1)!
                   let patientId = sqlite3_column_int(statement, 2)
                   let polyclinicId = sqlite3_column_int(statement, 3)
                   let doctor = sqlite3_column_text(statement, 4)!
                   receptionlList.append(Reception(id: Int(idDb), date: String(cString: dateDb), patient_id: Int(patientId), polyclinic_id: Int(polyclinicId), doctor: String(cString: doctor)))
               }

               if sqlite3_finalize(statement) != SQLITE_OK {
                   let errmsg = String(cString: sqlite3_errmsg(db)!)
                   print("error finalizing prepared statement: \(errmsg)")
               }
               closeDb(db: db)
               return receptionlList
        
    }
    
    
}
