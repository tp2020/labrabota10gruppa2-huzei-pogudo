//
//  PolyclinicsViewController.swift
//  TPLab10
//
//  Created by Ilya Huzei on 02.06.2020.
//  Copyright © 2020 Ilya Huzei. All rights reserved.
//

import UIKit
import CoreLocation
class PolyclinicsViewController: UIViewController,CLLocationManagerDelegate{
    
    private var flag:Bool = false
    private var helper :Helper!
    private var hospitalList:[Hospital]! //ViewController.dbConnector.getAllPolys()
    var locationManager = CLLocationManager()
    @IBOutlet var hospitalCollection: UICollectionView!
    {
      didSet {
        hospitalCollection.delegate = self
        hospitalCollection.dataSource = self
        hospitalCollection.register(UINib.init(nibName: "PolyclinicCell", bundle: nil), forCellWithReuseIdentifier: "PolyclinicCell")
        hospitalCollection.backgroundColor = .clear
      }
    }
    
     override func viewDidAppear(_ animated: Bool){
       }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.locationManager.requestAlwaysAuthorization()

        self.locationManager.requestWhenInUseAuthorization()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        locationManager.startUpdatingLocation()
         guard let locValue: CLLocationCoordinate2D = locationManager.location?.coordinate else { return }
        let userLat = locValue.latitude
        let userLong = locValue.longitude
        hospitalList = ViewController.dbConnector.getAllPolys()
        helper = Helper(userLong: userLong, userLat: userLat)
        helper.sortByCoord(list: &hospitalList)
            
    }
        
     @IBAction func backTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
     }
  
}

extension PolyclinicsViewController: UICollectionViewDelegate, UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyBoard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let flViewC = storyBoard.instantiateViewController(withIdentifier: "PolyProfileViewController") as! PolyProfileViewController
        flViewC.modalPresentationStyle = .fullScreen
        flViewC.polyclinic = hospitalList[indexPath.row]
        self.present(flViewC, animated: true, completion: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return hospitalList.count
        
    }
  
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PolyclinicCell", for: indexPath) as! PolyclinicCell
    cell.configure(name: hospitalList[indexPath.row].getName(), img: hospitalList[indexPath.row].getImg(),flag: hospitalList[indexPath.row].getIsAdult())
    return cell
  }
}

extension PolyclinicsViewController: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView,
                      layout collectionViewLayout: UICollectionViewLayout,
                      sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: hospitalCollection.bounds.width, height: 183)
  }
  func collectionView(_ collectionView: UICollectionView,
                      layout collectionViewLayout: UICollectionViewLayout,
                      minimumLineSpacingForSectionAt section: Int) -> CGFloat {
                      return 5
  }
  
  func collectionView(_ collectionView: UICollectionView,
                      layout collectionViewLayout: UICollectionViewLayout,
                      minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
                      return 5
   }
}
