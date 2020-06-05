//
//  PolyProfileViewController.swift
//  TPLab10
//
//  Created by Ilya Huzei on 02.06.2020.
//  Copyright © 2020 Ilya Huzei. All rights reserved.
//

import UIKit
import MapKit

class PolyProfileViewController: UIViewController {
    @IBOutlet var nameLabel: UILabel!
    
    @IBOutlet var img: UIImageView!
    var polyclinic:Hospital!
    var ann:MKAnnotation!
    @IBOutlet var map: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        img.image = polyclinic.getImg()
        nameLabel.text = polyclinic.getName()
        setupData(a: polyclinic.getLongitude(), b: polyclinic.getLatitude())

        // Do any additional setup after loading the view.
    }
    
    @IBAction func terapTapped(_ sender: Any) {
        let storyBoard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
         let flViewC = storyBoard.instantiateViewController(withIdentifier: "EnrollingViewController") as! EnrollingViewController
        flViewC.polyclinic = polyclinic
         flViewC.modalPresentationStyle = .fullScreen
         self.present(flViewC, animated: true, completion: nil)
        
    }
   
  
    @IBAction func ticketed(_ sender: UIButton) {
        print("hello")
        let storyBoard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let flViewC = storyBoard.instantiateViewController(withIdentifier: "TicketsViewController") as! TicketsViewController
        flViewC.modalPresentationStyle = .fullScreen
        flViewC.polyclinic = polyclinic
        self.present(flViewC, animated: true, completion: nil)
        
    }
    
    
    @IBAction func backTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
     func setupData(a:Double, b:Double) {
           // 1. check if system can monitor regions
           if CLLocationManager.isMonitoringAvailable(for: CLCircularRegion.self) {
               // 2. region data
               let coordinate = CLLocationCoordinate2DMake(a, b)
               // 4. setup annotation
               let annotation = MKPointAnnotation()
               annotation.coordinate = coordinate;
            annotation.title = polyclinic.getName();
               map.addAnnotation(annotation)
               ann = annotation
           
            let span = MKCoordinateSpan.init(latitudeDelta: 0.01, longitudeDelta: 0.01)
               let region = MKCoordinateRegion.init(center: (coordinate), span: span)
               map.setRegion(region, animated: true)
           }
           else {
               print("System can't track regions")
           }
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
