//
//  HospitalViewController3.swift
//  TPLab10
//
//  Created by Ilya Huzei on 02.06.2020.
//  Copyright © 2020 Ilya Huzei. All rights reserved.
//

import UIKit

class HospitalViewController3: UIViewController {
     private var hospitalList:[Hospital] = ViewController.dbConnector.getAllHosps()
    
    @IBOutlet var hospitalCollection: UICollectionView!
    {
      didSet {
        // 1
        hospitalCollection.delegate = self
        hospitalCollection.dataSource = self
        // 2
        hospitalCollection.register(UINib.init(nibName: "HospitalCell", bundle: nil), forCellWithReuseIdentifier: "HospitalCell")
        hospitalCollection.backgroundColor = .clear
      }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func backTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
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

extension HospitalViewController3: UICollectionViewDelegate, UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyBoard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let flViewC = storyBoard.instantiateViewController(withIdentifier: "DepartmentsViewController") as! DepartmentsViewController
        flViewC.modalPresentationStyle = .fullScreen
       // flViewC.airportName = airports[indexPath.row].name!
        self.present(flViewC, animated: true, completion: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return hospitalList.count
        
    }
  
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HospitalCell", for: indexPath) as! HospitalCell
        cell.configure(name: hospitalList[indexPath.row].getName(), img: hospitalList[indexPath.row].getImg())
    return cell
  }
}

extension HospitalViewController3: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView,
                      layout collectionViewLayout: UICollectionViewLayout,
                      sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: hospitalCollection.bounds.width, height: 190)
  }
  func collectionView(_ collectionView: UICollectionView,
                      layout collectionViewLayout: UICollectionViewLayout,
                      minimumLineSpacingForSectionAt section: Int) -> CGFloat {
                      return 0
  }
  
  func collectionView(_ collectionView: UICollectionView,
                      layout collectionViewLayout: UICollectionViewLayout,
                      minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
                      return 0
   }
}
