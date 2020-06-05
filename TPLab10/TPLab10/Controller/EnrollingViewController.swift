//
//  EnrollingViewController.swift
//  TPLab10
//
//  Created by Ilya Huzei on 03.06.2020.
//  Copyright © 2020 Ilya Huzei. All rights reserved.
//

import UIKit

class EnrollingViewController: UIViewController {

    @IBOutlet var doctorControl: UISegmentedControl!
    @IBOutlet var datePicker: UIDatePicker!
    public var polyclinic:Hospital!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func backTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func registerTapped(_ sender: Any) {
        var doctor:String
         switch doctorControl.selectedSegmentIndex {
        case 0:
            doctor = "Therapist"
            break
        case 1:
            doctor = "Pediatrician"
         case 2:
            doctor = "Neurologist"
            break
         case 3:
            doctor = "Oculist"
            break
         default:
            doctor = "ENT"
            
        }
        var localTimeZoneAbbreviation: String { return TimeZone.current.abbreviation() ?? "" }
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone(abbreviation: localTimeZoneAbbreviation)// Set your time time zone here
        dateFormatter.dateFormat = "dd.MM.yyyy HH:mm"
        dateFormatter.locale = NSLocale.current
        let selectedDate = dateFormatter.string(from: datePicker.date)
        let receptions:[Reception] = ViewController.dbConnector.getReceptionPolyclinic(id: polyclinic.getId())
        for item in receptions{
            if(item.getDate() == selectedDate && item.getDoctor() == doctor ){
                  DispatchQueue.main.async {
                      let alert = UIAlertController(title: "Error", message: "This time is already taken", preferredStyle: .alert)
                      alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
                                  switch action.style{
                                  case .default:
                                      print("default")
                                  case .cancel:
                                      print("cancel")
                                  case .destructive:
                                      print("destructive")
                                      
                          }
                                        
                      }))
                      self.present(alert, animated: true, completion: nil)
                                    
                      }
                return
            }
        }
    ViewController.dbConnector.addReception(reception: Reception(id:0,date: selectedDate, patient_id:ViewController.dbConnector.getPatId(login: AccountViewController.patient.getLogin()), polyclinic_id: polyclinic.getId(), doctor: doctor))
           
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
