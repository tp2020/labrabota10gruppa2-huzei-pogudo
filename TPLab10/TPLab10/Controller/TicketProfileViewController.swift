//
//  TicketProfileViewController.swift
//  TPLab10
//
//  Created by Ilya Huzei on 03.06.2020.
//  Copyright © 2020 Ilya Huzei. All rights reserved.
//

import UIKit

class TicketProfileViewController: UIViewController {
    
    var ticket:Reception!
    @IBOutlet var labelPolyc: UILabel!
    @IBOutlet var labelDate: UILabel!
    
    @IBOutlet var datePicker: UIDatePicker!
    @IBOutlet var labelDoc: UILabel!
    @IBOutlet var img: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        labelPolyc.text = String(ticket.getPolyclinicId())
        labelDate.text = ticket.getDate()
        labelDoc.text = ticket.getDoctor()
        img.image = UIImage(named:"Ticket")

        // Do any additional setup after loading the view.
    }
    @IBAction func backTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func deleteTapped(_ sender: Any) {
          DispatchQueue.main.async {
        let alert = UIAlertController(title: "Confirmation", message: "Are you sure you want to delete selected ticket?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
                    switch action.style{
                    case .default:
                        ViewController.dbConnector.deleteReception(reception: self.ticket)
                        self.dismiss(animated: true, completion: nil)
                        print("default")
                    case .cancel:
                        print("cancel")
                    case .destructive:
                        print("destructive")
                        
            }
                          
        }))
            alert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: { action in
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
       
        
    }
    
    @IBAction func changeTapped(_ sender: Any) {
        var doctor:String = ticket.getDoctor()
        var localTimeZoneAbbreviation: String { return TimeZone.current.abbreviation() ?? "" }
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone(abbreviation: localTimeZoneAbbreviation)// Set your time time zone here
        dateFormatter.dateFormat = "dd.MM.yyyy HH:mm"
        dateFormatter.locale = NSLocale.current
        let selectedDate = dateFormatter.string(from: datePicker.date)
        let receptions:[Reception] = ViewController.dbConnector.getReceptionPolyclinic(id: ticket.getPolyclinicId())
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
        ViewController.dbConnector.insertReceptionDate(date: selectedDate, id: ticket.getId())
        labelDate.text = String(describing:selectedDate)
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
