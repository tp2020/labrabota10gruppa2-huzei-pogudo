//
//  DepartmentsViewController.swift
//  TPLab10
//
//  Created by Ilya Huzei on 02.06.2020.
//  Copyright © 2020 Ilya Huzei. All rights reserved.
//

import UIKit

class DepartmentsViewController: UIViewController {

    private let names = ["Therapy","Surgery","Ginechology","Venereology","Allergic"]
    @IBOutlet var departmentsList: UICollectionView!
     {
         didSet {
           // 1
           departmentsList.delegate = self
           departmentsList.dataSource = self
           // 2
           departmentsList.register(UINib.init(nibName: "PolyclinicCell", bundle: nil), forCellWithReuseIdentifier: "PolyclinicCell")
           departmentsList.backgroundColor = .clear
         }
       }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func backTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}

extension DepartmentsViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
        
    }
  
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PolyclinicCell", for: indexPath) as! PolyclinicCell
        cell.configure(name: names[indexPath.row], img:UIImage(named: "Dep\(indexPath.row)")!, flag: false)
    return cell
  }
}

extension DepartmentsViewController: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView,
                      layout collectionViewLayout: UICollectionViewLayout,
                      sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: departmentsList.bounds.width, height: 190)
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
